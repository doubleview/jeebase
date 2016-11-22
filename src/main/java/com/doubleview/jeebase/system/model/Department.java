package com.doubleview.jeebase.system.model;

import com.doubleview.jeebase.support.base.TreeModel;

import java.util.List;

/**
 * 部门实体类
 */
public class Department extends TreeModel<Department> {

    private String name; //部门名称

    private String code; 	// 机构编码

    private String address; // 联系地址

    private String zipCode; // 邮政编码

    private String phone; 	// 电话

    private String fax; 	// 传真

    private String email; 	// 邮箱

    private String useable;//是否可用

    private Area area;	// 归属区域

    private User master;//负责人

    private List<Department> subDeptList;//子部门

    public Department(){
        super();
    }

    public Department(String id){
        super(id);
    }

    @Override
    public Department getParent() {
       return parent;
    }

    @Override
    public void setParent(Department parent) {
        this.parent = parent;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public User getMaster() {
        return master;
    }

    public void setMaster(User master) {
        this.master = master;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUseable() {
        return useable;
    }

    public void setUseable(String useable) {
        this.useable = useable;
    }

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }

    public List<Department> getSubDeptList() {
        return subDeptList;
    }

    public void setSubDeptList(List<Department> subDeptList) {
        this.subDeptList = subDeptList;
    }

    @Override
    public int compareTo(Department other) {
        return this.getSort().compareTo(other.getSort());
    }
}
