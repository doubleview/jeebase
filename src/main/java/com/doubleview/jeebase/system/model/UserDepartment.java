package com.doubleview.jeebase.system.model;

/**
 * 用户部门类
 */
public class UserDepartment {

    private String userId;

    private String departmentId;

    public UserDepartment(){
        super();
    }

    public UserDepartment(String userId, String departmentId) {
        this.userId = userId;
        this.departmentId = departmentId;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
