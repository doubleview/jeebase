package com.doubleview.jeebase.system.controller;

import com.doubleview.jeebase.support.base.BaseController;
import com.doubleview.jeebase.support.render.Render;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录控制器
 */
@RequestMapping("/admin")
@Controller
public class LoginController extends BaseController{


    @RequestMapping("/login")
    public String login(){
        return "login";
    }


    /**
     * 验证码请求
     * @param request
     * @param response
     */
    @RequestMapping("/validateCode")
    public void validateCode(HttpServletRequest request, HttpServletResponse response){
        Render render = renderFactory.getCaptchaRender();
        render(request , response , render);
    }

}
