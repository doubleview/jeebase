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
import org.springframework.ui.Model;
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
    @RequestMapping("get")
    @ResponseBody
    public ResponseResult<Menu> getMenu(String id) {
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
                treeDataResult.setIcon("fa fa-folder icon-state-warning");
            } else {
                treeDataResult.setIcon("fa fa-file icon-state-default");
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
     * 菜单显示
     * @param parentId
     * @return
     */
    @RequestMapping("show")
    public String show(String parentId , Model model){
        if(StringUtils.isBlank(parentId)){
            throw  new RuntimeException("id is null");
        }
        List<Menu> subMenuList = menuService.getByParentId(parentId);

        if(subMenuList == null || subMenuList.isEmpty()){
            Menu menu = menuService.get(parentId);
            model.addAttribute("menu" , menu);
            return "system/menu_edit";
        }else {
            model.addAttribute("subMenuList" , subMenuList);
            model.addAttribute("parentId" , parentId);
        }
        return "system/menu_show";
    }


    /**
     * 菜单添加，编辑
     * @param id
     * @return
     */
    @RequestMapping("edit")
    public String edit(String id, String parentId, Model model) {
        if (StringUtils.isBlank(id) && StringUtils.isBlank(parentId)) {
            throw new RuntimeException("id and parentId is null");
        }
        Menu menu = null;
        if (parentId != null) {
            //新增顶级菜单
            if (parentId.equals("0")) {
                menu = new Menu();
                Menu topMenu = new Menu("0");
                topMenu.setName("顶级菜单");
                menu.setParent(topMenu);
            } else {
                menu = new Menu();
                menu.setParent(menuService.get(parentId));
            }
        } else {
            menu = menuService.get(id);
        }
        model.addAttribute("menu", menu);
        return "system/menu_edit";
    }

    /**
     * 菜单保存
     * @param menu
     */
    @RequestMapping("save")
    public void saveOrUpdate(Menu menu , Model model){
        menuService.save(menu);
    }

    /**
     * 菜单删除
     * @param id
     * @return
     */
    public ResponseResult delete(String id){
        menuService.delete(new Menu(id));
        return  success("删除成功");
    }

}
