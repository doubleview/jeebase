<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="staticPath" value="${pageContext.request.contextPath}/static"/>
<c:set var="adminPath" value="${pageContext.request.contextPath}/admin"/>
<!DOCTYPE html>
<html lang="en">
    <!--<![endif]-->
    <head>
        <meta charset="utf-8" />
        <title>${productName}</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <!-- global-->
        <link href="${staticPath}/global/font/font.css" rel="stylesheet" type="text/css" />
        <link href="${staticPath}/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="${staticPath}/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="${staticPath}/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${staticPath}/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- page-->
        <link href="${staticPath}/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="${staticPath}/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
        <link href="${staticPath}/pages/css/lock.min.css" rel="stylesheet" type="text/css" />
        <link rel="shortcut icon" href="favicon.ico" />
    </head>
    <body class="">
        <div class="page-lock">
            <div class="page-logo">
                <a class="brand" href="index.html">
                    <img src="${staticPath}/pages/img/logo-big.png" alt="logo" /> </a>
            </div>
            <div class="page-body">
                <img class="page-lock-img" src="${staticPath}/pages/media/profile/profile.jpg" alt="">
                <div class="page-lock-info">
                    <h1>胡成超${currentUser.name}</h1>
                    <span class="email"> ${currentUser.email} </span>
                    <span class="locked"> Locked </span>
                    <form class="form-inline" action="${adminPath}/index">
                        <div class="input-group input-medium">
                            <input type="text" class="form-control" placeholder="Password">
                            <span class="input-group-btn">
                                <button type="submit" class="btn green icn-only">
                                    <i class="m-icon-swapright m-icon-white"></i>
                                </button>
                            </span>
                        </div>
                        <!-- /input-group -->
                        <div class="relogin">
                            <a href="login.html"> Not Bob Nilson ? </a>
                        </div>
                    </form>
                </div>
            </div>
            <div class="page-footer-custom"> 2016 &copy; jeebase快速开发平台 </div>
        </div>
        <!--[if lt IE 9]>
<script src="${staticPath}/global/plugins/respond.min.js"></script>
<script src="${staticPath}/global/plugins/excanvas.min.js"></script> 
<![endif]-->
        <!-- core-->
        <script src="${staticPath}/global/plugins/jquery.min.js" type="text/javascript"></script>
        <script src="${staticPath}/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="${staticPath}/global/plugins/js.cookie.min.js" type="text/javascript"></script>
        <script src="${staticPath}/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="${staticPath}/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="${staticPath}/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!-- page -->
        <script src="${staticPath}/global/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
        <script src="${staticPath}/global/scripts/app.min.js" type="text/javascript"></script>
        <script src="${staticPath}/pages/scripts/lock-2.min.js" type="text/javascript"></script>
    </body>

</html>