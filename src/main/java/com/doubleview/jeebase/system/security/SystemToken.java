package com.doubleview.jeebase.system.security;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 用户密码令牌类
 */
public class SystemToken extends UsernamePasswordToken {


    private  String captcha;


    public SystemToken(){
        super();
    }

    public  SystemToken(String username, char[] password,
                        boolean rememberMe, String host, String captcha){
        super(username , password , rememberMe , host);
        this.captcha = captcha;
    }


    public String getCaptcha() {
        return captcha;
    }

    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }
}
