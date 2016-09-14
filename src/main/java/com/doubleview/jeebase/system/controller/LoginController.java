package com.doubleview.jeebase.system.controller;

import com.doubleview.jeebase.support.base.BaseController;
import com.doubleview.jeebase.support.render.Render;
import com.doubleview.jeebase.system.model.User;
import com.doubleview.jeebase.system.utils.ShiroUtils;
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

    /**
     * 请求登录页面
     * @return
     */
    @RequestMapping(value = "/login")
    public String forwardToLogin(){
        User user = ShiroUtils.getCurrentUser();
        if(user != null){
            return "redirect:" + adminPath + "/main";
        }else {
            return "login";
        }
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
