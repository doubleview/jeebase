package com.doubleview.jeebase.system.controller;

import com.doubleview.jeebase.support.base.BaseController;
import com.doubleview.jeebase.support.web.Page;
import com.doubleview.jeebase.support.web.ResponseResult;
import com.doubleview.jeebase.system.model.Dict;
import com.doubleview.jeebase.system.service.DictService;
import com.doubleview.jeebase.system.utils.SystemCacheUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;


/**
 * 字典控制器
 */
@RequestMapping("${adminPath}/system/dict")
@Controller
public class DictController extends BaseController{


    @Autowired
    private DictService dictService;


    @RequestMapping(value = {"list" , ""})
    public String list(Dict dict , HttpServletRequest request , Model model){
        Page<Dict> page = dictService.getPage(new Page<>(request) , dict);
        model.addAttribute("typeList" , dictService.findTypeList());
        model.addAttribute("page" , page);
        return "dict";
    }

    @RequestMapping("edit")
    public String edit(String id , Model model){
        Validate.notBlank(id);
        model.addAttribute("dict" , dictService.get(id));
        return "dict-edit";
    }

    @RequestMapping("del")
    @ResponseBody
    public ResponseResult del(String id){
        Validate.notBlank(id);
        try {
            dictService.delete(new Dict(id));
            SystemCacheUtils.clearSystemCache(SystemCacheUtils.DICT_MAP);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            return fail(e.getMessage());
        }
        return  success("删除成功");
    }
}
