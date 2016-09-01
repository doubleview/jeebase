package com.doubleview.jeebase.system.model;


/**
 * 角色菜单类
 */
public class RoleMenu {

    private String roleId;

    private String menuId;

    public RoleMenu(){
        super();
    }

    public RoleMenu(String roleId, String menuId) {
        this.roleId = roleId;
        this.menuId = menuId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId;
    }
}
