package com.doubleview.jeebase.system.model;

import com.doubleview.jeebase.common.base.BaseModel;

/**
 * 字典实体类
 */
public class Dict extends BaseModel<Dict>{

    private String value;	// 数据值

    private String label;	// 标签名

    private String type;	// 类型

    private String description;// 描述

    private Integer sort;	// 排序


    public Dict() {
        super();
    }

    public Dict(String id){
        super(id);
    }

    public Dict(String value, String label){
        this.value = value;
        this.label = label;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }
}
