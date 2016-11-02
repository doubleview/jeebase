<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="staticPath" value="${pageContext.request.contextPath}/static"/>
<c:set var="adminPath" value="${pageContext.request.contextPath}/admin"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>菜单编辑</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!--plugins-->
    <link href="${staticPath}/global/font/font.css" rel="stylesheet" type="text/css"/>
    <link href="${staticPath}/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${staticPath}/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${staticPath}/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
    <link href="${staticPath}/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${staticPath}/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <!--component-->
    <link href="${staticPath}/global/css/components.css" rel="stylesheet" id="style_components" type="text/css"/>
    <link href="${staticPath}/global/css/plugins.min.css" rel="stylesheet" type="text/css"/>
    <link href="${staticPath}/layouts/layout/css/iframecontainer.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<div class="page-iframe-container">
    <div class="row">
            <div class="portlet  light  bordered">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-cogs"></i>
                        <span class="caption-subject font-blue-sharp bold uppercase">菜单内容</span>
                    </div>
                    <div class="actions">
                        <a href="javascript:;" class="btn btn-circle blue" id="menu-add">
                            <i class="fa fa-plus"></i> 添加子菜单 </a>
                        <a href="javascript:;" class="btn btn-circle blue" id="menu-edit">
                            <i class="fa fa-edit"></i> 编辑 </a>
                        <a href="javascript:;" class="btn btn-circle red" id="menu-remove">
                            <i class="fa fa-times"></i> 删除 </a>
                        <a href="javascript:;" class="btn btn-circle blue" id="menu-refresh">
                            <i class="fa fa-refresh"></i> 刷新 </a>
                    </div>
                </div>
                <div class="portlet-body">
                    <table class="table table-striped table-bordered table-hover table-checkable order-column" id="menu-table">
                        <thead>
                        <tr>
                            <th class="table-checkbox">
                                <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                    <input type="checkbox" class="group-checkable"/>
                                    <span></span>
                                </label>
                            </th>
                            <th> 名称 </th>
                            <th> 图标 </th>
                            <th> 链接 </th>
                            <th>是否显示</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${subMenuList}" var="subMenu">
                            <tr class="odd gradeX">
                                <td>
                                    <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                        <input type="checkbox" class="checkboxes" value="${subMenu.id}" />
                                        <span></span>
                                    </label>
                                </td>
                                <td>${subMenu.name}</td>
                                <td>
                                    <c:choose>
                                    <c:when test="${empty subMenu.icon}">
                                        无
                                    </c:when>
                                    <c:otherwise>
                                        ${subMenu.icon}
                                    </c:otherwise>
                                </c:choose></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${empty subMenu.href}">
                                            无
                                        </c:when>
                                        <c:otherwise>
                                            ${subMenu.href}
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <input type="checkbox" <c:if test="${subMenu.isShow eq '1'}">checked</c:if> readonly class="make-switch" data-size="mini">
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--plugins-->
<script src="${staticPath}/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/scripts/datatable.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!--page-->
<script src="${staticPath}/global/scripts/app.min.js" type="text/javascript"></script>
<script>
    var MenuEdit = function(){

        var initTable = function () {

            var table = $('#menu-table');
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

            $("#menu-edit").click(function(){
                var menuId = $(".checkboxes:checked").val();
                window.alert(menuId);
            });

            $("#menu-add").click(function(){
                var menuId = $(".checkboxes:checked").val();
                window.alert(menuId);
            });

            $("#menu-remove").click(function(){
                var menuId = $(".checkboxes:checked").val();
                window.alert(menuId);
            });

            $("#menu-refresh").click(function(){
                location.href = "${adminPath}/system/menu/show?id=0";
            });

        };

        return {
            init: function(){
                if (!jQuery().dataTable) {
                    return;
                }
                initTable();
            },
        }
    }();

    $(document).ready(function () {
        MenuEdit.init();
    });
</script>
</body>
</html>