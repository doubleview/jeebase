package com.doubleview.jeebase.system.dao;

import com.doubleview.jeebase.common.base.BaseDao;
import com.doubleview.jeebase.common.persistence.MyBatisDao;
import com.doubleview.jeebase.system.model.Menu;

import java.util.List;

/**
 * 字典Dao接口
 */
@MyBatisDao
public interface MenuDao extends BaseDao<Menu> {

    /**
     * 根据父类id获取子菜单
     * @param parentId 父菜单id
     * @return
     */
     List<Menu> getByParentId(String parentId);

    /**
     * 根据用户id获取菜单
     * @param userId 用户id
     * @return
     */
     List<Menu> getByUserId(String userId);

    /**
     * 更新父子菜单关系
     * @param menu
     * @return
     */
     int updateParentIds(Menu menu);

    /**
     * 更新排序
     * @param menu
     * @return
     */
     int updateSort(Menu menu);
}
