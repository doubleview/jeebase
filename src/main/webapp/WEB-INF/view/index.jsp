<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>${productName}</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@ include file="/WEB-INF/view/global/head-lib.jsp" %>
    <!--layout and theme-->
    <link href="${staticPath}/global/layout/css/layout.css" rel="stylesheet" type="text/css"/>
    <link href="${staticPath}/global/layout/css/themes/default.min.css" rel="stylesheet" type="text/css" id="style_color"/>
    <link href="${staticPath}/pages/css/menu-tab.css" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="${staticPath}/favicon.ico"/>
    <!--layout-->
    <script src="${staticPath}/global/layout/scripts/layout.js" type="text/javascript"></script>
    <!--menu-tab-->
    <script src="${staticPath}/global/plugins/layer/layer.min.js" type="text/javascript"></script>
    <script src="${staticPath}/pages/scripts/menu-tab.js" type="text/javascript"></script>
</head>

<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white <%--page-sidebar-fixed--%>">
<!--page-warper-->
<div class="page-wrapper">
  <!-- header -->
  <div class="page-header navbar navbar-fixed-top">
    <!-- header inner -->
    <div class="page-header-inner ">
      <!-- logo -->
      <div class="page-logo">
        <a href="${adminPath}/index" class="logo-default">
            jeebase
        </a>
        <div class="menu-toggler sidebar-toggler">
          <span></span>
        </div>
      </div>
      <!-- responsive menu toggler -->
      <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
        <span></span>
      </a>

      <!--top nagivation menu-->
      <div class="top-menu">
        <ul class="nav navbar-nav pull-right">
            <!--user-->
            <li class="dropdown dropdown-user">
            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
              <img alt="" class="img-circle" src="${pageContext.request.contextPath}${currentUser.photo}" />
              <span class="username username-hide-on-mobile"> ${currentUser.name} </span>
              <i class="fa fa-angle-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-default">
<<<<<<< HEAD
              <li><a href="${adminPath}/system/user/user-profile" class="menu-item"><i class="icon-user"></i> 账户设置 </a></li>
=======
              <li><a href="${adminPath}/system/user/profile" class="menu-item"><i class="icon-user"></i> 我的主页 </a></li>
>>>>>>> c8a5ea59c9c7f24d421849f4c7e1d51d18cad5f3
              <li><a href=""><i class="icon-calendar"></i> 我的日历 </a></li>
              <li>
                  <a href=""><i class="icon-envelope-open"></i> 我的收件箱
                    <span class="badge badge-danger"> 3 </span>
                </a>
              </li>
              <li>
                  <a href="">
                  <i class="icon-rocket"></i> 我的任务
                  <span class="badge badge-success"> 7 </span>
                </a>
              </li>
              <li class="divider"> </li>
              <li>
                <a href="${adminPath}/lock">
                  <i class="icon-lock"></i> 锁屏 </a>
              </li>
              <li>
                <a href="${adminPath}/logout">
                  <i class="icon-key"></i> 退出 </a>
              </li>
            </ul>
          </li>
            <!--logout-->
          <li class="dropdown dropdown-quick-sidebar-toggler">
            <a href="${adminPath}/logout" class="dropdown-toggle">
              <i class="icon-logout"></i>
            </a>
          </li>
        </ul>
      </div>
    </div>
      <!---end header inner-->
  </div>
    <!--end page header-->
