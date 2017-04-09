package com.doubleview.jeebase.system.model;

import com.doubleview.jeebase.support.base.TreeModel;
import com.doubleview.jeebase.support.config.Constant;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

/**
 * 菜单实体类
 */
public class Menu extends TreeModel<Menu>{

    private String name;    // 名称

    private String href;    // 链接

    private String icon;    // 图标

    private String isShow;    // 是否在菜单中显示（1：显示；0：不显示）

    private List<Menu> subMenuList;//子菜单

    public Menu() {
        super();
        this.isShow = Constant.YES;
    }

    public Menu(String id) {
        super(id);
        this.isShow = Constant.YES;
    }

    @Override
    public Menu getParent() {
        return parent;
    }

    @Override
    public void setParent(Menu parent) {
        this.parent = parent;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getIsShow() {
        return isShow;
    }

    public void setIsShow(String isShow) {
        if(StringUtils.isBlank(isShow)){
            this.isShow = Constant.NO;
        }else {
            this.isShow = isShow;
        }
    }

    public List<Menu> getSubMenuList() {
        return subMenuList;
    }

    public void setSubMenuList(List<Menu> subMenuList) {
        this.subMenuList = subMenuList;
    }

    @Override
    public int compareTo(Menu other) {
        return getSort().compareTo(other.getSort());
    }
}
