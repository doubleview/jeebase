package com.doubleview.jeebase.system.model;

import com.doubleview.jeebase.support.base.TreeModel;
import com.google.common.collect.Lists;

import java.util.List;

/**
 * 地区实体类
 */
public class Area extends TreeModel<Area> {

    private String name;//区域名称

    private String code;    // 区域编码

    private String type;    // 区域类型（1：国家；2：省份、直辖市；3：地市；4：区县）

    private  List<Area> subAreaList;

    private List<String> areaIds = Lists.newArrayList();//地区id，用于查询地区id

    public Area() {
        super();
    }

    public Area(String id) {
        super(id);
    }

    @Override
    public Area getParent() {
        return parent;
    }

    @Override
    public void setParent(Area parent) {
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<String> getAreaIds() {
        return areaIds;
    }

    public void setAreaIds(List<String> areaIds) {
        this.areaIds = areaIds;
    }

    public List<Area> getSubAreaList() {
        return subAreaList;
    }

    public void setSubAreaList(List<Area> subAreaList) {
        this.subAreaList = subAreaList;
    }

    @Override
    public int compareTo(Area other) {
        return this.getSort().compareTo(other.getSort());
    }

}
