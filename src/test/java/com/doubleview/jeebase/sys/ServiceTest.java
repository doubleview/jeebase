package com.doubleview.jeebase.sys;


import com.doubleview.jeebase.system.service.MenuService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

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

    }

}
