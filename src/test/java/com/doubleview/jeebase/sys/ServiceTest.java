package com.doubleview.jeebase.sys;


import com.doubleview.jeebase.system.model.Menu;
import com.doubleview.jeebase.system.model.User;
import com.doubleview.jeebase.system.service.MenuService;
import com.doubleview.jeebase.system.utils.SystemCacheUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Service单元测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"classpath*:/spring-*.xml"})
@Transactional
public class ServiceTest {

    @Autowired
    private MenuService menuService;

    @Test
    public void TestMneu(){
        List<Menu> menuList = menuService.getListByUserId(new User("0ca004d6b1bf4bcab9670a5060d82a55"));
        menuList = SystemCacheUtils.levelAndSortMenuList(menuList , "0");
        System.out.println(menuList);
    }

}
