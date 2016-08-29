package com.doubleview.jeebase.system.dao;

import com.doubleview.jeebase.common.base.BaseDao;
import com.doubleview.jeebase.common.persistence.MyBatisDao;
import com.doubleview.jeebase.system.model.Dict;

import java.util.List;

/**
 * 数据字典Dao接口
 */
@MyBatisDao
public interface DictDao extends BaseDao<Dict>{

    /**
     * 获取所有字典类型
     * @return
     */
    List<String> findTypeList();

}
