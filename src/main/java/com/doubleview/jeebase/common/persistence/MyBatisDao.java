package com.doubleview.jeebase.common.persistence;

import org.springframework.stereotype.Component;

import java.lang.annotation.*;

/**
 * ��ʶMyBatis��DAO,����{@link org.mybatis.spring.mapper.MapperScannerConfigurer}��ɨ�衣
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
@Documented
@Component
public @interface MyBatisDao {

	String value() default "";

}