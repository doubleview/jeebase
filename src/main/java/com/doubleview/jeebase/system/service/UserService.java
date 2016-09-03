package com.doubleview.jeebase.system.service;

import com.doubleview.jeebase.common.base.BaseService;
import com.doubleview.jeebase.common.persistence.Page;
import com.doubleview.jeebase.system.dao.UserDao;
import com.doubleview.jeebase.system.model.Role;
import com.doubleview.jeebase.system.model.User;
import com.doubleview.jeebase.system.model.UserRole;
import com.doubleview.jeebase.system.utils.SystemUtils;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

/**
 * 用户Service
 */
@Service
@Transactional(readOnly = true)
public class UserService extends BaseService<UserDao , User>{

    /**
     * 获取用户
     * @param id
     * @return
     */
    public User getUser(String id) {
        return dao.get(id);
    }

    /**
     * 根据登录名获取用户
     * @param loginName
     * @return
     */
    public User getUserByLoginName(String loginName) {
        return dao.getByLoginName(loginName);
    }

    /**
     * 获取分页用户列表
     * @param page
     * @param user
     * @return
     */
    public Page<User> getUserList(Page<User> page, User user) {
        // 设置分页参数
        user.setPage(page);
        // 执行分页查询
        page.setList(dao.getList(user));
        return page;
    }

    /**
     * 获取用户列表,无分页
     * @param user
     * @return
     */
    public List<User> getUserList(User user) {
        return dao.getList(user);
    }

    /**
     * 通过部门ID获取用户列表，仅返回用户id和name（树查询用户时用）
     * @param departmentId 部门id
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<User> getUerByDepartmentId(String departmentId) {
        return dao.getByDepartmentId(departmentId);
    }


    /**
     * 得到所有用户数量
     * @return
     */
    public long getAllCount(){
        return dao.getAllCount();
    }

    /**
     * 更新用户登录信息
     * @param user
     * @return
     */
    public int updateLoginInfo(User user){
        user.preUpdate();
        return dao.update(user);
    }
    /**
     * 更新用户密码
     * @param id 用户id
     * @param newPassword 用户新密码
     * @return
     */
    public int updatePassword(String id ,  String newPassword){
        User user = new User(id);
        user.setPassword(SystemUtils.entryptPassword(newPassword));
        return dao.updatePassword(user);
    }

    @Transactional(readOnly = false)
    public void saveUser(User user) {
        if (StringUtils.isBlank(user.getId())){
            user.preInsert();
            dao.insert(user);
        }else{
            user.preUpdate();
            dao.update(user);
        }
        if (StringUtils.isNotBlank(user.getId())){
            UserRole userRole = new UserRole();
            userRole.setUserId(user.getId());
            dao.deleteUserRole(userRole);
            List<UserRole> userRoleList = Lists.newArrayList();
            if(user.getRoleList() != null && !user.getRoleList().isEmpty()){
                for(Role role : user.getRoleList()){
                    UserRole ur = new UserRole(user.getId() , role.getId());
                    userRoleList.add(ur);
                }
            }
            dao.batchInsertUserRole(userRoleList);//批量插入用户角色关联
        }
    }
}
