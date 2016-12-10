package com.doubleview.jeebase.system.service;

import com.doubleview.jeebase.support.base.BaseService;
import com.doubleview.jeebase.system.dao.DictDao;
import com.doubleview.jeebase.system.model.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 字典Service
 */
@Service
@Transactional(readOnly = true)
public class DictService extends BaseService<DictDao, Dict>{

    /**
     * 查询字段类型列表
     * @return
     */
    public List<String> getTypeList(){
        return dao.getTypeList();
    }

}
