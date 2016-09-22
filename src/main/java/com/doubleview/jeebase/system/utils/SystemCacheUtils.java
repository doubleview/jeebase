package com.doubleview.jeebase.system.utils;

import com.doubleview.jeebase.support.config.SpringContext;
import com.doubleview.jeebase.support.utils.CacheUtils;
import com.doubleview.jeebase.system.model.Department;
import com.doubleview.jeebase.system.model.Menu;
import com.doubleview.jeebase.system.model.Role;
import com.doubleview.jeebase.system.service.*;

import javax.management.relation.RoleList;
import java.util.List;

/**
 * 系统缓存工具类
 */
public class SystemCacheUtils {

    private static UserService userService = SpringContext.getBean(UserService.class);
    private static RoleService roleService = SpringContext.getBean(RoleService.class);
    private static MenuService menuService = SpringContext.getBean(MenuService.class);
    private static AreaService areaService = SpringContext.getBean(AreaService.class);
    private static DepartmentService departmentService = SpringContext.getBean(DepartmentService.class);


    private static String SYSTEM_CACHE = "systemCache";//系统缓存
    private static String ROLE_LIST = "roleList";
    private static String MENU_LIST = "menuList";
    private static String AREA_LIST = "areaList";
    private static String DEPARTMENT_LIST = "departmentList";

    public static final String CURRENT_ROLE_LIST = "current_roleList";
    public static final String CURRENT_MENU_LIST = "current_menuList";
    public static final String CURRENT_AREA_LIST = "current_areaList";
    public static final String CURRENT_DEPARTMENT_LIST = "current_departmentList";

    /**
     * 得到所有菜单
     * @return
     */
    public static List<Menu> getMenuList(){
        List<Menu> menuList = (List<Menu>)CacheUtils.get(SYSTEM_CACHE , MENU_LIST);
        if(menuList == null){
            menuList = menuService.getList(new Menu());
            if(menuList == null){
                return null;
            }
            CacheUtils.put(SYSTEM_CACHE ,  MENU_LIST , menuList);
        }
        return menuList;
    }

    /**
     * 得到所有的角色
     * @return
     */
    public static List<Role> getRoleList(){
        List<Role> roleList = (List<Role>) CacheUtils.get(SYSTEM_CACHE , ROLE_LIST);
        if(roleList == null){
            roleList = roleService.getList(new Role());
            if(roleList == null){
                return null;
            }
            CacheUtils.put(SYSTEM_CACHE , ROLE_LIST , roleList);
        }
        return roleList;
    }

    /**
     * 得到所有的部门
     * @return
     */
    public static List<Department> getDepartmentList(){
        List<Department> departmentList = (List<Department>)CacheUtils.get(SYSTEM_CACHE,DEPARTMENT_LIST);
        if(departmentList == null){
            departmentList = departmentService.getList(new Department());
            if(departmentList == null){
                return null;
            }
            CacheUtils.put(SYSTEM_CACHE , DEPARTMENT_LIST , departmentList);
        }
        return departmentList;
    }

    public List<RoleList> getCurrentRoleList(){
        return null;
    }

}
