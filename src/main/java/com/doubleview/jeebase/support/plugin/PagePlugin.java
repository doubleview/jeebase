package com.doubleview.jeebase.support.plugin;

import com.doubleview.jeebase.support.persistence.dialect.Dialect;
import com.doubleview.jeebase.support.persistence.dialect.MySQLDialect;
import com.doubleview.jeebase.support.persistence.dialect.OracleDialect;
import com.doubleview.jeebase.support.utils.ReflectUtils;
import com.doubleview.jeebase.support.web.Page;
import org.apache.commons.lang3.Validate;
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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Objects;
import java.util.Properties;

/**
 * MyBatis分页插件
 */
@Intercepts({@Signature(type = StatementHandler.class, method = "prepare", args = {Connection.class})})
public class PagePlugin implements Interceptor {

    private Logger logger = LoggerFactory.getLogger(PagePlugin.class);
    private Dialect dialect;    //数据库方言

    public Object intercept(Invocation ivk) throws Throwable {
        logger.debug("start to generate page sql");
        if (ivk.getTarget() instanceof RoutingStatementHandler) {
            RoutingStatementHandler statementHandler = (RoutingStatementHandler) ivk.getTarget();
            BaseStatementHandler delegate = (BaseStatementHandler) ReflectUtils.getValueByFieldName(statementHandler, "delegate");
            MappedStatement mappedStatement = (MappedStatement) ReflectUtils.getValueByFieldName(delegate, "mappedStatement");

            BoundSql boundSql = delegate.getBoundSql();
            Object parameterObject = boundSql.getParameterObject();//分页SQL<select>中parameterType属性对应的实体参数，即Mapper接口中执行分页方法的参数,该参数不得为空

            Page<Object> page = null;

            if (parameterObject != null) {
                if (parameterObject instanceof Page) {
                    page = (Page<Object>) parameterObject;
                } else {
                    page = (Page<Object>) ReflectUtils.getValueByFieldName(parameterObject, "page");
                }
            } else {
                throw new NullPointerException("parameterObject尚未实例化！");
            }

            if (page == null) {
                return ivk.proceed();
            }
            //查找此次查询的条数
            Connection connection = (Connection) ivk.getArgs()[0];
            String sql = boundSql.getSql();
            String fhsql = sql;
            String countSql = "select count(0) from (" + fhsql + ")  tmp_count"; //记录统计
            PreparedStatement countStmt = connection.prepareStatement(countSql);
            BoundSql countBS = new BoundSql(mappedStatement.getConfiguration(), countSql, boundSql.getParameterMappings(), parameterObject);
            setParameters(countStmt, mappedStatement, countBS, parameterObject);
            ResultSet rs = countStmt.executeQuery();
            int count = 0;
            if (rs.next()) {
                count = rs.getInt(1);
            }
            rs.close();
            countStmt.close();
            page.setTotalSize(count);
            String pageSql = generatePageSql(sql, page);
            ReflectUtils.setValueByFieldName(boundSql, "sql", pageSql); //将分页sql语句反射回BoundSql.
        }
        logger.debug("end to generate the page sql");
        return ivk.proceed();
    }


    /**
     * 对SQL参数(?)设值,参考org.apache.ibatis.executor.parameter.DefaultParameterHandler
     *
     * @param ps
     * @param mappedStatement
     * @param boundSql
     * @param parameterObject
     * @throws SQLException
     */
    private void setParameters(PreparedStatement ps, MappedStatement mappedStatement, BoundSql boundSql, Object parameterObject) throws SQLException {
        ErrorContext.instance().activity("setting parameters").object(mappedStatement.getParameterMap().getId());
        List<ParameterMapping> parameterMappings = boundSql.getParameterMappings();
        if (parameterMappings != null) {
            Configuration configuration = mappedStatement.getConfiguration();
            TypeHandlerRegistry typeHandlerRegistry = configuration.getTypeHandlerRegistry();
            MetaObject metaObject = parameterObject == null ? null : configuration.newMetaObject(parameterObject);
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
                    } else if (propertyName.startsWith(ForEachSqlNode.ITEM_PREFIX) && boundSql.hasAdditionalParameter(prop.getName())) {
                        value = boundSql.getAdditionalParameter(prop.getName());
                        if (value != null) {
                            value = configuration.newMetaObject(value).getValue(propertyName.substring(prop.getName().length()));
                        }
                    } else {
                        value = metaObject == null ? null : metaObject.getValue(propertyName);
                    }
                    TypeHandler typeHandler = parameterMapping.getTypeHandler();
                    if (typeHandler == null) {
                        throw new ExecutorException("There was no TypeHandler found for parameter " + propertyName + " of statement " + mappedStatement.getId());
                    }
                    typeHandler.setParameter(ps, i + 1, value, parameterMapping.getJdbcType());
                }
            }
        }
    }


    /**
     * 根据数据库方言，生成特定的分页sql
     *
     * @param sql  原始sql
     * @param page 页面对象
     * @return
     */
    private String generatePageSql(String sql, Page page) {
        if (dialect.supportsLimit()) {
            return dialect.getLimitString(sql, page.getFirstResult(), page.getPageSize());
        } else {
            return sql;
        }
    }

    public Object plugin(Object arg0) {
        return Plugin.wrap(arg0, this);
    }


    @Override
    public void setProperties(Properties p) {
        //取得数据库类型
        if(Objects.nonNull(dialect)){
            return;
        }
        String dialectType = p.getProperty("jdbc.type");
        initDialect(dialectType);
    }

    /**
     * 初始化数据库方言
     *
     * @param dialectType
     */
    private void initDialect(String dialectType) {
        Validate.notBlank(dialectType);
        Dialect dialect = null;
        if ("mysql".equals(dialectType)) {
            dialect = new MySQLDialect();
        } else if ("oracle".equals(dialectType)) {
            dialect = new OracleDialect();
        }
        this.dialect = dialect;
    }

}

