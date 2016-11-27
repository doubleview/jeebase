<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>区域编辑</title>
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
                    <span class="caption-subject font-blue-sharp bold uppercase">区域信息</span>
                </div>
                <div class="actions">
                    <a href="javascript:;" class="btn btn-circle blue" id="area-add">
                        <i class="fa fa-plus"></i> 添加子区域 </a>
                    <a href="javascript:;" class="btn btn-circle blue" id="area-edit">
                        <i class="fa fa-edit"></i> 编辑 </a>
                    <a href="javascript:;" class="btn btn-circle red" id="area-remove">
                        <i class="fa fa-times"></i> 删除 </a>
                    <a href="javascript:;" class="btn btn-circle blue" id="area-refresh">
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
                           id="area-table">
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
                            <th>类型</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${subAreaList}" var="subArea">
                            <tr>
                                <td>
                                    <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                        <input type="checkbox" class="checkboxes" value="${subArea.id}"/>
                                        <span></span>
                                    </label>
                                </td>
                                <td>${subArea.name}</td>
                                <td>${subArea.code}</td>
                                <td>${subArea.type}</td>
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
    var AreaShow = function () {

        var initTable = function () {

            var table = $('#area-table');
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

            $("#area-edit").click(function () {
                var $checked = $(".checkboxes:checked");
                if ($checked.size() > 1) {
                    window.parent.swal("只能选中一条编辑");
                    return;
                } else if ($checked.size() == 0) {
                    window.parent.swal("请选中一条进行编辑");
                    return;
                }
                var areaId = $(".checkboxes:checked").val();
                location.href = "${adminPath}/system/area/edit?id=" + areaId;
            });

            $("#area-add").click(function () {
                var $checked = $(".checkboxes:checked");
                if ($checked.size() > 1) {
                    window.parent.swal("只能选中一条添加");
                    return;
                } else if ($checked.size() == 0) {
                    window.parent.swal("请选中一条进行添加");
                    return;
                }
                var areaId = $(".checkboxes:checked").val();
                location.href = "${adminPath}/system/area/edit?parentId=" + areaId;
            });

            $("#area-remove").click(function () {
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
                            var areaId = $(".checkboxes:checked").val();
                            $.post("${adminPath}/system/area/del", {id: areaId}, function (result) {
                                if (result.code == "0") {
                                    window.parent.swal("删除成功!", "", "success");
                                    location.reload();
                                } else {
                                    window.parent.swal("删除失败!", result.message, "error");
                                }
                            });
                        });
            });

            $("#area-refresh").click(function () {
                location.href = "${adminPath}/system/area/show?parentId=0";
            });

        };

        return {
            init: function () {
                initTable();
            },
        }
    }();

    $(document).ready(function () {
        AreaShow.init();
    });
</script>
</body>
</html>