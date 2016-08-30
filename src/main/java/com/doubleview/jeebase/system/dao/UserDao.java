package com.doubleview.jeebase.system.dao;

import com.doubleview.jeebase.common.base.BaseDao;
import com.doubleview.jeebase.common.persistence.MyBatisDao;
import com.doubleview.jeebase.system.model.User;

import java.util.List;

/**
 * 用户Dao接口
 */
@MyBatisDao
public interface UserDao extends BaseDao<User>{

    /**
     * 根据登录名称查询用户
     * @param loginName
     * @return
     */
     User getByLoginName(String loginName);

    /**
     * 通过DepartmentId获取用户列表
     * @param departmentId 部门id
     * @return
     */
     List<User> getByDepartmentId(String departmentId);

    /**
     * 查询全部用户数目
     * @return
     */
     long findAllCount(User user);


    /**
     * 更新用户密码
     * @param user
     * @return
     */
     int updatePassword(User user);


    /**
     * 删除用户角色关联数据
     * @param user
     * @return
     */
     int deleteUserRole(User user);

    /**
     * 插入用户角色关联数据
     * @param user
     * @return
     */
     int insertUserRole(User user);

}
