package com.doubleview.jeebase.system.utils;

import com.doubleview.jeebase.support.config.Constant;
import com.doubleview.jeebase.support.config.SpringContext;
import com.doubleview.jeebase.support.utils.CacheUtils;
import com.doubleview.jeebase.support.utils.CollectionUtils;
import com.doubleview.jeebase.system.model.*;
import com.doubleview.jeebase.system.service.*;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.session.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.util.ReflectionTestUtils;

import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * 系统缓存工具类
 */
public class SystemCacheUtils {

    private static Logger logger = LoggerFactory.getLogger(SystemCacheUtils.class);

    private static UserService userService = SpringContext.getBean(UserService.class);
    private static RoleService roleService = SpringContext.getBean(RoleService.class);
    private static MenuService menuService = SpringContext.getBean(MenuService.class);
    private static AreaService areaService = SpringContext.getBean(AreaService.class);
    private static DepartmentService departmentService = SpringContext.getBean(DepartmentService.class);
    private static DictService dictService = SpringContext.getBean(DictService.class);


    private static String SYSTEM_CACHE = "systemCache";//系统缓存
    public static String ROLE_LIST = "roleList";
    public static String MENU_LIST = "menuList";
    public static String AREA_LIST = "areaList";
    public static String DEPARTMENT_LIST = "departmentList";
    public static String DICT_MAP = "dictMap";

    public static final String CURRENT_ROLE_LIST = "current_roleList";
    public static final String CURRENT_MENU_LIST = "current_menuList";
    public static final String CURRENT_AREA_LIST = "current_areaList";
    public static final String CURRENT_DEPARTMENT_LIST = "current_departmentList";

    /**
     * 得到所有菜单
     *
     * @return
     */
    public static List<Menu> getMenuList() {
        logger.debug("try to get menu list from system cache");
        List<Menu> menuList = (List<Menu>) CacheUtils.get(SYSTEM_CACHE, MENU_LIST);
        if (CollectionUtils.isEmpty(menuList)) {
            menuList = menuService.getList(new Menu());
            if (CollectionUtils.isNotEmpty(menuList)) {
                menuList = levelAndSortMenuList(menuList, Constant.rootId, false);
                logger.debug("put menu list into system cache");
                CacheUtils.put(SYSTEM_CACHE, MENU_LIST, menuList);
            }
        }
        return menuList;
    }

    /**
     * 得到所有的角色
     *
     * @return
     */
    public static List<Role> getRoleList() {
        logger.debug("try to get role list from system cache");
        List<Role> roleList = (List<Role>) CacheUtils.get(SYSTEM_CACHE, ROLE_LIST);
        if (CollectionUtils.isEmpty(roleList)) {
            roleList = roleService.getList(new Role());
            if (roleList == null) {
                return null;
            }
            logger.debug("put role list into system cache");
            CacheUtils.put(SYSTEM_CACHE, ROLE_LIST, roleList);
        }
        return roleList;
    }

    /**
     * 得到所有的地区
     *
     * @return
     */
    public static List<Area> getAreaList() {
        logger.debug("try to get area list from system cache");
        List<Area> areaList = (List<Area>) CacheUtils.get(SYSTEM_CACHE, AREA_LIST);
        if (CollectionUtils.isEmpty(areaList)) {
            areaList = areaService.getList(new Area());
            if(CollectionUtils.isNotEmpty(areaList)){
                areaList = levelAndSortAreaList(areaList , Constant.rootId);
                logger.debug("put area list into system cache");
                CacheUtils.put(SYSTEM_CACHE, AREA_LIST, areaList);
            }
        }
        return areaList;
    }

    /**
     * 得到所有的部门
     *
     * @return
     */
    public static List<Department> getDepartmentList() {
        logger.debug("try to get dept list from system cache");
        List<Department> departmentList = (List<Department>) CacheUtils.get(SYSTEM_CACHE, DEPARTMENT_LIST);
        if (CollectionUtils.isEmpty(departmentList)) {
            departmentList = departmentService.getList(new Department());
            if (CollectionUtils.isNotEmpty(departmentList)) {
                departmentList =  levelAndSortDeptList(departmentList, Constant.rootId, false);
                logger.debug("put department list into system cache");
                CacheUtils.put(SYSTEM_CACHE, DEPARTMENT_LIST, departmentList);
            }
        }
        return departmentList;
    }

    public static List<String> getsubDeptIds(String parentDeptId , List<Department> parentList) {
        if (CollectionUtils.isEmpty(parentList) || StringUtils.isBlank(parentDeptId)) {
            return Lists.newArrayList();
        }
        List<String> parentIds = Lists.newArrayList();
        for (Department department : parentList) {
            if(department.getParent().getId().equals(parentDeptId)){
                parentIds.add(department.getId());
                parentIds.addAll(getsubDeptIds(department.getId() , department.getSubDeptList()));
            }else {
                parentIds.addAll(getsubDeptIds(parentDeptId , department.getSubDeptList()));
            }
        }
        return parentIds;
    }



    /**
     * 获取所有所有部门id
     * @param parentDeptId 父级id
     * @param parentList 部门列表
     * @return 所有部门id
     */
    public static List<String> getSubDeptIds(String parentDeptId , List<Department> parentList) {
        if (CollectionUtils.isEmpty(parentList) || StringUtils.isBlank(parentDeptId)) {
            return Lists.newArrayList();
        }
        List<String> parentIds = Lists.newArrayList();
        for (Department department : parentList) {
            if(department.getParent().getId().equals(parentDeptId)){
                parentIds.add(department.getId());
                parentIds.addAll(getSubDeptIds(department.getId() , department.getSubDeptList()));
            }else {
                parentIds.addAll(getSubDeptIds(parentDeptId , department.getSubDeptList()));
            }
        }
        return parentIds;
    }



