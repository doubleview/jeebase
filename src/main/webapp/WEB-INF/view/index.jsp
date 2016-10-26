<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="staticPath" value="${pageContext.request.contextPath}/static"/>
<c:set var="adminPath" value="${pageContext.request.contextPath}/admin"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>${productName}</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1" name="viewport" />
  <meta content="" name="description" />
  <meta content="" name="author" />
  <!-- plugins-->
   <link href="${staticPath}/global/font/font.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/morris/morris.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css" />

    <!--component-->
  <link href="${staticPath}/global/css/components.css" rel="stylesheet" id="style_components" type="text/css" />
  <link href="${staticPath}/global/css/plugins.min.css" rel="stylesheet" type="text/css" />

    <!--layout and theme-->
  <link href="${staticPath}/layouts/layout/css/layout.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/layouts/layout/css/themes/default.min.css" rel="stylesheet" type="text/css" id="style_color" />
  <link href="${staticPath}/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />
  <link rel="shortcut icon" href="${staticPath}/favicon.ico" />
    <!--menu-tab-->
    <link href="${staticPath}/apps/css/menu-tab.css" rel="stylesheet" type="text/css" />
</head>

<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-sidebar-fixed">
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
              <img alt="" class="img-circle" src="${staticPath}/layouts/layout/img/avatar3_small.jpg" />
              <span class="username username-hide-on-mobile"> ${currentUser.name} </span>
              <i class="fa fa-angle-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-default">
              <li>
                <a href="">
                  <i class="icon-user"></i> 我的主页 </a>
              </li>
              <li>
                <a href="">
                  <i class="icon-calendar"></i> 我的日历 </a>
              </li>
              <li>
                <a href="">
                  <i class="icon-envelope-open"></i> 我的收件箱
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
          <a target="_blank" href="https://github.com/doubleview">doubleview</a> &nbsp;|&nbsp;
        </div>
        <div class="scroll-to-top">
          <i class="icon-arrow-up"></i>
        </div>
      </div>
    <!--end footer-->

</div>
<!--end page-wraper-->

<!--core-->
<script src="${staticPath}/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>

<!--pugins-->
<script src="${staticPath}/global/plugins/moment.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/bootstrap-daterangepicker/daterangepicker.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/morris/morris.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/morris/raphael-min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/counterup/jquery.waypoints.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/counterup/jquery.counterup.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/amcharts/amcharts/amcharts.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/amcharts/amcharts/serial.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/amcharts/amcharts/pie.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/amcharts/amcharts/radar.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/amcharts/amcharts/themes/light.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/amcharts/amcharts/themes/patterns.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/amcharts/amcharts/themes/chalk.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/amcharts/ammap/ammap.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/amcharts/ammap/maps/js/worldLow.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/amcharts/amstockcharts/amstock.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/horizontal-timeline/horozontal-timeline.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/jquery-easypiechart/jquery.easypiechart.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/jqvmap/jqvmap/jquery.vmap.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js" type="text/javascript"></script>
<script src="${staticPath}/global/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js" type="text/javascript"></script>
<!--page-->
<script src="${staticPath}/global/scripts/app.min.js" type="text/javascript"></script>
<script src="${staticPath}/pages/scripts/dashboard.min.js" type="text/javascript"></script>
<!--layout-->
<script src="${staticPath}/layouts/layout/scripts/layout.js" type="text/javascript"></script>
<script src="${staticPath}/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
<script src="${staticPath}/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>

<!--menu-tab-->
<script src="${staticPath}/apps/scripts/menu-tab.js" type="text/javascript"></script>
<script src="${staticPath}/apps/scripts/layer/layer.min.js" type="text/javascript"></script>

</body>
</html>
