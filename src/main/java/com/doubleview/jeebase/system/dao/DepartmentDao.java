package com.doubleview.jeebase.system.dao;

import com.doubleview.jeebase.support.base.BaseDao;
import com.doubleview.jeebase.support.persistence.MyBatisDao;
import com.doubleview.jeebase.system.model.Department;
import com.doubleview.jeebase.system.model.Menu;

import java.util.List;

/**
 * 部门Dao接口
 */
@MyBatisDao
public interface DepartmentDao extends BaseDao<Department>{

    /**
     * 根据父类id获取子菜单
     * @param parentId 父菜单id
     * @return
     */
    List<Department> getByParentId(String parentId);

    /**
     * 批量删除部门
     * @param menuList
     * @return
     */
    int batchDelete(List<Department> menuList);
}
