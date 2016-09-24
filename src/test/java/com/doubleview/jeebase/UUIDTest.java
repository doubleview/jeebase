package com.doubleview.jeebase;

import java.util.UUID;

/**
 * Created by 胡成超 on 2016/9/24.
 */
public class UUIDTest {

    public static void main(String[] args){
        System.out.println(UUID.randomUUID().toString().replace("-" , ""));
    }
}
