<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>菜单编辑</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@ include file="/WEB-INF/view/global/head-lib.jsp" %>
    <link href="${staticPath}/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />

    <script src="${staticPath}/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
</head>
<body>

<div class="page-inner-container" style="padding: 0px 15px">
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
                <div class="table-scrollable">
                    <table class="table table-bordered table-striped table-condensed table-hover table-checkable" id="menu-table">
                        <thead>
                        <tr>
                            <th class="table-checkbox">
                                <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                    <input type="checkbox" class="group-checkable"/>
                                    <span></span>
                                </label>
                            </th>
                            <th> 名称</th>
                            <th> 图标</th>
                            <th> 链接</th>
                            <th>是否显示</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${subMenuList}" var="subMenu">
                            <tr>
                                <td>
                                    <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                        <input type="checkbox" class="checkboxes" value="${subMenu.id}"/>
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
                                    <input type="checkbox"
                                           <c:if test="${subMenu.isShow eq '1'}">checked</c:if> readonly
                                           class="make-switch" data-size="mini">
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
</div>

<script>
    var MenuShow = function () {

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

            $("#menu-edit").click(function () {
                var menuId = $(".checkboxes:checked").val();
                window.alert(menuId);
            });

            $("#menu-add").click(function () {
                var menuId = $(".checkboxes:checked").val();
                window.alert(menuId);
            });

            $("#menu-remove").click(function () {
                var menuId = $(".checkboxes:checked").val();
                window.alert(menuId);
            });

            $("#menu-refresh").click(function () {
                location.href = "${adminPath}/system/menu/show?id=0";
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