package com.doubleview.jeebase.system.dao;

import com.doubleview.jeebase.common.base.BaseDao;
import com.doubleview.jeebase.common.persistence.MyBatisDao;
import com.doubleview.jeebase.system.model.Menu;
import com.doubleview.jeebase.system.model.Role;
import com.doubleview.jeebase.system.model.RoleMenu;

/**
 * 角色Dao接口
 */
@MyBatisDao
public interface RoleDao extends BaseDao<Menu> {

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
     * 删除角色与菜单权限关系
     * @param role
     * @return
     */
     int deleteRoleMenu(RoleMenu roleMenu);


}
