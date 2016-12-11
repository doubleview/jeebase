package com.doubleview.jeebase.system.controller;

import com.doubleview.jeebase.support.base.BaseController;
import com.doubleview.jeebase.support.web.Page;
import com.doubleview.jeebase.support.web.ResponseResult;
import com.doubleview.jeebase.system.model.Role;
import com.doubleview.jeebase.system.service.RoleService;
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
 * 角色控制器
 */
@RequestMapping("${adminPath}/system/role")
@Controller
public class RoleController extends BaseController{

    @Autowired
    private RoleService roleService;


    @RequestMapping(value = {"list" , ""})
    public String list(Role role , HttpServletRequest request , Model model){
        Page<Role> page = roleService.getPage(new Page<>(request) , role);
        model.addAttribute("page" , page);
        return "system/role";
    }

    @RequestMapping("edit")
    public String edit(String id , Model model){
        if(StringUtils.isNotBlank(id)){
            model.addAttribute("role" , roleService.get(id));
        }else {
            model.addAttribute("role" , new Role());
        }
        return "system/role_edit";
    }

    @RequestMapping("save")
    public String save(Role role, RedirectAttributes model){
        roleService.save(role);
        model.addFlashAttribute("message" , "保存角色'"+role.getName()+"'成功");
        SystemCacheUtils.clearSystemCache(SystemCacheUtils.ROLE_LIST);
        return "redirect:" + adminPath + "/system/role";
    }

    @RequestMapping("del")
    @ResponseBody
    public ResponseResult del(String id){
        Validate.notBlank(id);
        try {
            roleService.delete(new Role(id));
            SystemCacheUtils.clearSystemCache(SystemCacheUtils.ROLE_LIST);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            return fail(e.getMessage());
        }
        return  success("删除成功");
    }
}
