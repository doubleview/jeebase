<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>部门管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@ include file="/WEB-INF/view/global/head-lib.jsp"%>
    <link href="${staticPath}/global/plugins/sweet-alert/css/sweet-alert.css" rel="stylesheet" type="text/css" />
    <link href="${staticPath}/global/plugins/jstree/dist/themes/default/style.min.css" rel="stylesheet" type="text/css"/>
    <script src="${staticPath}/global/plugins/sweet-alert/js/sweet-alert.min.js" type="text/javascript"></script>
    <script src="${staticPath}/global/plugins/jstree/dist/jstree.min.js" type="text/javascript"></script>
</head>
<body>
<div class="page-inner-container" style="padding: 0px 15px">
    <div class="row">

        <div class="col-md-3">
            <div class="portlet light bordered">
                <div class="portlet-title">
                    <div class="caption">

                        <i class="icon-social-dribbble font-blue-sharp"></i>
                        <span class="caption-subject font-blue-sharp bold uppercase">部门结构</span>
                    </div>
                    <div class="actions">
                        <a href="javascript:;">
                            <i class="fa fa-refresh" id="tree-refresh"></i>
                        </a>
                    </div>
                </div>
                <div class="portlet-body">
                    <div id="dept-tree">
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-9">
            <iframe id="deptFrame" src="${adminPath}/system/dept/show?parentId=0" width="100%" height="500px" frameborder="0"></iframe>
        </div>
        </div>

    </div>
</div>

<script>
    var Dept = function(){

        //刷新菜单树
        var refreshDeptTree = function () {
            $('#dept-tree').data('jstree', false);
            loadDeptTree();
        };

        var loadDeptTree = function(){
            $.getJSON("${adminPath}/system/dept/tree-data",function(result){
                if(result.code == "0"){
                    console.log("success");
                    $("#dept-tree").jstree({
                        "core": {
                            "themes": {
                                "responsive": false
                            },
                            "data": result.data
                        },
                        "plugins": ["types"]
                    });
                }
            });
        };

        var bindDeptTree = function(){
            $('#dept-tree').bind("activate_node.jstree", function (obj, e) {
                // 获取当前节点
                var currentNode = e.node;
                $("#deptFrame").attr("src","${adminPath}/system/dept/show?parentId=" + currentNode.id);
            });

            $("#tree-refresh").click(function(){
                refreshDeptTree();
            });
        };

          return {
            init: function(){
                loadDeptTree();
                bindDeptTree();
            },
        }
    }();

    $(document).ready(function () {
        Dept.init();
    });
</script>
</body>
</html>