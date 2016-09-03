package com.doubleview.jeebase.system.service;

import com.doubleview.jeebase.common.base.BaseService;
import com.doubleview.jeebase.system.dao.DepartmentDao;
import com.doubleview.jeebase.system.dao.DictDao;
import com.doubleview.jeebase.system.model.Department;
import com.doubleview.jeebase.system.model.Dict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 字典Service
 */
@Service
@Transactional(readOnly = true)
public class DepartmentService extends BaseService<DepartmentDao, Department>{


    /**
     * 删除部门
     * @param department
     */
    public void delete(Department department){
        super.delete(department);
    }

    /**
     * 保存部门
     * @param department
     */
    @Override
    public void save(Department department){
        super.save(department);
    }

}
