package com.doubleview.jeebase.system.service;

import com.doubleview.jeebase.support.base.BaseService;
import com.doubleview.jeebase.support.web.Page;
import com.doubleview.jeebase.system.dao.RoleDao;
import com.doubleview.jeebase.system.dao.UserDao;
import com.doubleview.jeebase.system.model.Role;
import com.doubleview.jeebase.system.model.User;
import com.doubleview.jeebase.system.model.UserRole;
import com.doubleview.jeebase.system.utils.ShiroUtils;
import com.doubleview.jeebase.system.utils.SystemCacheUtils;
import com.google.common.collect.Lists;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * 用户Service
 */
@Service
@Transactional(readOnly = true)
public class UserService extends BaseService<UserDao , User>{

    @Autowired
    private RoleDao roleDao;

    /**
     * 根据登录名获取用户
     * @param loginName 登录名
     * @return
     */
    public User getUserByLoginName(String loginName) {
        User user =  dao.getByLoginName(loginName);
        injectRoleList(user);
        return user;
    }

    /**
     * 根据登录名获取用户
     * @param id 登录名
     * @return
     */
    public User get(String id) {
        User user =  super.get(id);
        injectRoleList(user);
        return user;
    }

    public Page<User> getPage(Page<User> page, User user) {
        if (user.getDepartment() != null && StringUtils.isNotBlank(user.getDepartment().getId())) {
            List<String> subDeptIds = SystemCacheUtils.getsubDeptIds(user.getDepartment().getId() ,
                    SystemCacheUtils.getDepartmentList());
            subDeptIds.add(user.getDepartment().getId());
            user.setDepartmentIds(subDeptIds);
        }
        return  super.getPage(page , user);
    }

    /**
     * 注入角色信息
     * @param user
     */
    private void injectRoleList(User user) {
        if(user != null){
            Role role = new Role();
            role.setUser(user);
            user.setRoleList(roleDao.getList(role));
        }
    }

    /**
     * 通过部门ID获取用户列表，仅返回用户id和name（树查询用户时用）
     * @param departmentId 部门id
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<User> getUserByDepartmentId(String departmentId) {
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
    @Transactional(readOnly = false)
    public int updateLoginInfo(User user , HttpServletRequest request){
        user.setOldLoginIp(request.getRemoteAddr());
        user.setLoginDate(new Date());
        return dao.updateLoginInfo(user);
    }

    /**
     * 更新用户密码
     * @param id 用户id
     * @param newPassword 用户新密码
     * @return
     */
    @Transactional(readOnly = false)
    public int updatePassword(String id ,  String newPassword){
        User user = new User(id);
        user.setPassword(ShiroUtils.entryptPassword(newPassword));
        return dao.updatePassword(user);
    }

    @Transactional(readOnly = false)
    public void save(User user) {
        //设置密码
        if(StringUtils.isNotBlank(user.getNewPassword()) &&
                user.getNewPassword().equals(user.getConfirmNewPassword())){
            user.setPassword(ShiroUtils.entryptPassword(user.getNewPassword()));
        }
        super.save(user);
        if (StringUtils.isNotBlank(user.getId())){
            UserRole userRole = new UserRole();
            userRole.setUserId(user.getId());
            //更新用户的角色信息
            dao.deleteUserRole(userRole);
            if(CollectionUtils.isNotEmpty(user.getRoleIdList())){
                List<UserRole> userRoleList = Lists.newArrayList();
                for(String roleId : user.getRoleIdList()){
                    UserRole ur = new UserRole(user.getId() , roleId);
                    userRoleList.add(ur);
                }
                dao.batchInsertUserRole(userRoleList);//批量插入用户角色关联
            }
        }
    }
}
