package com.doubleview.jeebase.support.base;

import com.doubleview.jeebase.support.web.Page;
import com.doubleview.jeebase.system.model.User;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

/**
 * BaseModel支持类
 */
public abstract  class BaseModel<T> implements Serializable {

    protected String id;//实体编号

    protected User createBy;//创建者

    protected Date createTime;    // 创建日期

    protected User updateBy;//更新者

    protected Date updateTime;    // 更新日期

    protected String remarks;    // 备注

    protected String delStatus;    // 删除标记（0：正常；1：删除；2：审核）

    public static final String NORMAL = "0";//正常数据

    public static final String DELETE = "1";//已删除数据

    public static final String AUDIT = "2";//待审核数据

    /**
     * 当前实体分页对象
     */
    protected Page<T> page;


    public BaseModel() {
        this.delStatus  = NORMAL;
    }

    public BaseModel(String id) {
        this.id = id;
        this.delStatus = NORMAL;
    }


    /**
     * 插入之前执行方法，子类实现
     */
    public  void preInsert(){
        this.setId(UUID.randomUUID().toString().replaceAll("-", ""));
        this.createTime = new Date();
        this.updateTime = createTime;
    };

    /**
     * 更新之前执行方法，子类实现
     */
    public  void preUpdate(){
        this.updateTime = new Date();
    };

    public String getDelStatus() {
        return delStatus;
    }

    public void setDelStatus(String delStatus) {
        this.delStatus = delStatus;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public User getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(User updateBy) {
        this.updateBy = updateBy;
    }

    public User getCreateBy() {
        return createBy;
    }

    public void setCreateBy(User createBy) {
        this.createBy = createBy;
    }

    public Page<T> getPage() {
        return page;
    }

    public void setPage(Page<T> page) {
        this.page = page;
    }

    @Override
    public boolean equals(Object obj) {
        if (null == obj) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        if (!getClass().equals(obj.getClass())) {
            return false;
        }
        BaseModel<?> that = (BaseModel<?>) obj;
        return null == this.getId() ? false : this.getId().equals(that.getId());
    }

    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }
}
