package com.doubleview.jeebase.system.controller;

import com.doubleview.jeebase.support.base.BaseController;
import com.doubleview.jeebase.support.config.Constant;
import com.doubleview.jeebase.support.utils.CollectionUtils;
import com.doubleview.jeebase.support.web.ResponseResult;
import com.doubleview.jeebase.support.web.TreeDataResult;
import com.doubleview.jeebase.system.model.Menu;
import com.doubleview.jeebase.system.service.MenuService;
import com.doubleview.jeebase.system.utils.SystemCacheUtils;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.ParameterizableViewController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Objects;

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
    public ResponseResult<Menu> get(String id) {
        Validate.notBlank(id);
        Menu menu = menuService.get(id);
        return success(menu);
    }

    /**
     * 菜单显示
     * @param parentId
     * @return
     */
    @RequestMapping("show")
    public String show(String parentId , Model model){
        Validate.notBlank(parentId);
        List<Menu> subMenuList = Lists.newArrayList();
        Menu parent = menuService.get(parentId);
        if (!Objects.isNull(parent)) {
            subMenuList.add(menuService.get(parent));
        }
        subMenuList.addAll(menuService.getByParentId(parentId));
        model.addAttribute("subMenuList" , subMenuList);
        return "system/menu_show";
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

        if (CollectionUtils.isEmpty(menuList)) {
            return null;
        }

        List<TreeDataResult> treeDataResultList = Lists.newArrayList();
        for (Menu menu : menuList) {
            TreeDataResult treeDataResult = new TreeDataResult();
            treeDataResult.setId(menu.getId());
            treeDataResult.setText(menu.getName());

            if (CollectionUtils.isNotEmpty(menu.getSubMenuList())) {
                treeDataResult.setIcon("fa fa-folder icon-state-warning");
            } else {
                treeDataResult.setIcon("fa fa-file icon-state-default");
            }
            if (menu.getId().equals(Constant.rootId) || menu.getParent().getId().equals(Constant.rootId)) {
                treeDataResult.setState(new TreeDataResult.State(true));
            }
            treeDataResult.setChildren(toTreeDataResult(menu.getSubMenuList()));
            treeDataResultList.add(treeDataResult);
        }
        return treeDataResultList;
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
            menu = new Menu();
            if(parentId.equals(Constant.rootId)){
                Menu parent = new Menu("0");
                parent.setName("顶级菜单");
                menu.setParent(parent);
            }else {
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
    public String saveOrUpdate(Menu menu , RedirectAttributes redirectAttributes, HttpServletRequest request){
        menuService.save(menu);
        SystemCacheUtils.clearSystemCache(SystemCacheUtils.MENU_LIST);
        redirectAttributes.addFlashAttribute("message", "保存菜单'" + menu.getName() + "'成功");
        redirectAttributes.addAttribute("parentId",menu.getParent().getId());
        return "redirect:" + adminPath + "/system/menu/show";
    }

    /**
     * 菜单删除
     * @param id
     * @return
     */
    @RequestMapping("del")
    @ResponseBody
    public ResponseResult delete(String id){
        try {
            menuService.deleteAndChild(new Menu(id));
            SystemCacheUtils.clearSystemCache(SystemCacheUtils.MENU_LIST);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            return fail(e.getMessage());
        }
        return  success("删除成功");
    }

}
