package com.doubleview.jeebase.system.model;

import com.doubleview.jeebase.common.base.BaseModel;
import com.google.common.collect.Lists;

import java.util.List;

/**
 * 角色实体类
 */
public class Role extends BaseModel<Role>{

    private String name;  // 角色名称

    private List<Menu> menuList = Lists.newArrayList(); // 拥有菜单列表


    private  User user;//根据user查询角色
    public Role(){
        super();
    }

    public Role(String id){
        super(id);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Menu> getMenuList() {
        return menuList;
    }

    public void setMenuList(List<Menu> menuList) {
        this.menuList = menuList;
    }
}
