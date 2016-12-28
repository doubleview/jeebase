<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="staticPath" value="${pageContext.request.contextPath}/static"/>
<c:set var="adminPath" value="${pageContext.request.contextPath}/admin"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>500</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!---global-->
    <link href="${staticPath}/global/font/font.css" rel="stylesheet" type="text/css" />
    <link href="${staticPath}/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!--theme-->
    <link href="${staticPath}/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
    <!--page-->
    <link href="${staticPath}/pages/css/error.min.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="${staticPath}/favicon.ico" />
</head>
<body class=" page-404-full-page">
<div class="row">
    <div class="col-md-12 page-404">
        <div class="number font-red"> 500 </div>
        <div class="details">
            <h3>对不起，页面出了点问题</h3>
            <p>
                <a type="submit" class="btn red" href="javascript:history.go(-1)">返回上一页</a>
            </p>
        </div>
    </div>
</div>
</body>
</html>