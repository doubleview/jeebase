<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>部门编辑</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@ include file="/WEB-INF/view/global/head-lib.jsp" %>
    <link href="${staticPath}/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet"
          type="text/css"/>
    <script src="${staticPath}/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"
            type="text/javascript"></script>
</head>
<body>

<div class="page-inner-container" style="padding: 0px 15px">
    <div class="row">
        <div class="portlet  light  bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="fa fa-cogs"></i>
                    <span class="caption-subject font-blue-sharp bold uppercase">部门信息</span>
                </div>
                <div class="actions">
                    <a href="javascript:;" class="btn btn-circle blue" id="dept-add" data-id="${parentId}">
                        <i class="fa fa-plus"></i> 添加子部门 </a>
                    <a href="javascript:;" class="btn btn-circle blue" id="dept-edit">
                        <i class="fa fa-edit"></i> 编辑 </a>
                    <a href="javascript:;" class="btn btn-circle red" id="dept-remove">
                        <i class="fa fa-times"></i> 删除 </a>
                    <a href="javascript:;" class="btn btn-circle blue" id="dept-refresh">
                        <i class="fa fa-refresh"></i> 刷新 </a>
                </div>
            </div>
            <div class="portlet-body">
                <c:if test="${not empty message}">
                    <div class="alert alert-success">
                        <button class="close" data-close="alert"></button>
                            ${message}</div>
                </c:if>
                <div class="table-scrollable">
                    <table class="table table-bordered table-striped table-condensed table-hover table-checkable"
                           id="dept-table">
                        <thead>
                        <tr>
                            <th class="table-checkbox">
                                <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                    <input type="checkbox" class="group-checkable"/>
                                    <span></span>
                                </label>
                            </th>
                            <th> 名称</th>
                            <th> 编码</th>
                            <th>电话</th>
                            <th>邮箱</th>
                            <th>所属区域</th>
                            <th>负责人</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${subDeptList}" var="subDept">
                            <tr>
                                <td>
                                    <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                        <input type="checkbox" class="checkboxes" value="${subDept.id}"/>
                                        <span></span>
                                    </label>
                                </td>
                                <td>${subDept.name}</td>
                                <td>${subDept.code}</td>
                                <td>${subDept.phone}</td>
                                <td>${subDept.email}</td>
                                <td>${subDept.area.name}</td>
                                <td>${subDept.master.name}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</div>
</div>

<script>
    var MenuShow = function () {

        var initTable = function () {

            var table = $('#dept-table');
            table.find('.group-checkable').change(function () {
                var checked = jQuery(this).is(":checked");
                jQuery(".checkboxes").each(function () {
                    if (checked) {
                        $(this).prop("checked", true);
                    } else {
                        $(this).prop("checked", false);
                    }
                });
            });

            $("#dept-edit").click(function () {
                var $checked = $(".checkboxes:checked");
                if ($checked.size() > 1) {
                    window.parent.swal("只能选中一条编辑");
                    return;
                } else if ($checked.size() == 0) {
                    window.parent.swal("请选中一条进行编辑");
                    return;
                }
                var deptId = $(".checkboxes:checked").val();
                location.href = "${adminPath}/system/dept/edit?id=" + deptId;
            });

            $("#dept-add").click(function () {
                var parentId = $(this).attr("data-id");
                location.href = "${adminPath}/system/dept/edit?parentId=" + parentId;
            });

            $("#dept-remove").click(function () {
                var $checked = $(".checkboxes:checked");
                if ($checked.size() == 0) {
                    window.parent.swal("请至少选中一条删除");
                    return;
                }
                window.parent.swal({
                            title: "确认删除么?",
                            type: "warning",
                            showCancelButton: true,
                            confirmButtonColor: '#DD6B55',
                            confirmButtonText: '确认',
                            cancelButtonText: "取消",
                            closeOnConfirm: false,
                        },
                        function () {
                            var deptId = $(".checkboxes:checked").val();
                            $.post("${adminPath}/system/dept/del", {id: deptId}, function (result) {
                                if (result.code == "0") {
                                    window.parent.swal("删除成功!", "", "success");
                                    location.reload();
                                } else {
                                    window.parent.swal("删除失败!", result.message, "error");
                                }
                            });
                        });
            });

            $("#dept-refresh").click(function () {
                location.href = "${adminPath}/system/dept/show?parentId=0";
            });

        };

        return {
            init: function () {
                initTable();
            },
        }
    }();

    $(document).ready(function () {
        MenuShow.init();
    });
</script>
</body>
</html>