<div class="clearfix"> </div>

  <!-- container -->
  <div class="page-container">
    <div class="page-sidebar-wrapper">
      <div class="page-sidebar navbar-collapse collapse">
        <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
          <!--  sidebar toggler button -->
          <li class="sidebar-toggler-wrapper hide">
            <div class="sidebar-toggler">
              <span></span>
            </div>
          </li>
          <!--搜索栏-->
            <li class="sidebar-search-wrapper">
                <!--responsive quick search form-->
                <form class="sidebar-search  " action="page_general_search_3.html" method="POST">
                  <a href="javascript:;" class="remove">
                    <i class="icon-close"></i>
                  </a>
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="搜索...">
                        <span class="input-group-btn">
                            <a href="javascript:;" class="btn submit">
                              <i class="icon-magnifier"></i>
                            </a>
                        </span>
                  </div>
                </form>
          </li>

          <li class="nav-item start active open">
            <a href="javascript:;" class="nav-link nav-toggle">
              <i class="icon-home"></i>
              <span class="title">后台管理首页</span>
              <span class="selected"></span>
              <span class="arrow open"></span>
            </a>
          </li>

            <!--菜单栏-->
            <c:forEach items="${menuList}" var="menu1">
                <li class="nav-item">
                    <a href="javascript:;" class="nav-link nav-toggle">
                        <i class="${menu1.icon}"></i>
                        <span class="title">${menu1.name}</span>
                        <span class="arrow "></span>
                    </a>
                    <c:if test="${not empty menu1.subMenuList}">
                        <ul class="sub-menu">
                            <c:forEach items="${menu1.subMenuList}" var="menu2">
                                <li class="nav-item">
                                    <c:choose>
                                        <c:when test="${not empty menu2.subMenuList}">
                                            <a href="javascript:;" class="nav-link nav-toggle">
                                                    ${menu2.name}
                                                <span class="arrow"></span>
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${adminPath}${menu2.href}" class="nav-link menu-item">
                                                    ${menu2.name}
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:if test="${not empty menu2.subMenuList}">
                                        <ul class="sub-menu">
                                            <c:forEach items="${menu2.subMenuList}" var="menu3">
                                                <li class="nav-item">
                                                    <c:choose>
                                                        <c:when test="${not empty menu3.subMenuList}">
                                                            <a href="javascript:;"  class="nav-link nav-toggle">
                                                                    ${menu3.name}
                                                                <span class="arrow"></span>
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="${adminPath}${menu3.href}"  class="nav-link menu-item">
                                                                    ${menu3.name}
                                                            </a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <c:if test="${not empty menu3.subMenuList}">
                                                        <ul class="sub-menu">
                                                            <c:forEach items="${menu3.subMenuList}" var="menu4">
                                                                <li class="nav-item">
                                                                        <c:choose>
                                                                            <c:when test="${not empty menu4.subMenuList}">
                                                                            <a href="javascript:;" class="nav-link nav-toggle">
                                                                                    ${menu4.name}
                                                                                <span class="arrow"></span>
                                                                            </a>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                            <a href="${adminPath}${men4.href}" class="nav-link menu-item">
                                                                                ${menu4.name}
                                                                            </a>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </c:if>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </c:if>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>
                </li>
            </c:forEach>

        </ul>
      </div>
    </div>

    <!-- content-warpper -->
    <div class="page-content-wrapper">
      <div class="page-content">


          <!--选项卡-->
          <div class="row content-tabs">
              <button class="roll-nav roll-left tab-left"><i class="fa fa-backward"></i></button>
              <nav class="page-tabs menu-tabs">
                  <div class="page-tabs-content">
                      <a href="javascript:;" class="active menu-tab" data-id="${adminPath}/index.jsp">首页</a>
                  </div>
              </nav>
              <button class="roll-nav roll-right tab-right"><i class="fa fa-forward"></i></button>
              <div class="btn-group roll-nav roll-right">
                  <button class="dropdown tab-close" data-toggle="dropdown">关闭操作<span class="caret"></span>
                  </button>
                  <ul role="menu" class="dropdown-menu dropdown-menu-right">
                      <li class="show-active"><a>定位当前选项卡</a></li>
                      <li class="divider"></li>
                      <li class="close-all"><a>关闭全部选项卡</a></li>
                      <li class="close-other"><a>关闭其他选项卡</a></li>
                  </ul>
              </div>
          </div>

          <div class="full-height-content full-height-content-scrollable">
              <div class="full-height-content-body">
                  <div class="row menu-content" id="content-main">
                      <iframe class="menu-iframe" name="iframe0" width="100%" height="99%"  src="tabindex" frameborder="0" data-id="tabindex" seamless></iframe>
                  </div>
              </div>
          </div>
      </div>
    </div>
      <!--end content-wrapper-->
  </div>

      <!-- footer -->
      <div class="page-footer">
        <div class="page-footer-inner"> 2016 &copy; jeebase By
          <a target="_blank" href="https://github.com/doubleview">doubleview</a>
        </div>
        <div class="scroll-to-top">
          <i class="icon-arrow-up"></i>
        </div>
      </div>
    <!--end footer-->

</div>
<!--end page-wraper-->
</body>
</html>
