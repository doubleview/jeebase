<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="staticPath" value="${pageContext.request.contextPath}/static"/>
<c:set var="adminPath" value="${pageContext.request.contextPath}/admin"/>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>404</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!---global-->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
    <link href="${staticPath}/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="${staticPath}/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="${staticPath}/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${staticPath}/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <!--theme-->
    <link href="${staticPath}/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
    <link href="${staticPath}/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <!--page-->
    <link href="${staticPath}/pages/css/error.min.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="favicon.ico" /> </head>
<body class=" page-404-full-page">
<div class="row">
    <div class="col-md-12 page-404">
        <div class="number font-red"> 404 </div>
        <div class="details">
            <h3>页面没找到</h3>
            <p> 对不起，页面好像去火星了
                <br/>
                <a href="index.html"> Return home </a> or try the search bar below. </p>
            <form action="#">
                <div class="input-group input-medium">
                    <input type="text" class="form-control" placeholder="keyword...">
                            <span class="input-group-btn">
                                <button type="submit" class="btn red">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                </div>
                <!-- /input-group -->
            </form>
        </div>
    </div>
</div>
<!--[if lt IE 9]>
<script src="${staticPath}/global/plugins/respond.min.js"></script>
<script src="${staticPath}/global/plugins/excanvas.min.js"></script>
<![endif]-->
<!--core-->
<script src="${staticPath}/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!--page-->
<script src="${staticPath}/global/scripts/app.min.js" type="text/javascript"></script>
</body>

</html>