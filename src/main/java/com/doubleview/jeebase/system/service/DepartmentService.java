package com.doubleview.jeebase.system.service;

import com.doubleview.jeebase.support.base.BaseService;
import com.doubleview.jeebase.system.dao.DepartmentDao;
import com.doubleview.jeebase.system.model.Department;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
