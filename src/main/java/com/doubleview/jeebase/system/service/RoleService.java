package com.doubleview.jeebase.system.service;

import com.doubleview.jeebase.support.base.BaseService;
import com.doubleview.jeebase.support.utils.CollectionUtils;
import com.doubleview.jeebase.system.dao.MenuDao;
import com.doubleview.jeebase.system.dao.RoleDao;
import com.doubleview.jeebase.system.dao.UserDao;
import com.doubleview.jeebase.system.model.Role;
import com.doubleview.jeebase.system.model.RoleMenu;
import com.doubleview.jeebase.system.model.UserRole;
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

    @Autowired
    private MenuDao menuDao;

    /**
     * 根据id获取角色
     * @param id 主键
     * @return
     */
    public Role get(String id) {
        Role role = super.get(id);
        role.setMenuList(menuDao.getListByRoleId(role.getId()));
        return role;
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
     * 保存或更新角色
     * @param role
     */
    @Transactional(readOnly = false)
    public void save(Role role) {
        //如果为更新角色，则删除原有角色-菜单关联
        if (StringUtils.isNotBlank(role.getId())){
            RoleMenu roleMenu = new RoleMenu();
            roleMenu.setRoleId(role.getId());
            dao.deleteRM(roleMenu);
        }
        //插入角色-菜单关联
        if(CollectionUtils.isNotEmpty(role.getMenuIds())){
            List<RoleMenu> roleMenuList = Lists.newArrayList();
            for(String menuId : role.getMenuIds()){
                RoleMenu rm = new RoleMenu(role.getId() , menuId);
                roleMenuList.add(rm);
            }
            dao.batchInsertRM(roleMenuList);
        }
        super.save(role);
    }

    /**
     * 删除角色
     * @param role 角色
     */
    @Transactional(readOnly = false)
    public void delete(Role role) {
        //删除角色菜单关联
        RoleMenu roleMenu = new RoleMenu();
        roleMenu.setRoleId(role.getId());
        dao.deleteRM(roleMenu);
        //删除用户角色关联
        UserRole userRole = new UserRole();
        userRole.setRoleId(role.getId());
        userDao.deleteUserRole(userRole);
        super.delete(role);
    }

}
