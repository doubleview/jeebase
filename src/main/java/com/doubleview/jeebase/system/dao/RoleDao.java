package com.doubleview.jeebase.system.dao;

import com.doubleview.jeebase.support.base.BaseDao;
import com.doubleview.jeebase.support.persistence.MyBatisDao;
import com.doubleview.jeebase.system.model.Role;
import com.doubleview.jeebase.system.model.RoleMenu;

import java.util.List;

/**
 * 角色Dao接口
 */
@MyBatisDao
public interface RoleDao extends BaseDao<Role> {

    /**
     * 根据角色名获取角色
     * @param name
     * @return
     */
     Role getByName(String name);


    /**
     * 插入角色菜单关系
     * @param roleMenu
     * @return
     */
     int insertRoleMenu(RoleMenu roleMenu);

    /**
     * 批量插入角色菜单关系
     * @param roleMenuList
     * @return
     */
    int batchInsertRoleMenu(List<RoleMenu> roleMenuList);

    /**
     * 删除角色与菜单权限关系
     * @param roleMenu
     * @return
     */
     int deleteRoleMenu(RoleMenu roleMenu);

}
