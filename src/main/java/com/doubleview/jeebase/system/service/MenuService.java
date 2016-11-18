package com.doubleview.jeebase.system.service;

import com.doubleview.jeebase.support.base.BaseService;
import com.doubleview.jeebase.system.dao.MenuDao;
import com.doubleview.jeebase.system.dao.RoleDao;
import com.doubleview.jeebase.system.model.*;
import com.doubleview.jeebase.system.utils.SystemCacheUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 菜单Service
 */
@Service
@Transactional(readOnly = true)
public class MenuService extends BaseService<MenuDao, Menu>{

    @Autowired
    private RoleDao roleDao;

    /**
     * 根据parentId获取菜单列表
     * @param parentId
     * @return
     */
    public List<Menu> getByParentId(String parentId){
        return dao.getByParentId(parentId);
    }

    /**
     * 根据用户id获取菜单
     * @param user
     * @return
     */
    public List<Menu> getListByUserId(User user){
        return dao.getListByUserId(user.getId());
    }

    /**
     * 更新菜单排序
     * @param menu
     */
    @Transactional(readOnly = false)
    public void updateMenuSort(Menu menu) {
        dao.updateSort(menu);
    }


    /**
     * 批量删除菜单
     * @param
     */
    public void deleteAndChild(Menu menu){
        List<Menu> menuList = SystemCacheUtils.getMenuList();
        List<Menu> deleteMenuList = null;
        List<String> deleleMenuStrings = null;
        deleteMenuList.add(menu);
        deleleMenuStrings.add(menu.getId());
        //得到要删除的所有菜单
        for(Menu m : menuList){
            if(m.getParent().getId().equals(menu.getId())){
                deleteMenuList.add(m);
                deleleMenuStrings.add(m.getId());
            }
        }
        dao.batchDelete(deleteMenuList);
        roleDao.deleterRMByMenuId(deleleMenuStrings);
    }

}
