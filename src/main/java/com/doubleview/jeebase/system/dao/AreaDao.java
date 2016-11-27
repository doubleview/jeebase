package com.doubleview.jeebase.system.dao;

import com.doubleview.jeebase.support.base.BaseDao;
import com.doubleview.jeebase.support.persistence.MyBatisDao;
import com.doubleview.jeebase.system.model.Area;

import java.util.List;

/**
 * 地区Dao接口
 */
@MyBatisDao
public interface AreaDao extends BaseDao<Area>{

    /**
     * 根据parentId获取地区
     * @param parentId 地区父级id
     * @return
     */
    List<Area> getByParentId(String parentId);

    /**
     * 批量删除地区
     * @param areaList 地区
     */
    void batchDelete(List<Area> areaList);
}
