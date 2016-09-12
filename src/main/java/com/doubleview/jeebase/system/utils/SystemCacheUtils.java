package com.doubleview.jeebase.system.utils;

import com.doubleview.jeebase.support.config.SpringContext;
import com.doubleview.jeebase.system.model.User;
import com.doubleview.jeebase.system.service.UserService;

/**
 * 系统缓存工具类
 */
public class SystemCacheUtils {


    private static UserService userService = SpringContext.getBean(UserService.class);

    public static final String CACHE_ROLE_LIST = "roleList";
    public static final String CACHE_MENU_LIST = "menuList";
    public static final String CACHE_AREA_LIST = "areaList";
    public static final String CACHE_OFFICE_LIST = "officeList";
    public static final String CACHE_OFFICE_ALL_LIST = "officeAllList";


    public static User getUserByLoginName(String loginName){
        User user = userService.getUserByLoginName(loginName);
        if(user == null){

        }

        return user;
    }

}
