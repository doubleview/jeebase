package com.doubleview.jeebase.system.service;

import com.doubleview.jeebase.support.base.BaseService;
import com.doubleview.jeebase.system.dao.AreaDao;
import com.doubleview.jeebase.system.model.Area;
import com.doubleview.jeebase.system.utils.SystemCacheUtils;
import com.google.common.collect.Lists;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 *区域Service
 */
@Service
@Transactional(readOnly = true)
public class AreaService extends BaseService<AreaDao,Area>{

    /**
     * 根据父级id获取地区列表
     * @param parentId
     * @return
     */
    public List<Area> getByParentId(String parentId){
        return dao.getByParentId(parentId);
    }

    /**
     * 删除及其子部门
     */
    @Transactional(readOnly = false)
    public void deleteAndChild(Area area){
        List<Area> areaList = SystemCacheUtils.getAreaList();
        List<Area> deleteAreaList = Lists.newArrayList();
        deleteAreaList.add(area);
        //得到要删除的所有菜单
        for(Area d : areaList){
            if(d.getParent().getId().equals(area.getId())){
                deleteAreaList.add(d);
            }
        }
        dao.batchDelete(deleteAreaList);
    }
}
