<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseStatic" value="${pageContext.request.contextPath}/static"/>
<html>
<head>
    <title>登录</title>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta content="width=device-width, initial-scale=1" name="viewport" />

  <!-- 全局样式-->
<%--
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
--%>
  <link href="${baseStatic}/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <link href="${baseStatic}/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
  <link href="${baseStatic}/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="${baseStatic}/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />

  <link href="${baseStatic}/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
  <link href="${baseStatic}/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />

  <!--主题全局样式-->
  <link href="${baseStatic}/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
  <link href="${baseStatic}/global/css/plugins.min.css" rel="stylesheet" type="text/css" />

  <link href="${baseStatic}/pages/css/login.min.css" rel="stylesheet" type="text/css" />
  <link rel="shortcut icon" href="favicon.ico" /> </head>
</head>

<body class=" login">
<div class="logo">
    <label style="font-size: 30px;color: #fff">jeebase快速开发平台</label>
</div>

<div class="content">
  <!-- 登录 -->
  <form class="login-form" action="index.html" method="post">
    <h3 class="form-title font-green">登录</h3>

    <div class="alert alert-danger display-hide">
      <button class="close" data-close="alert"></button>
      <span> 请输入你的用户名和密码 </span>
    </div>

    <div class="form-group">
      <!--ie8, ie9 不支持placeholder , 采用标题显示-->
      <label class="control-label visible-ie8 visible-ie9">用户名</label>
      <input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名" name="username" />
    </div>
    <div class="form-group">
      <label class="control-label visible-ie8 visible-ie9">密码</label>
      <input class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="password" />
    </div>

    <div class="form-actions">
      <button type="submit" class="btn green uppercase">登录</button>
      <label class="rememberme check mt-checkbox mt-checkbox-outline">
        <input type="checkbox" name="remember" value="1" />记住我
        <span></span>
      </label>
    </div>
  </form>

</div>

<!--IE9-->
<script src="${baseStatic}/global/plugins/respond.min.js"></script>
<script src="${baseStatic}/global/plugins/excanvas.min.js"></script>

<!-- js插件 -->
<script src="${baseStatic}/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${baseStatic}/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${baseStatic}/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="${baseStatic}/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${baseStatic}/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${baseStatic}/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>

<script src="${baseStatic}/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${baseStatic}/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${baseStatic}/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>

<script src="${baseStatic}/global/scripts/app.min.js" type="text/javascript"></script>

<script src="${baseStatic}/pages/scripts/login.min.js" type="text/javascript"></script>

</body>

</html>
