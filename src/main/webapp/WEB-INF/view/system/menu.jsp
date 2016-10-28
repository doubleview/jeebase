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
                    <div id="menu_tree" class="tree-demo">
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-9">

        </div>

    </div>
</div>
<!--plugins-->
<script src="${staticPath}/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!--jstree-->
<script src="${staticPath}/global/plugins/jstree/dist/jstree.min.js" type="text/javascript"></script>
<script>
    var Menu = function(){

        var loadMenuTree = function(){
            $.getJSON("${adminPath}/system/menu/tree-data",function(result){
                if(result.code == "0"){
                    console.log(result);
                    $("#menu_tree").jstree({
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

        var bindMenuTree = function(){
            $('#menu_tree').bind("activate_node.jstree", function (obj, e) {
                // 获取当前节点
                var currentNode = e.node;
                window.alert(currentNode.text);

            });
        }

        return {
            init: function(){
                loadMenuTree();
                bindMenuTree();
            },
        }
    }();

    $(document).ready(function () {
        Menu.init();
    });
</script>
</body>
</html>