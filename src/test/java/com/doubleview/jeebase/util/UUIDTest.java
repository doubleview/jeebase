package com.doubleview.jeebase.util;

import org.junit.Test;

import java.util.UUID;

/**
 * Created by 胡成超 on 2016/9/24.
 */
public class UUIDTest {


    @Test
    public void testUUID(){
        System.out.println(UUID.randomUUID().toString().replace("-" , ""));
        System.out.println(UUID.randomUUID().toString().replace("-" , ""));
        System.out.println(UUID.randomUUID().toString().replace("-" , ""));
        System.out.println(UUID.randomUUID().toString().replace("-" , ""));
        System.out.println(UUID.randomUUID().toString().replace("-" , ""));
        System.out.println(UUID.randomUUID().toString().replace("-" , ""));
    }

}
