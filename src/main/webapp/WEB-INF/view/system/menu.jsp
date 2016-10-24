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

    <!--layout and theme-->
   <%-- <link href="${staticPath}/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css"/>--%>
    <%--<link href="${staticPath}/layouts/layout/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>--%>
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
                        <span class="caption-subject font-blue-sharp bold uppercase">菜单管理</span>
                    </div>
                </div>
                <div class="portlet-body">
                    <div id="menu_tree" class="tree-demo">
                        <ul>
                            <li> root
                                <ul>
                                    <li data-jstree='{ "selected" : true }'>
                                        <a href="javascript:;"> Initially selected </a>
                                    </li>
                                    <li data-jstree='{ "icon" : "fa fa-briefcase icon-state-success " }'> custom icon URL
                                    </li>
                                    <li data-jstree='{ "opened" : true }'> initially open
                                        <ul>
                                            <li data-jstree='{ "disabled" : true }'> Disabled Node</li>
                                            <li data-jstree='{ "type" : "file" }'> Another node</li>
                                        </ul>
                                    </li>
                                    <li data-jstree='{ "icon" : "fa fa-warning icon-state-danger" }'> Custom icon class
                                        (bootstrap)
                                    </li>
                                </ul>
                            </li>
                            <li data-jstree='{ "type" : "file" }'>
                                <a href="http://www.jstree.com"> Clickanle link node </a>
                            </li>
                        </ul>
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

    jQuery(document).ready(function () {
        $('#tree_1').jstree({
            "core": {
                "themes": {
                    "responsive": false
                }
            },
            "types": {
                "default": {
                    "icon": "fa fa-folder icon-state-warning icon-lg"
                },
                "file": {
                    "icon": "fa fa-file icon-state-warning icon-lg"
                }
            },
            "plugins": ["types"]
        });

        // handle link clicks in tree nodes(support target="_blank" as well)
        $('#tree_1').on('select_node.jstree', function (e, data) {
            var link = $('#' + data.selected).find('a');
            if (link.attr("href") != "#" && link.attr("href") != "javascript:;" && link.attr("href") != "") {
                if (link.attr("target") == "_blank") {
                    link.attr("href").target = "_blank";
                }
                document.location.href = link.attr("href");
                return false;
            }
        });

    });
</script>

<script>
    $(document).ready(function () {

        $("#menu_tree").jstree({
            "core": {
                "data": [
                    "Empty Folder",
                    {
                        "text": "Resources",
                        "state": {"opened": true},
                        "children": [{
                            "text": "css",
                            "children": [{"text": "animate.css", "icon": "none"}, {
                                "text": "bootstrap.css",
                                "icon": "none"
                            }, {"text": "main.css", "icon": "none"}, {"text": "style.css", "icon": "none"}],
                            "state": {"opened": true}
                        }, {
                            "text": "js",
                            "children": [{"text": "bootstrap.js", "icon": "none"}, {
                                "text": "hplus.min.js",
                                "icon": "none"
                            }, {"text": "jquery.min.js", "icon": "none"}, {
                                "text": "jsTree.min.js",
                                "icon": "none"
                            }, {"text": "custom.min.js", "icon": "none"}],
                            "state": {"opened": true}
                        }, {
                            "text": "html",
                            "children": [{"text": "layout.html", "icon": "none"}, {
                                "text": "navigation.html",
                                "icon": "none"
                            }, {"text": "navbar.html", "icon": "none"}, {
                                "text": "footer.html",
                                "icon": "none"
                            }, {"text": "sidebar.html", "icon": "none"}],
                            "state": {"opened": true}
                        }]
                    },
                    "Fonts",
                    "Images",
                    "Scripts",
                    "Templates",]
            }
        })
    });
</script>
</body>
</html>