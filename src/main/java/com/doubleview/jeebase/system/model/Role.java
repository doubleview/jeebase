package com.doubleview.jeebase.system.model;

import com.doubleview.jeebase.common.config.Constant;
import com.doubleview.jeebase.common.base.BaseModel;
import com.google.common.collect.Lists;

import java.util.List;

/**
 * 角色实体类
 */
public class Role extends BaseModel<Role>{

    private String name;    // 角色名称

    private String roleType;// 权限类型

    private String oldName;    // 原角色名称

    private String isSys;//是否是系统数据

    private String useable;        //是否是可用

    private List<Menu> menuList = Lists.newArrayList(); // 拥有菜单列表


    public Role(){
        super();
        this.useable = Constant.YES;
    }

    public Role(String id){
        super(id);
        this.useable = Constant.YES;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRoleType() {
        return roleType;
    }

    public void setRoleType(String roleType) {
        this.roleType = roleType;
    }

    public String getOldName() {
        return oldName;
    }

    public void setOldName(String oldName) {
        this.oldName = oldName;
    }

    public String getIsSys() {
        return isSys;
    }

    public void setIsSys(String isSys) {
        this.isSys = isSys;
    }

    public String getUseable() {
        return useable;
    }

    public void setUseable(String useable) {
        this.useable = useable;
    }

    public List<Menu> getMenuList() {
        return menuList;
    }

    public void setMenuList(List<Menu> menuList) {
        this.menuList = menuList;
    }
}
