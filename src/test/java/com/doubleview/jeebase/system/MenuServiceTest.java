package com.doubleview.jeebase.system;


import com.doubleview.jeebase.system.model.Menu;
import com.doubleview.jeebase.system.service.MenuService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * MneuService测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"classpath*:/spring-*.xml"})
@Transactional
public class MenuServiceTest {

    @Autowired
    private MenuService menuService;


    @Test
    public void selectMenu(){
        List<Menu> menuList = menuService.getList(new Menu());
        for(Menu menu : menuList){
            System.out.println(menu);
        }
    }
}
