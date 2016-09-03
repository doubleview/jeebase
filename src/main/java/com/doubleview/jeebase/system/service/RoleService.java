package com.doubleview.jeebase.system.service;

import com.doubleview.jeebase.common.base.BaseService;
import com.doubleview.jeebase.common.persistence.Page;
import com.doubleview.jeebase.system.dao.RoleDao;
import com.doubleview.jeebase.system.dao.UserDao;
import com.doubleview.jeebase.system.model.*;
import com.doubleview.jeebase.system.utils.SystemUtils;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
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
     * 根据id获取Role
     * @param id 角色id
     * @return
     */
    public Role getRole(String id) {
        return dao.get(id);
    }

    /**
     * 根据角色名称获取角色
     * @param name 角色名称
     * @return
     */
    public Role getRoleByName(String name) {
        return dao.getByName(name);
    }


    /**
     * 获取角色列表
     * @param role
     * @return
     */
    public List<Role> getRoleList(Role role){
        return dao.getList(role);
    }


    /**
     * 保存或更新角色
     * @param role
     */
    @Transactional(readOnly = false)
    public void saveRole(Role role) {
        if (StringUtils.isBlank(role.getId())){
            role.preInsert();
            dao.insert(role);
        }else{
            role.preUpdate();
            dao.update(role);
        }

        RoleMenu roleMenu = new RoleMenu();
        roleMenu.setRoleId(role.getId());
        dao.deleteRoleMenu(roleMenu);

        if(role.getMenuList() != null && !role.getMenuList().isEmpty()){
            List<RoleMenu> roleMenuList = Lists.newArrayList();
            for(Menu menu : role.getMenuList()){
                RoleMenu rm = new RoleMenu(role.getId() , menu.getId());
                roleMenuList.add(rm);
            }
            dao.batchInsertRoleMenu(roleMenuList);
        }
    }

    /**
     * 删除角色
     * @param role
     */
    @Transactional(readOnly = false)
    public void deleteRole(Role role) {
        dao.delete(role);
        RoleMenu roleMenu = new RoleMenu();
        roleMenu.setRoleId(role.getId());
        dao.deleteRoleMenu(roleMenu);
        UserRole userRole = new UserRole();
        userRole.setRoleId(role.getId());
        userDao.deleteUserRole(userRole);
    }

}
