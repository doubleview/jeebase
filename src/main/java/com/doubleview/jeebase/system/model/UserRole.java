package com.doubleview.jeebase.system.model;

/**
 * 用户角色类
 */
public class UserRole {

    private String userId;

    private String roleId;


    public UserRole(){
        super();
    }

    public UserRole(String userId, String roleId) {
        this.userId = userId;
        this.roleId = roleId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
}
