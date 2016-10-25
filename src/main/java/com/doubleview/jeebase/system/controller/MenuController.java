package com.doubleview.jeebase.system.controller;

import com.doubleview.jeebase.support.base.BaseController;
import com.doubleview.jeebase.support.web.ResponseResult;
import com.doubleview.jeebase.support.web.TreeDataResult;
import com.doubleview.jeebase.system.model.Menu;
import com.doubleview.jeebase.system.service.MenuService;
import com.doubleview.jeebase.system.utils.SystemCacheUtils;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 菜单控制器
 */
@RequestMapping("${adminPath}/system/menu")
@Controller
public class MenuController extends BaseController{

    @Autowired
    private MenuService menuService;


    /**
     *
     * @return
     */
    @RequestMapping("")
    public String toMenuPage(){
        return "system/menu";
    }

    /**
     * 返回菜单树形数据
     * @return
     */
    @RequestMapping("tree-menu")
    @ResponseBody
    public ResponseResult<List<TreeDataResult>> treeData(){
        List<Menu> menuList = SystemCacheUtils.getMenuList();
        List<TreeDataResult> treeDataResultList = toTreeDataResult(menuList);
        return  success(treeDataResultList);
    }


    /**
     * 将菜单转换为树形结构
     * @param menuList
     * @return
     */
    private  List<TreeDataResult> toTreeDataResult(List<Menu> menuList){

        if(menuList == null || menuList.isEmpty()){
            return null;
        }

        List<TreeDataResult> treeDataResultList = Lists.newArrayList();
        for(Menu menu : menuList){
            TreeDataResult treeDataResult = new TreeDataResult();
            treeDataResult.setId(menu.getId());
            treeDataResult.setText(menu.getName());
            treeDataResult.setIcon(menu.getIcon());
            if(menu.getParent().getId() == "0"){
                treeDataResult.setState(new TreeDataResult.State(true));
            }
            treeDataResult.setChildren(toTreeDataResult(menu.getSubMenuList()));
        }
        return treeDataResultList;
    }

}