    /**
     * 获取字典的label
     *
     * @param value
     * @param type
     * @param defaultValue
     * @return
     */
    public static String getDictLabel(String value, String type, String defaultValue) {
        if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(value)) {
            for (Dict dict : getDictList(type)) {
                if (type.equals(dict.getType()) && value.equals(dict.getValue())) {
                    return dict.getLabel();
                }
            }
        }
        return defaultValue;
    }

    /**
     * 获取字典的label
     *
     * @param values
     * @param type
     * @param defaultValue
     * @return
     */
    public static String getDictLabels(String values, String type, String defaultValue) {
        if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(values)) {
            List<String> valueList = Lists.newArrayList();
            for (String value : StringUtils.split(values, ",")) {
                valueList.add(getDictLabel(value, type, defaultValue));
            }
            return StringUtils.join(valueList, ",");
        }
        return defaultValue;
    }

    /**
     * 获取字典的label
     *
     * @param label
     * @param type
     * @param defaultLabel
     * @return
     */
    public static String getDictValue(String label, String type, String defaultLabel) {
        if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(label)) {
            for (Dict dict : getDictList(type)) {
                if (type.equals(dict.getType()) && label.equals(dict.getLabel())) {
                    return dict.getValue();
                }
            }
        }
        return defaultLabel;
    }

    /**
     * 根据字典类型获取相应字典
     *
     * @param type
     * @return
     */
    public static List<Dict> getDictList(String type) {
        Map<String, List<Dict>> dictMap = (Map<String, List<Dict>>) CacheUtils.get(SYSTEM_CACHE, DICT_MAP);
        if (dictMap == null) {
            dictMap = Maps.newHashMap();
            for (Dict dict : dictService.getList(new Dict())) {
                List<Dict> dictList = dictMap.get(dict.getType());
                if (dictList != null) {
                    dictList.add(dict);
                } else {
                    dictMap.put(dict.getType(), Lists.newArrayList(dict));
                }
            }
            CacheUtils.put(SYSTEM_CACHE, DICT_MAP, dictMap);
        }
        List<Dict> dictList = dictMap.get(type);
        if (dictList == null) {
            dictList = Lists.newArrayList();
        }
        return dictList;
    }

    /**
     * 清空缓存
     */
    public static void clearSystemCache(String key) {
        logger.debug("clear {} cache", key);
        CacheUtils.remove(SYSTEM_CACHE, key);
    }

    /**
     * 得到当前用户的所有菜单
     *
     * @return
     */
    public static List<Menu> getCurrentMenuList() {
        Session session = ShiroUtils.getSession();
        List<Menu> menuList = (List<Menu>) session.getAttribute(CURRENT_MENU_LIST);
        if (menuList == null) {
            User user = ShiroUtils.getCurrentUser();
            menuList = menuService.getListByUserId(user);
            if (menuList != null) {
                menuList = levelAndSortMenuList(menuList, Constant.rootId, true);
                session.setAttribute(CURRENT_MENU_LIST, menuList);
            }
        }
        return menuList;
    }

    /**
     * 将所有菜单进行排序
     *
     * @param menuList
     * @param parentId
     * @param filterNoShow 是否过滤不可见的菜单
     * @return
     */
    private static List<Menu> levelAndSortMenuList(List<Menu> menuList, String parentId, boolean filterNoShow) {

        if (CollectionUtils.isEmpty(menuList)) {
            return null;
        }

        List<Menu> parentList = Lists.newArrayList();

        for (Menu menu : menuList) {
            if (filterNoShow && menu.getIsShow().equals(Constant.NO)) {
                continue;
            }
            if (menu.getParent().getId().equals(parentId)) {
                parentList.add(menu);
            }
        }

        menuList.removeAll(parentList);
        for (Menu menu : parentList) {
            //递归调用
            menu.setSubMenuList(levelAndSortMenuList(menuList, menu.getId(), filterNoShow));
        }
        Collections.sort(parentList);//对菜单排序
        return parentList;
    }

    /**
     * 将所有部门进行排序
     *
     * @param departmentList
     * @param parentId
     * @param filterNoUse    是否过滤不可用的部门
     * @return
     */
    private static List<Department> levelAndSortDeptList(List<Department> departmentList, String parentId, boolean filterNoUse) {

        if (CollectionUtils.isEmpty(departmentList)) {
            return null;
        }

        List<Department> parentList = Lists.newArrayList();

        for (Department department : departmentList) {
            if (filterNoUse && department.getUseable().equals(Constant.NO)) {
                continue;
            }
            if (department.getParent().getId().equals(parentId)) {
                parentList.add(department);
            }
        }

        departmentList.removeAll(parentList);
        for (Department department : parentList) {
            //递归调用
            department.setSubDeptList(levelAndSortDeptList(departmentList, department.getId(), filterNoUse));
        }
        Collections.sort(parentList);//对部门排序
        return parentList;
    }

    /**
     * 将所有地区进行排序
     *
     * @param areaList 地区列表
     * @param parentId
     * @return
     */
    private static List<Area> levelAndSortAreaList(List<Area> areaList, String parentId) {

        if (CollectionUtils.isEmpty(areaList)) {
            return null;
        }

        List<Area> parentList = Lists.newArrayList();

        for (Area area : areaList) {
            if (area.getParent().getId().equals(parentId)) {
                parentList.add(area);
            }
        }

        areaList.removeAll(parentList);
        for (Area area : parentList) {
            //递归调用
            area.setSubAreaList(levelAndSortAreaList(areaList, area.getId()));
        }
        Collections.sort(parentList);//对部门排序
        return parentList;
    }

}
