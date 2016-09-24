package com.doubleview.jeebase.system.controller;

import com.doubleview.jeebase.support.base.BaseController;
import com.doubleview.jeebase.support.config.Constant;
import com.doubleview.jeebase.support.render.Render;
import com.doubleview.jeebase.system.model.User;
import com.doubleview.jeebase.system.utils.ShiroUtils;
import com.doubleview.jeebase.system.utils.SystemCacheUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public String forwardToLogin(Model model){
        User user = ShiroUtils.getCurrentUser();
        //若已经登录，直接重定向到主页
        if(user != null){
            return "redirect:" + adminPath + "/index";
        }else {
            model.addAttribute("productName" , Constant.getProductName());
            return "login";
        }
    }


    /**
     * 登录成功，请求主页
     * @return
     */
    @RequestMapping("/index")
    public String mainIndex(Model model){
        User user = ShiroUtils.getCurrentUser();
        model.addAttribute("currentUser" , user);
        model.addAttribute("menuList" , SystemCacheUtils.getCurrentMenuList());
        return "index";
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
