package com.doubleview.jeebase.system.dao;

import com.doubleview.jeebase.common.base.BaseDao;
import com.doubleview.jeebase.common.persistence.MyBatisDao;
import com.doubleview.jeebase.system.model.Menu;
import com.doubleview.jeebase.system.model.Role;

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
     * 根据角色英文名获取角色
     * @param role
     * @return
     */
     Role getByEnname(Role role);

    /**
     * 删除角色与菜单权限关系
     * @param role
     * @return
     */
     int deleteRoleMenu(Role role);

    /**
     * 插入角色菜单关系
     * @param role
     * @return
     */
     int insertRoleMenu(Role role);

    /**
     * 删除角色与公司部门关系
     * @param role
     * @return
     */
     int deleteRoleOffice(Role role);

    /**
     * 插入角色部门关系
     * @param role
     * @return
     */
     int insertRoleOffice(Role role);
}
