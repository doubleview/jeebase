package com.doubleview.jeebase.system.controller;

import com.doubleview.jeebase.support.base.BaseController;
import com.doubleview.jeebase.support.web.ResponseResult;
import com.doubleview.jeebase.support.web.TreeDataResult;
import com.doubleview.jeebase.system.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 菜单控制器
 */
@RequestMapping("${adminPath}/sys/menu")
public class MenuController extends BaseController{

    @Autowired
    private MenuService menuService;

    /**
     * 返回菜单树形数据
     * @return
     */
    @RequestMapping("tree-menu")
    @ResponseBody
    public ResponseResult<List<TreeDataResult>> treeData(){
        return null;
    }

}
