package com.doubleview.jeebase.system.model;


/**
 * 部门地区类
 */
public class DepartmentArea {


    private String departmentId;

    private String areaId;

    public DepartmentArea(){
        super();
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    public String getAreaId() {
        return areaId;
    }

    public void setAreaId(String areaId) {
        this.areaId = areaId;
    }
}
