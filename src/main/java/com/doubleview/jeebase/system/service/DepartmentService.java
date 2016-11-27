package com.doubleview.jeebase.system.service;

import com.doubleview.jeebase.support.base.BaseService;
import com.doubleview.jeebase.system.dao.DepartmentDao;
import com.doubleview.jeebase.system.model.Department;
import com.doubleview.jeebase.system.utils.SystemCacheUtils;
import com.google.common.collect.Lists;
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
     * 根据父类id获取子菜单
     * @param parentId 父菜单id
     * @return
     */
    public List<Department> getByParentId(String parentId){
        return dao.getByParentId(parentId);
    }


    /**
     * 删除及其子部门
     */
    @Transactional(readOnly = false)
    public void deleteAndChild(Department department){
        List<Department> departmentList = SystemCacheUtils.getDepartmentList();
        List<Department> deleteDeptList = Lists.newArrayList();
        deleteDeptList.add(department);
        //得到要删除的所有菜单
        for(Department d : departmentList){
            if(d.getParent().getId().equals(department.getId())){
                deleteDeptList.add(d);
            }
        }
        dao.batchDelete(deleteDeptList);
    }

}
