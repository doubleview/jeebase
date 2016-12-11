package com.doubleview.jeebase.system.controller;

import com.doubleview.jeebase.support.base.BaseController;
import com.doubleview.jeebase.support.web.Page;
import com.doubleview.jeebase.support.web.ResponseResult;
import com.doubleview.jeebase.system.model.User;
import com.doubleview.jeebase.system.service.UserService;
import com.doubleview.jeebase.system.utils.SystemCacheUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * 用户控制器
 */
@RequestMapping("${adminPath}/system/user")
@Controller
public class UserController extends BaseController{


    @Autowired
    private UserService userService;


    @RequestMapping(value = {"list" , ""})
    public String list(User user , HttpServletRequest request , Model model){
        Page<User> page = userService.getPage(new Page<>(request) , user);
        model.addAttribute("page" , page);
        return "system/user";
    }

    @RequestMapping("edit")
    public String edit(String id , Model model){
        if(StringUtils.isNotBlank(id)){
            model.addAttribute("user" , userService.get(id));
        }else {
            model.addAttribute("user" , new User());
        }
        return "system/user_edit";
    }

    @RequestMapping("save")
    public String save(User user, RedirectAttributes model){
        userService.save(user);
        model.addFlashAttribute("message" , "保存用户'"+user.getName()+"'成功");
        return "redirect:" + adminPath + "/system/user";
    }

    @RequestMapping("del")
    @ResponseBody
    public ResponseResult del(String id){
        Validate.notBlank(id);
        try {
            userService.delete(new User(id));
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            return fail(e.getMessage());
        }
        return  success("删除成功");
    }
}
