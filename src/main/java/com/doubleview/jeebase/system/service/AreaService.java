package com.doubleview.jeebase.system.service;

import com.doubleview.jeebase.common.base.BaseService;
import com.doubleview.jeebase.system.dao.AreaDao;
import com.doubleview.jeebase.system.model.Area;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 字典Service
 */
@Service
@Transactional(readOnly = true)
public class AreaService extends BaseService<AreaDao,Area>{

    /**
     * 删除地区
     * @param area
     */
    public void delete(Area area){
        super.delete(area);
    }

    /**
     * 保存地区
     * @param area
     */
    @Override
    public void save(Area area){
        super.save(area);
    }
}
