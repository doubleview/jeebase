package com.doubleview.jeebase.system.controller;

import com.doubleview.jeebase.support.base.BaseController;
import com.doubleview.jeebase.support.web.ResponseResult;
import com.doubleview.jeebase.support.web.TreeDataResult;
import com.doubleview.jeebase.system.model.Menu;
import com.doubleview.jeebase.system.service.MenuService;
import com.doubleview.jeebase.system.utils.SystemCacheUtils;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
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
public class MenuController extends BaseController {

    @Autowired
    private MenuService menuService;

    /**
     * @return
     */
    @RequestMapping("")
    public String toMenuPage() {
        return "system/menu";
    }


    /**
     * 根据id获取Menu
     *
     * @param id
     * @return
     */
    @RequestMapping("get-menu")
    @ResponseBody
    public ResponseResult<Menu> getMneu(String id) {
        if (StringUtils.isBlank(id)) {
            throw new RuntimeException("id is null");
        }
        Menu menu = menuService.get(id);
        return success(menu);
    }


    /**
     * 返回菜单树形数据
     *
     * @return
     */
    @RequestMapping("tree-data")
    @ResponseBody
    public ResponseResult<List<TreeDataResult>> treeData() {
        List<Menu> menuList = SystemCacheUtils.getMenuList();
        List<TreeDataResult> treeDataResultList = toTreeDataResult(menuList);
        return success(treeDataResultList);
    }


    /**
     * 将菜单转换为树形结构
     *
     * @param menuList
     * @return
     */
    private List<TreeDataResult> toTreeDataResult(List<Menu> menuList) {

        if (menuList == null || menuList.isEmpty()) {
            return null;
        }

        List<TreeDataResult> treeDataResultList = Lists.newArrayList();
        for (Menu menu : menuList) {
            TreeDataResult treeDataResult = new TreeDataResult();
            treeDataResult.setId(menu.getId());
            treeDataResult.setText(menu.getName());

            if (menu.getSubMenuList() != null && !menu.getSubMenuList().isEmpty()) {
                treeDataResult.setIcon("fa fa-folder");
            } else {
                treeDataResult.setIcon("fa fa-file-text-o");
            }
            if (menu.getParent().getId().equals("0")) {
                treeDataResult.setState(new TreeDataResult.State(true));
            }
            treeDataResult.setChildren(toTreeDataResult(menu.getSubMenuList()));
            treeDataResultList.add(treeDataResult);
        }
        return treeDataResultList;
    }


    /**
     * 编辑菜单
     * @param id
     * @return
     */
    @RequestMapping("edit")
    public String editMenu(String id){

        return "system/menu_edit";
    }

}
