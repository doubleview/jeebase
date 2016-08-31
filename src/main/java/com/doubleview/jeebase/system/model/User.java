package com.doubleview.jeebase.system.model;

import com.doubleview.jeebase.common.base.BaseModel;
import com.google.common.collect.Lists;

import java.util.Date;
import java.util.List;

/**
 * 用户实体类
 */
public class User extends BaseModel<User> {

    private String loginName;// 登录名

    private String password;// 密码

    private String name;    // 姓名

    private String email;    // 邮箱

    private String skin;//皮肤

    private String phone;    // 电话

    private String mobile;    // 手机

    private String photo;    // 头像

    private String loginIp;    // 最后登陆IP

    private Date loginDate;    // 最后登陆日期

    private String loginFlag;    // 是否允许登陆

    private String oldLoginName;// 原登录名

    private String newPassword;    // 新密码

    private String oldLoginIp;    // 上次登陆IP

    private Date oldLoginDate;    // 上次登陆日期

    private Department department; // 所属部门

    private List<Role> roleList = Lists.newArrayList(); // 拥有角色列表


    private String roleId;//根据角色id查询用户信息

    private List<String> departmentIds;//根据部门id查询用户信息

    public User(){
        super();
    }

    public User(String id){
        super(id);
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSkin() {
        return skin;
    }

    public void setSkin(String skin) {
        this.skin = skin;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }

    public Date getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }

    public String getLoginFlag() {
        return loginFlag;
    }

    public void setLoginFlag(String loginFlag) {
        this.loginFlag = loginFlag;
    }

    public String getOldLoginName() {
        return oldLoginName;
    }

    public void setOldLoginName(String oldLoginName) {
        this.oldLoginName = oldLoginName;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getOldLoginIp() {
        return oldLoginIp;
    }

    public void setOldLoginIp(String oldLoginIp) {
        this.oldLoginIp = oldLoginIp;
    }

    public Date getOldLoginDate() {
        return oldLoginDate;
    }

    public void setOldLoginDate(Date oldLoginDate) {
        this.oldLoginDate = oldLoginDate;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public List<String> getDepartmentIds() {
        return departmentIds;
    }

    public void setDepartmentIds(List<String> departmentIds) {
        this.departmentIds = departmentIds;
    }
}
