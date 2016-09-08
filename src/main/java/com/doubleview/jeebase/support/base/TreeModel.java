package com.doubleview.jeebase.support.base;

/**
 * 树形实体类
 */
public class TreeModel<T>  extends BaseModel<T>{

    protected T parent;	// 父级编号

    protected Integer sort;//排序

    public TreeModel() {
        super();
        this.sort = 30;
    }

    public TreeModel(String id) {
        super(id);
        this.sort = 30;
    }

    public T getParent() {
        return parent;
    }

    public void setParent(T parent) {
        this.parent = parent;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

}
