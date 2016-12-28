package com.doubleview.jeebase.system.model;

import com.doubleview.jeebase.support.base.BaseModel;
import com.doubleview.jeebase.support.config.Constant;
import com.google.common.collect.Lists;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

/**
 * 角色实体类
 */
public class Role extends BaseModel<Role>{

    private String name;  // 角色名称

    private String roleType;//common普通角色 ， admin 管理角色, assign 任务分配角色

    private  String useable;//是否可用 1 可用 2 不可用

    private List<Menu> menuList = Lists.newArrayList(); // 拥有菜单列表


    private static String COMMON = "common";

    private static String ADMIN = "admin";

    private static  String ASSIGN = "assign";

    //--------------------------------------------

    private List<String> menuIds = Lists.newArrayList();

    private  User user;//根据user查询角色

    public Role(){
        super();
        this.useable = Constant.YES;
    }

    public Role(String id){
        super(id);
        this.useable = Constant.YES;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getRoleType() {
        return roleType;
    }

    public void setRoleType(String roleType) {
        this.roleType = roleType;
    }

    public String getUseable() {
        return useable;
    }

    public void setUseable(String useable) {
        if(useable == null){
            this.useable = Constant.NO;
        }else {
            this.useable = useable;
        }
    }

    public List<String> getMenuIds() {
        return menuIds;
    }

    public void setMenuIds(List<String> menuIds) {
        this.menuIds = menuIds;
    }

    public String getMenuStrings(){
        List<String> menuIds = Lists.newArrayList();
        for (Menu menu : getMenuList()) {
            menuIds.add(menu.getId());
        }
        return StringUtils.join(menuIds, ",");
    }
}
