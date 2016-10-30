<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="staticPath" value="${pageContext.request.contextPath}/static"/>
<c:set var="adminPath" value="${pageContext.request.contextPath}/admin"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>菜单管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!--plugins-->
    <link href="${staticPath}/global/font/font.css" rel="stylesheet" type="text/css"/>
    <link href="${staticPath}/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${staticPath}/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${staticPath}/global/plugins/jstree/dist/themes/default/style.min.css" rel="stylesheet" type="text/css"/>
    <link href="${staticPath}/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
    <link href="${staticPath}/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
    <!--component-->
    <link href="${staticPath}/global/css/components.css" rel="stylesheet" id="style_components" type="text/css"/>
    <link href="${staticPath}/global/css/plugins.min.css" rel="stylesheet" type="text/css"/>
    <link href="${staticPath}/layouts/layout/css/iframecontainer.css" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="${staticPath}/favicon.ico"/>
</head>
<body>

<div class="page-iframe-container">
    <div class="row">

        <div class="col-md-3">
            <div class="portlet light bordered">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="icon-social-dribbble font-blue-sharp"></i>
                        <span class="caption-subject font-blue-sharp bold uppercase">菜单结构</span>
                    </div>
                </div>
                <div class="portlet-body">
                    <div id="menu-tree">
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-9">

            <!-- BEGIN EXAMPLE TABLE PORTLET-->
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
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="odd gradeX">
                            <td>
                                <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                    <input type="checkbox" class="checkboxes" value="1" />
                                    <span></span>
                                </label>
                            </td>
                            <td> userwow </td>
                            <td>
                                <a href="mailto:userwow@gmail.com"> userwow@gmail.com </a>
                            </td>
                            <td>
                                <span class="label label-sm label-default"> Blocked </span>
                            </td>
                        </tr>
                        <tr class="odd gradeX">
                            <td>
                                <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                                    <input type="checkbox" class="checkboxes" value="1" />
                                    <span></span>
                                </label>
                            </td>
                            <td> test </td>
                            <td>
                                <a href="mailto:userwow@gmail.com"> test@gmail.com </a>
                            </td>
                            <td>
                                <span class="label label-sm label-success"> Approved </span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- END EXAMPLE TABLE PORTLET-->
        </div>
        </div>

    </div>
</div>
<!--plugins-->
<script src="${staticPath}/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/jstree/dist/jstree.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/scripts/datatable.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>>
<script src="${staticPath}/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<!--page-->
<script src="${staticPath}/global/scripts/app.min.js" type="text/javascript"></script>
<script>
    var Menu = function(){

        var loadMenuTree = function(){
            $.getJSON("${adminPath}/system/menu/tree-data",function(result){
                if(result.code == "0"){
                    console.log(result);
                    $("#menu-tree").jstree({
                        "core": {
                            "themes": {
                                "responsive": false
                            },
                            "data": result.data
                        },
                        "plugins": ["types"]
                    });
                    //$("#menu-tree .fa").addClass("icon-state-warning");
                }
            });
        };

        var bindMenuTree = function(){
            $('#menu-tree').bind("activate_node.jstree", function (obj, e) {
                // 获取当前节点
                var currentNode = e.node;
                window.alert(currentNode.text);
            });
        }

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
                window.alert("edit");
            });

            $("#menu-add").click(function(){
                window.alert("add");
            });

            $("#menu-remove").click(function(){
                window.alert("remove");
            });

        };

        return {
            init: function(){
                loadMenuTree();
                bindMenuTree();

                if (!jQuery().dataTable) {
                    return;
                }
                initTable();
            },
        }
    }();

    $(document).ready(function () {
        Menu.init();
    });
</script>
</body>
</html>