package com.doubleview.jeebase.system.security;

import com.doubleview.jeebase.support.render.CaptchaRender;
import com.doubleview.jeebase.support.utils.ServletUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**'
 * 系统表单验证shiro过滤器
 */
public class SystemAuthenticationFilter extends FormAuthenticationFilter{

    public static final String DEFAULT_MESSAGE_PARAM = "message";//验证消息

    private String captchaParam = CaptchaRender.captchaName;

    private String messageParam = DEFAULT_MESSAGE_PARAM;

    /**
     * 根据请求创建认证授权令牌对象
     * @param request
     * @param response
     * @return
     */
    @Override
    protected AuthenticationToken createToken(ServletRequest request, ServletResponse response) {
        String username = getUsername(request);
        String password = getPassword(request);
        if (password==null){
            password = "";
        }
        boolean rememberMe = isRememberMe(request);
        String host = ServletUtils.getRemoteAddr((HttpServletRequest) request);
        String captcha = getCaptcha(request);
        return new SystemToken(username, password.toCharArray(), rememberMe, host, captcha);
    }

    /**
     * 得到验证码参数
     * @return
     */
    public String getCaptchaParam() {
        return captchaParam;
    }


    /**
     * 得到验证码
     * @param request
     * @return
     */
    protected String getCaptcha(ServletRequest request) {
        return WebUtils.getCleanParam(request, getCaptchaParam());
    }


    /**
     * 得到验证参数
     * @return
     */
    public String getMessageParam() {
        return messageParam;
    }

    /**
     * 登录失败调用事件
     */
    @Override
    protected boolean onLoginFailure(AuthenticationToken token,
                                     AuthenticationException e, ServletRequest request, ServletResponse response) {
        String className = e.getClass().getName();
        String message;
        if (IncorrectCredentialsException.class.getName().equals(className)
                || UnknownAccountException.class.getName().equals(className)){
            message = "用户名或密码错啦，请重试";
        }
        else if (e.getMessage() != null && StringUtils.startsWith(e.getMessage(), "error:")){
            message = StringUtils.replace(e.getMessage(), "error:", "");
        }
        else{
            message = "系统有点问题，稍后重试";
            e.printStackTrace(); // 输出到控制台
        }
        request.setAttribute(getFailureKeyAttribute(), className);
        request.setAttribute(getMessageParam(), message);
        return true;
    }

}
