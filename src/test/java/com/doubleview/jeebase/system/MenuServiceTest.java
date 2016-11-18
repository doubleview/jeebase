package com.doubleview.jeebase.system;


import com.doubleview.jeebase.support.config.Constant;
import com.doubleview.jeebase.system.model.Area;
import com.doubleview.jeebase.system.model.Department;
import com.doubleview.jeebase.system.model.User;
import com.doubleview.jeebase.system.service.DepartmentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Department Service测试
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"classpath*:/spring-*.xml"})
@Transactional
public class DepartmentServiceTest {

    @Autowired
    private DepartmentService departmentService;

    @Test
    //@Commit
    public void saveDepartment(){
        Department department = new Department();
        department.setName("普格技术");
        department.setCode("D00000");
        department.setZipCode("");
        department.setAddress("");
        department.setPhone("0551-0000000");
        department.setFax("");
        department.setEmail("pugejishu@gmail.com");
        department.setMaster(new User("0"));
        department.setUseable(Constant.YES);
        department.setRemarks("备注");
        department.setParent(new Department("0"));
        department.setArea(new Area());

        departmentService.save(department);
    }

    @Test
    public void selectDeparment(){
        List<Department> departmentList = departmentService.getList(new Department());
        for(Department department : departmentList){
            System.out.println(department);
        }
    }
}
