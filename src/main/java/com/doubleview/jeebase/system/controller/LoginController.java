package com.doubleview.jeebase.system.controller;

import com.doubleview.jeebase.support.base.BaseController;
import com.doubleview.jeebase.support.render.Render;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录控制器
 */
@RequestMapping("/admin")
@Controller
public class LoginController extends BaseController{


    /**
     * 登录失败
     * @return
     */
    @RequestMapping(value = "/login" , method = RequestMethod.POST)
    public String login(){
        return  null;
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
