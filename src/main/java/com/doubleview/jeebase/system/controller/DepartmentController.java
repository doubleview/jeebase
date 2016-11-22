package com.doubleview.jeebase.system.controller;

import com.doubleview.jeebase.support.base.BaseController;
import com.doubleview.jeebase.support.web.ResponseResult;
import com.doubleview.jeebase.support.web.TreeDataResult;
import com.doubleview.jeebase.system.model.Department;
import com.doubleview.jeebase.system.service.DepartmentService;
import com.doubleview.jeebase.system.utils.SystemCacheUtils;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 部门控制器
 */
@RequestMapping("${adminPath}/system/dept")
@Controller
public class DepartmentController extends BaseController{


    @Autowired
    private DepartmentService departmentService;

    /**
     * @return
     */
    @RequestMapping("")
    public String toDepartmentPage() {
        return "system/dept";
    }


    /**
     * 根据id获取Department
     *
     * @param id
     * @return
     */
    @RequestMapping("get")
    @ResponseBody
    public ResponseResult<Department> getDepartment(String id) {
        if (StringUtils.isBlank(id)) {
            throw new RuntimeException("id is null");
        }
        Department department = departmentService.get(id);
        return success(department);
    }


    /**
     * 返回菜单树形数据
     *
     * @return
     */
    @RequestMapping("tree-data")
    @ResponseBody
    public ResponseResult<List<TreeDataResult>> treeData() {
        List<Department> menuList = SystemCacheUtils.getDepartmentList();
        List<TreeDataResult> treeDataResultList = toTreeDataResult(menuList);
        return success(treeDataResultList);
    }


    /**
     * 将部门列表转换为树形结构
     *
     * @param departmentList
     * @return
     */
    private List<TreeDataResult> toTreeDataResult(List<Department> departmentList) {

        if (departmentList == null || departmentList.isEmpty()) {
            return null;
        }

        List<TreeDataResult> treeDataResultList = Lists.newArrayList();
        for (Department department : departmentList) {
            TreeDataResult treeDataResult = new TreeDataResult();
            treeDataResult.setId(department.getId());
            treeDataResult.setText(department.getName());

            if (department.getSubDeptList() != null && !department.getSubDeptList().isEmpty()) {
                treeDataResult.setIcon("fa fa-folder icon-state-warning");
            } else {
                treeDataResult.setIcon("fa fa-file icon-state-default");
            }
            if (department.getParent().getId().equals("0")) {
                treeDataResult.setState(new TreeDataResult.State(true));
            }
            treeDataResult.setChildren(toTreeDataResult(department.getSubDeptList()));
            treeDataResultList.add(treeDataResult);
        }
        return treeDataResultList;
    }


    /**
     * 部门显示
     * @param parentId
     * @return
     */
    @RequestMapping("show")
    public String show(String parentId , Model model){
        if(StringUtils.isBlank(parentId)){
            throw  new RuntimeException("parentId is null");
        }
        List<Department> subDeptList = departmentService.getByParentId(parentId);

        if(subDeptList == null || subDeptList.isEmpty()){
            Department department = departmentService.get(parentId);
            model.addAttribute("department" , department);
            return "system/dept_edit";
        }else {
            model.addAttribute("subDeptList" , subDeptList);
            model.addAttribute("parentId" , parentId);
        }
        return "system/dept_show";
    }


    /**
     * 部门添加，编辑
     * @param id
     * @return
     */
    @RequestMapping("edit")
    public String edit(String id, String parentId, Model model) {
        if (StringUtils.isBlank(id) && StringUtils.isBlank(parentId)) {
            throw new RuntimeException("id and parentId is null");
        }
        Department department = null;
        if (parentId != null) {
            //新增顶级部门
            if (parentId.equals("0")) {
                department = new Department();
                Department topDept = new Department("0");
                topDept.setName("顶级部门");
                department.setParent(topDept);
            } else {
                department = new Department();
                department.setParent(departmentService.get(parentId));
            }
        } else {
            department = departmentService.get(id);
        }
        model.addAttribute("department", department);
        return "system/dept_edit";
    }

    /**
     * 部门保存
     * @param department
     */
    @RequestMapping("save")
    public String saveOrUpdate(Department department , RedirectAttributes redirectAttributes, HttpServletRequest request){
        departmentService.save(department);
        SystemCacheUtils.clearSystemCache(SystemCacheUtils.DEPARTMENT_LIST);
        redirectAttributes.addFlashAttribute("message", "保存部门'" + department.getName() + "'成功");
        redirectAttributes.addAttribute("parentId",department.getParent().getId());
        return "redirect:" + adminPath + "/system/dept/show";
    }

    /**
     * 部门删除
     * @param id
     * @return
     */
    @RequestMapping("del")
    @ResponseBody
    public ResponseResult delete(String id){
        departmentService.deleteAndChild(new Department(id));
        SystemCacheUtils.clearSystemCache(SystemCacheUtils.DEPARTMENT_LIST);
        return  success("删除成功");
    }

}
