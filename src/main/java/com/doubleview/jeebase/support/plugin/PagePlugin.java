package com.doubleview.jeebase.support.plugin;

import com.doubleview.jeebase.support.utils.ReflectUtils;
import com.doubleview.jeebase.support.web.Page;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.executor.ErrorContext;
import org.apache.ibatis.executor.ExecutorException;
import org.apache.ibatis.executor.statement.BaseStatementHandler;
import org.apache.ibatis.executor.statement.RoutingStatementHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.mapping.ParameterMode;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.property.PropertyTokenizer;
import org.apache.ibatis.scripting.xmltags.ForEachSqlNode;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.type.TypeHandler;
import org.apache.ibatis.type.TypeHandlerRegistry;

import javax.xml.bind.PropertyException;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

/**
 * MyBatis分页插件
 */
@Intercepts({@Signature(type=StatementHandler.class,method="prepare",args={Connection.class})})
public class PagePlugin implements Interceptor {

    private static String dialect = "";	//数据库方言
    private static String pageSqlId = ""; //mapper.xml中需要拦截的ID(正则匹配)

    public Object intercept(Invocation ivk) throws Throwable {
        // TODO Auto-generated method stub
        if(ivk.getTarget() instanceof RoutingStatementHandler){
            RoutingStatementHandler statementHandler = (RoutingStatementHandler)ivk.getTarget();
            BaseStatementHandler delegate = (BaseStatementHandler) ReflectUtils.getValueByFieldName(statementHandler, "delegate");
            MappedStatement mappedStatement = (MappedStatement) ReflectUtils.getValueByFieldName(delegate, "mappedStatement");

            if(mappedStatement.getId().matches(pageSqlId)){ //拦截需要分页的SQL
                BoundSql boundSql = delegate.getBoundSql();
                Object parameterObject = boundSql.getParameterObject();//分页SQL<select>中parameterType属性对应的实体参数，即Mapper接口中执行分页方法的参数,该参数不得为空
                if(parameterObject==null){
                    throw new NullPointerException("parameterObject尚未实例化！");
                }else{
                    Connection connection = (Connection) ivk.getArgs()[0];
                    String sql = boundSql.getSql();
                    String fhsql = sql;
                    String countSql = "select count(0) from (" + fhsql+ ")  tmp_count"; //记录统计
                    PreparedStatement countStmt = connection.prepareStatement(countSql);
                    BoundSql countBS = new BoundSql(mappedStatement.getConfiguration(),countSql,boundSql.getParameterMappings(),parameterObject);
                    setParameters(countStmt,mappedStatement,countBS,parameterObject);
                    ResultSet rs = countStmt.executeQuery();
                    int count = 0;
                    if (rs.next()) {
                        count = rs.getInt(1);
                    }
                    rs.close();
                    countStmt.close();
                    //System.out.println(count);
                    Page page = null;
                    if(parameterObject instanceof Page){	//参数就是Page实体
                        page = (Page) parameterObject;
                        //page.setEntityOrField(true);
                        page.setTotalSize(count);
                    }else{	//参数为某个实体，该实体拥有Page属性
                        Field pageField = ReflectUtils.getFieldByFieldName(parameterObject,"page");
                        if(pageField!=null){
                            page = (Page) ReflectUtils.getValueByFieldName(parameterObject,"page");
                            if(page==null)
                                page = new Page();
                            //page.setEntityOrField(false);
                            page.setTotalSize(count);
                            ReflectUtils.setValueByFieldName(parameterObject, "page", page); //通过反射，对实体对象设置分页对象
                        }else{
                            throw new NoSuchFieldException(parameterObject.getClass().getName()+"不存在 page 属性！");
                        }
                    }
                    String pageSql = generatePageSql(sql,page);
                    ReflectUtils.setValueByFieldName(boundSql, "sql", pageSql); //将分页sql语句反射回BoundSql.
                }
            }
        }
        return ivk.proceed();
    }


    /**
     * 对SQL参数(?)设值,参考org.apache.ibatis.executor.parameter.DefaultParameterHandler
     * @param ps
     * @param mappedStatement
     * @param boundSql
     * @param parameterObject
     * @throws SQLException
     */
    private void setParameters(PreparedStatement ps,MappedStatement mappedStatement,BoundSql boundSql,Object parameterObject) throws SQLException {
        ErrorContext.instance().activity("setting parameters").object(mappedStatement.getParameterMap().getId());
        List<ParameterMapping> parameterMappings = boundSql.getParameterMappings();
        if (parameterMappings != null) {
            Configuration configuration = mappedStatement.getConfiguration();
            TypeHandlerRegistry typeHandlerRegistry = configuration.getTypeHandlerRegistry();
            MetaObject metaObject = parameterObject == null ? null: configuration.newMetaObject(parameterObject);
            for (int i = 0; i < parameterMappings.size(); i++) {
                ParameterMapping parameterMapping = parameterMappings.get(i);
                if (parameterMapping.getMode() != ParameterMode.OUT) {
                    Object value;
                    String propertyName = parameterMapping.getProperty();
                    PropertyTokenizer prop = new PropertyTokenizer(propertyName);
                    if (parameterObject == null) {
                        value = null;
                    } else if (typeHandlerRegistry.hasTypeHandler(parameterObject.getClass())) {
                        value = parameterObject;
                    } else if (boundSql.hasAdditionalParameter(propertyName)) {
                        value = boundSql.getAdditionalParameter(propertyName);
                    } else if (propertyName.startsWith(ForEachSqlNode.ITEM_PREFIX)&& boundSql.hasAdditionalParameter(prop.getName())) {
                        value = boundSql.getAdditionalParameter(prop.getName());
                        if (value != null) {
                            value = configuration.newMetaObject(value).getValue(propertyName.substring(prop.getName().length()));
                        }
                    } else {
                        value = metaObject == null ? null : metaObject.getValue(propertyName);
                    }
                    TypeHandler typeHandler = parameterMapping.getTypeHandler();
                    if (typeHandler == null) {
                        throw new ExecutorException("There was no TypeHandler found for parameter "+ propertyName + " of statement "+ mappedStatement.getId());
                    }
                    typeHandler.setParameter(ps, i + 1, value, parameterMapping.getJdbcType());
                }
            }
        }
    }

    /**
     * 根据数据库方言，生成特定的分页sql
     * @param sql
     * @param page
     * @return
     */
    private String generatePageSql(String sql,Page page){
        if(page!=null && StringUtils.isNotBlank(dialect)){
            StringBuffer pageSql = new StringBuffer();
            if("mysql".equals(dialect)){
                pageSql.append(sql);
                pageSql.append(" limit "+page.getPageNo()+","+page.getPageSize());
            }
            return pageSql.toString();
        }else{
            return sql;
        }
    }

    public Object plugin(Object arg0) {
        // TODO Auto-generated method stub
        return Plugin.wrap(arg0, this);
    }

    public void setProperties(Properties p) {
        dialect = p.getProperty("dialect");
        if (StringUtils.isNotBlank(dialect)) {
            try {
                throw new PropertyException("dialect property is not found!");
            } catch (PropertyException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        pageSqlId = p.getProperty("pageSqlId");
        if (StringUtils.isNotBlank(dialect)) {
            try {
                throw new PropertyException("pageSqlId property is not found!");
            } catch (PropertyException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

}

