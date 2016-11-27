package com.doubleview.jeebase.support.base;

import com.doubleview.jeebase.support.render.Render;
import com.doubleview.jeebase.support.render.RenderFactory;
import com.doubleview.jeebase.support.utils.DateTimeUtils;
import com.doubleview.jeebase.support.web.ResponseResult;
import com.doubleview.jeebase.support.web.TreeDataResult;
import com.doubleview.jeebase.system.model.Menu;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.BindException;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;
import javax.validation.ValidationException;
import java.beans.PropertyEditorSupport;
import java.util.Date;
import java.util.List;

/**
 * Controller基础接口
 */
public abstract class BaseController {

    /**
     * 日志对象
     */
    protected Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * Render工厂
     */
    protected RenderFactory renderFactory = RenderFactory.custome();

    /**
     * 后台基础路径
     */
    @Value("${adminPath}")
    protected String adminPath;

    /**
     * 前台基础路径
     */
    @Value("${frontPath}")
    protected String frontPath;

    /**
     * 前端URL后缀
     */
    @Value("${urlSuffix}")
    protected String urlSuffix;

    /**
     * 响应浏览器
     * @param request
     * @param response
     * @param render
     */
    protected void render(HttpServletRequest request , HttpServletResponse response , Render render){
        render.setWebContext(request,response);
        render.render();
    }


    @ExceptionHandler
    protected String handleException(Exception ex){
        logger.error(ex.getMessage() , ex);
        return "error/500";
    }

    /**
     * 返回Ajax成功数据
     * @return
     */
    protected <T> ResponseResult<T> success(T data){
        return success(data , "success");
    }

    /**
     * 返回Ajax成功数据
     * @return
     */
    protected <T> ResponseResult<T> success(T data,String message){
        return ResponseResult.success(data, message);
    }

    /**
     * 返回Ajax失败数据
     * @return
     */
    protected ResponseResult fail(){
        return fail("fail");
    }

    /**
     * 返回Ajax失败数据
     * @return
     */
    protected ResponseResult fail(String message){
        return ResponseResult.fail(message);
    }


    /**
     * 初始化数据绑定
     */
    @InitBinder
    protected void initBinder(WebDataBinder binder) {

        // String类型转换，将所有传递进来的String进行HTML编码，防止XSS攻击
        binder.registerCustomEditor(String.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                setValue(text == null ? null : StringEscapeUtils.escapeHtml4(text.trim()));
            }

            @Override
            public String getAsText() {
                Object value = getValue();
                return value != null ? value.toString() : "";
            }
        });

        // Date 类型转换
        binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                setValue(DateTimeUtils.parseDate(text));
            }

            @Override
            public String getAsText() {
                Object value = getValue();
                return value != null ? DateTimeUtils.formatDateTime((Date) value) : "";
            }
        });
    }
}
