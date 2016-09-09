package com.doubleview.jeebase.system.controller;

import com.doubleview.jeebase.support.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
