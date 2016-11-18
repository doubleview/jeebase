package com.doubleview.jeebase.system.service;

import com.doubleview.jeebase.support.base.BaseService;
import com.doubleview.jeebase.system.dao.RoleDao;
import com.doubleview.jeebase.system.dao.UserDao;
import com.doubleview.jeebase.system.model.*;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 角色Service
 */
@Service
@Transactional(readOnly = true)
public class RoleService extends BaseService<RoleDao, Role>{


    @Autowired
    private UserDao userDao;

    /**
     * 根据角色名称获取角色
     * @param name 角色名称
     * @return
     */
    public Role getRoleByName(String name) {
        return dao.getByName(name);
    }

    /**
     * 保存或更新角色
     * @param role
     */
    @Transactional(readOnly = false)
    public void save(Role role) {
        super.save(role);
        RoleMenu roleMenu = new RoleMenu();
        roleMenu.setRoleId(role.getId());
        dao.deleteRM(roleMenu);

        if(role.getMenuList() != null && !role.getMenuList().isEmpty()){
            List<RoleMenu> roleMenuList = Lists.newArrayList();
            for(Menu menu : role.getMenuList()){
                RoleMenu rm = new RoleMenu(role.getId() , menu.getId());
                roleMenuList.add(rm);
            }
            dao.batchInsertRM(roleMenuList);
        }
    }

    /**
     * 删除角色
     * @param role
     */
    @Transactional(readOnly = false)
    public void delete(Role role) {
        super.delete(role);
        RoleMenu roleMenu = new RoleMenu();
        roleMenu.setRoleId(role.getId());
        dao.deleteRM(roleMenu);
        UserRole userRole = new UserRole();
        userRole.setRoleId(role.getId());
        userDao.deleteUserRole(userRole);
    }

}
