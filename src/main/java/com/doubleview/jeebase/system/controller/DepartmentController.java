package com.doubleview.jeebase.system.controller;

import com.doubleview.jeebase.support.base.BaseController;
import com.doubleview.jeebase.support.config.Constant;
import com.doubleview.jeebase.support.utils.CollectionUtils;
import com.doubleview.jeebase.support.web.ResponseResult;
import com.doubleview.jeebase.support.web.TreeDataResult;
import com.doubleview.jeebase.system.model.Department;
import com.doubleview.jeebase.system.service.DepartmentService;
import com.doubleview.jeebase.system.utils.SystemCacheUtils;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.Validate;
import org.apache.ibatis.ognl.CollectionElementsAccessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Objects;

/**
 * 部门控制器
 */
@RequestMapping("${adminPath}/system/dept")
@Controller
public class DepartmentController extends BaseController {


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
    public ResponseResult<Department> get(String id) {
        Validate.notBlank(id);
        Department department = departmentService.get(id);
        return success(department);
    }

    /**
     * 部门显示
     *
     * @param parentId
     * @return
     */
    @RequestMapping("show")
    public String show(String parentId, Model model) {
        Validate.notBlank(parentId);
        List<Department> subDeptList = Lists.newArrayList();
        Department parent = departmentService.get(parentId);
        if (!Objects.isNull(parent)) {
            subDeptList.add(parent);
        }
        subDeptList.addAll(departmentService.getByParentId(parentId));
        model.addAttribute("subDeptList", subDeptList);
        return "system/dept_show";
    }

    /**
     * 返回菜单树形数据
     *
     * @return
     */
    @RequestMapping("tree-data")
    @ResponseBody
    public ResponseResult<List<TreeDataResult>> treeData() {
        List<Department> departmentList = SystemCacheUtils.getDepartmentList();
        List<TreeDataResult> treeDataResultList = toTreeDataResult(departmentList);
        return success(treeDataResultList);
    }


    /**
     * 将部门列表转换为树形结构
     *
     * @param departmentList
     * @return
     */
    private List<TreeDataResult> toTreeDataResult(List<Department> departmentList) {

        if (CollectionUtils.isEmpty(departmentList)) {
            return null;
        }

        List<TreeDataResult> treeDataResultList = Lists.newArrayList();
        for (Department department : departmentList) {
            TreeDataResult treeDataResult = new TreeDataResult();
            treeDataResult.setId(department.getId());
            treeDataResult.setText(department.getName());

            if (CollectionUtils.isNotEmpty(department.getSubDeptList())) {
                treeDataResult.setIcon("fa fa-folder icon-state-warning");
            } else {
                treeDataResult.setIcon("fa fa-file icon-state-default");
            }
            if (department.getId().equals(Constant.rootId) || department.getParent().getId().equals("0")) {
                treeDataResult.setState(new TreeDataResult.State(true));
            }
            treeDataResult.setChildren(toTreeDataResult(department.getSubDeptList()));
            treeDataResultList.add(treeDataResult);
        }
        return treeDataResultList;
    }

    /**
     * 部门添加，编辑
     *
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
            department = new Department();
            if (parentId.equals(Constant.rootId)) {
                Department parent = new Department("0");
                parent.setName("顶级部门");
                department.setParent(parent);
            }else {
                department.setParent(departmentService.get(parentId));
            }
        } else {
            department = departmentService.get(id);
        }
        model.addAttribute("dept", department);
        return "system/dept_edit";
    }


    /**
     * 部门保存
     *
     * @param department
     */
    @RequestMapping("save")
    public String saveOrUpdate(Department department, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        departmentService.save(department);
        SystemCacheUtils.clearSystemCache(SystemCacheUtils.DEPARTMENT_LIST);
        redirectAttributes.addFlashAttribute("message", "保存部门'" + department.getName() + "'成功");
        redirectAttributes.addAttribute("parentId", department.getParent().getId());
        return "redirect:" + adminPath + "/system/dept/show";
    }

    /**
     * 部门删除
     *
     * @param id
     * @return
     */
    @RequestMapping("del")
    @ResponseBody
    public ResponseResult delete(String id) {
        try {
            departmentService.deleteAndChild(new Department(id));
            SystemCacheUtils.clearSystemCache(SystemCacheUtils.DEPARTMENT_LIST);
            return success("删除成功");
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            return fail(e.getMessage());
        }
    }

}
