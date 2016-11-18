package com.doubleview.jeebase.util;


import com.doubleview.jeebase.system.utils.ShiroUtils;
import org.junit.Test;

public class ShiroTest {


    @Test
    public void entryptPasswordTest(){
        String password = "123456";
        System.out.println("密码加密后" + ShiroUtils.entryptPassword(password));
    }
}
