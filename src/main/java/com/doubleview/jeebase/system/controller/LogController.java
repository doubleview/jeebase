package com.doubleview.jeebase.system.controller;

import com.doubleview.jeebase.support.base.BaseController;
import com.doubleview.jeebase.support.web.Page;
import com.doubleview.jeebase.system.model.Log;
import com.doubleview.jeebase.system.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 日志控制器
 */
@RequestMapping("${adminPath}/system/log")
@Controller
public class LogController extends BaseController{

    @Autowired
    private  LogService logService;

    /**
     * 获取日志列表
     * @param log
     * @param model
     * @return
     */
    @RequestMapping(value = {"list",""})
    public String list(Log log , HttpServletRequest request , Model model){
        Page<Log> page = logService.getPage(new Page<>(request) , log);
        model.addAttribute("page" , page);
        return "system/log-list";
    }
}
