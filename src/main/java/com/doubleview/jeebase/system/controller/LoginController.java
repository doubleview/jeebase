package com.doubleview.jeebase.system.controller;

import com.doubleview.jeebase.support.base.BaseController;
import com.doubleview.jeebase.support.config.Constant;
import com.doubleview.jeebase.support.render.Render;
import com.doubleview.jeebase.system.model.User;
import com.doubleview.jeebase.system.utils.ShiroUtils;
import com.doubleview.jeebase.system.utils.SystemCacheUtils;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录控制器
 */
@RequestMapping("/${adminPath}")
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
        Session session = ShiroUtils.getSession();
        if(session == null){
            return "redirect:" + adminPath + "/index";
        }
        logger.debug("login sessionId : {}" , session.getId());
        logger.debug("login host : {}" , session.getHost());
        logger.debug("login timeout : {}" , session.getTimeout());
        User user = ShiroUtils.getCurrentUser();
        model.addAttribute("currentUser" , user);
        model.addAttribute("productName" , Constant.getProductName());
        model.addAttribute("menuList" , SystemCacheUtils.getCurrentMenuList());
        return "index";
    }

    /**
     * 请求锁屏
     * @return
     */
    @RequestMapping("/lock")
    public String lock(){
        Session session = ShiroUtils.getSession();
        session.setAttribute("lock", Constant.TRUE);
        User user = ShiroUtils.getCurrentUser();
        session.setAttribute("currentUser" , user);
        return "lock";
    }

    /**
     * 请求屏幕解锁
     * @return
     */
    public String unlock(){
        Session session = ShiroUtils.getSession();
        session.removeAttribute("lock");
        return "redirect:"+ adminPath + "index";
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
