<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="staticPath" value="${pageContext.request.contextPath}/static"/>
<c:set var="adminPath" value="${pageContext.request.contextPath}/admin"/>
<html>
<head>
    <title>登录</title>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta content="width=device-width, initial-scale=1" name="viewport" />
  <!-- global-->
  <link href="${staticPath}/global/font/font.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css"/>
  <link href="${staticPath}/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
  <!--page-->
  <link href="${staticPath}/pages/css/login.css" rel="stylesheet" type="text/css" />
  <link rel="shortcut icon" href="favicon.ico" /> </head>
</head>

<body class=" login">
<div class="logo">
    <label style="font-size: 30px;color: #fff">${productName}</label>
</div>

<div class="content">
  <!-- login -->
  <form class="login-form" action="${adminPath}/login" method="post">
    <h3 class="form-title font-green">登录</h3>

    <div class="alert alert-danger display-hide">
      <button class="close" data-close="alert"></button>
      <span>请输入你的用户名和密码</span>
    </div>

    <c:if test="${message ne null}">
      <div class="alert alert-danger">
        <button class="close" data-close="alert"></button>
        <span> ${message}</span>
      </div>
    </c:if>

    <div class="form-group">
      <div class="input-icon">
       <!--ie8, ie9 不支持placeholder , 采用标题显示-->
        <label class="control-label visible-ie8 visible-ie9">用户名</label>
        <label class="icon-user"></label>
        <input class="form-control form-control-solid placeholder-no-fix has-success" autocomplete="off" type="text" placeholder="用户名" name="username" />
      </div>
    </div>

    <div class="form-group">
      <div class="input-icon">
        <label class="control-label visible-ie8 visible-ie9">密码</label>
        <label class="icon-lock"></label>
        <input class="form-control form-control-solid placeholder-no-fix has-success" autocomplete="off" type="password" placeholder="密码" name="password" />
      </div>
    </div>

    <div class="form-group">
      <div class="input-icon">
        <label class="control-label visible-ie8 visible-ie9">验证码</label>
        <label class="icon-grid"></label>
        <input class="form-control form-control-solid placeholder-no-fix captcha-field has-success" autocomplete="off" type="text"  placeholder="验证码" name="validateCode" />
        <img src="${adminPath}/validateCode" onclick="this.src = '${adminPath}/validateCode?v=' + Math.random()"/>
      </div>
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

<!-- global-- -->
<script src="${staticPath}/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>

<!--page-->
<script src="${staticPath}/global/scripts/app.min.js" type="text/javascript"></script>
<script>
  var Login = function() {

    var handleLogin = function() {

      $('.login-form').validate({
        errorElement: 'span', //default input error message container
        errorClass: 'help-block', // default input error message class
        focusInvalid: false, // do not focus the last invalid input
        rules: {
          username: {
            required: true
          },
          password: {
            required: true
          },
          remember: {
            required: false
          },
          validateCode: {
            required : true
          }
        },

        messages: {
          username: {
            required: "请输入用户名"
          },
          password: {
            required: "请输入密码"
          },
          validateCode: {
            required : "请输入验证码"
          }
        },


        highlight: function(element) {
          $(element).addClass('has-error').removeClass("has-success");
        },

        success: function(label) {
          label.prev(".input-icon").find(".has-error").removeClass('has-error').addClass("has-success");
          label.remove();
        },

        errorPlacement: function(error, element) {
          error.insertAfter(element.closest('.input-icon'));
        },

        submitHandler: function(form) {
          form.submit();
        }
      });

      $('.login-form input').keypress(function(e) {
        if (e.which == 13) {
          if ($('.login-form').validate().form()) {
            $('.login-form').submit(); //form validation success, call ajax form submit
          }
          return false;
        }
      });
    }

    return {
      //main function to initiate the module
      init: function() {
        handleLogin();
      }
    };

  }();
  jQuery(document).ready(function() {
    Login.init();
  });
</script>
</body>
</html>
