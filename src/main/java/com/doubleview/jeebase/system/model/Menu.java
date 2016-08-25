package com.doubleview.jeebase.system.model;

import com.doubleview.jeebase.common.base.TreeModel;
import com.doubleview.jeebase.common.config.Constant;
import com.doubleview.jeebase.common.base.BaseModel;

/**
 * 菜单实体类
 */
public class Menu extends TreeModel<Menu> {

    private String name;    // 名称

    private String href;    // 链接

    private String target;    // 目标（ mainFrame、_blank、_self、_parent、_top）

    private String icon;    // 图标

    private String isShow;    // 是否在菜单中显示（1：显示；0：不显示）

    public Menu() {
        super();
        this.isShow = Constant.YES;
    }

    public Menu(String id) {
        super(id);
        this.isShow = Constant.YES;
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

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
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
        this.isShow = isShow;
    }
}
