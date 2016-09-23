package com.doubleview.jeebase.system.service;

import com.doubleview.jeebase.support.base.BaseService;
import com.doubleview.jeebase.system.dao.MenuDao;
import com.doubleview.jeebase.system.model.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 菜单Service
 */
@Service
@Transactional(readOnly = true)
public class MenuService extends BaseService<MenuDao, Menu>{

    /**
     * 根据parentId获取菜单列表
     * @param parentId
     * @return
     */
    List<Menu> getByParentId(String parentId){
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

}
