<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="staticPath" value="${pageContext.request.contextPath}/static"/>
<c:set var="adminPath" value="${pageContext.request.contextPath}/admin"/>
<!DOCTYPE html>
<!--[if ie8]--><html lang="en" class="ie8 no-js">
<!--[if ie9]--> <html lang="en" class="ie9 no-js">
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>${productName}</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1" name="viewport" />
  <meta content="" name="description" />
  <meta content="" name="author" />
  <!-- 全局样式-->
    <link href="${staticPath}/global/font/font.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />

  <link href="${staticPath}/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/morris/morris.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/global/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css" />

    <!--组件-->
  <link href="${staticPath}/global/css/components.css" rel="stylesheet" id="style_components" type="text/css" />
  <link href="${staticPath}/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <!--布局样式-->
  <link href="${staticPath}/layouts/layout/css/layout.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/layouts/layout/css/themes/default.min.css" rel="stylesheet" type="text/css" id="style_color" />
  <link href="${staticPath}/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />
  <link rel="shortcut icon" href="favicon.ico" /> </head>
    <!--menu-tab-->
  <link href="${staticPath}/apps/css/menu-tab.css" rel="stylesheet" type="text/css" />

<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
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
          <!-- notification dropdown -->
          <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
          <li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar">
            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
              <i class="icon-bell"></i>
              <span class="badge badge-default"> 7 </span>
            </a>
            <ul class="dropdown-menu">
              <li class="external">
                <h3>
                  <span class="bold">12 pending</span> notifications</h3>
                <a href="page_user_profile_1.html">view all</a>
              </li>
              <li>
                <ul class="dropdown-menu-list scroller" style="height: 250px;" data-handle-color="#637283">
                  <li>
                    <a href="javascript:;">
                      <span class="time">just now</span>
                                                    <span class="details">
                                                        <span class="label label-sm label-icon label-success">
                                                            <i class="fa fa-plus"></i>
                                                        </span> New user registered. </span>
                    </a>
                  </li>
                  <li>
                    <a href="javascript:;">
                      <span class="time">3 mins</span>
                                                    <span class="details">
                                                        <span class="label label-sm label-icon label-danger">
                                                            <i class="fa fa-bolt"></i>
                                                        </span> Server #12 overloaded. </span>
                    </a>
                  </li>
                  <li>
                    <a href="javascript:;">
                      <span class="time">10 mins</span>
                                                    <span class="details">
                                                        <span class="label label-sm label-icon label-warning">
                                                            <i class="fa fa-bell-o"></i>
                                                        </span> Server #2 not responding. </span>
                    </a>
                  </li>
                  <li>
                    <a href="javascript:;">
                      <span class="time">14 hrs</span>
                                                    <span class="details">
                                                        <span class="label label-sm label-icon label-info">
                                                            <i class="fa fa-bullhorn"></i>
                                                        </span> Application error. </span>
                    </a>
                  </li>
                  <li>
                    <a href="javascript:;">
                      <span class="time">2 days</span>
                                                    <span class="details">
                                                        <span class="label label-sm label-icon label-danger">
                                                            <i class="fa fa-bolt"></i>
                                                        </span> Database overloaded 68%. </span>
                    </a>
                  </li>
                  <li>
                    <a href="javascript:;">
                      <span class="time">3 days</span>
                                                    <span class="details">
                                                        <span class="label label-sm label-icon label-danger">
                                                            <i class="fa fa-bolt"></i>
                                                        </span> A user IP blocked. </span>
                    </a>
                  </li>
                  <li>
                    <a href="javascript:;">
                      <span class="time">4 days</span>
                                                    <span class="details">
                                                        <span class="label label-sm label-icon label-warning">
                                                            <i class="fa fa-bell-o"></i>
                                                        </span> Storage Server #4 not responding dfdfdfd. </span>
                    </a>
                  </li>
                  <li>
                    <a href="javascript:;">
                      <span class="time">5 days</span>
                                                    <span class="details">
                                                        <span class="label label-sm label-icon label-info">
                                                            <i class="fa fa-bullhorn"></i>
                                                        </span> System Error. </span>
                    </a>
                  </li>
                  <li>
                    <a href="javascript:;">
                      <span class="time">9 days</span>
                                                    <span class="details">
                                                        <span class="label label-sm label-icon label-danger">
                                                            <i class="fa fa-bolt"></i>
                                                        </span> Storage server failed. </span>
                    </a>
                  </li>
                </ul>
              </li>
            </ul>
          </li>
          <!--inbox dropdown-->
          <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
          <li class="dropdown dropdown-extended dropdown-inbox" id="header_inbox_bar">
            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
              <i class="icon-envelope-open"></i>
              <span class="badge badge-default"> 4 </span>
            </a>
            <ul class="dropdown-menu">
              <li class="external">
                <h3>You have
                  <span class="bold">7 New</span> Messages</h3>
                <a href="app_inbox.html">view all</a>
              </li>
              <li>
                <ul class="dropdown-menu-list scroller" style="height: 275px;" data-handle-color="#637283">
                  <li>
                    <a href="#">
                                                    <span class="photo">
                                                        <img src="${staticPath}/layouts/layout3/img/avatar2.jpg" class="img-circle" alt=""> </span>
                                                    <span class="subject">
                                                        <span class="from"> Lisa Wong </span>
                                                        <span class="time">Just Now </span>
                                                    </span>
                      <span class="message"> Vivamus sed auctor nibh congue nibh. auctor nibh auctor nibh... </span>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                                                    <span class="photo">
                                                        <img src="${staticPath}/layouts/layout3/img/avatar3.jpg" class="img-circle" alt=""> </span>
                                                    <span class="subject">
                                                        <span class="from"> Richard Doe </span>
                                                        <span class="time">16 mins </span>
                                                    </span>
                      <span class="message"> Vivamus sed congue nibh auctor nibh congue nibh. auctor nibh auctor nibh... </span>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                                                    <span class="photo">
                                                        <img src="${staticPath}/layouts/layout3/img/avatar1.jpg" class="img-circle" alt=""> </span>
                                                    <span class="subject">
                                                        <span class="from"> Bob Nilson </span>
                                                        <span class="time">2 hrs </span>
                                                    </span>
                      <span class="message"> Vivamus sed nibh auctor nibh congue nibh. auctor nibh auctor nibh... </span>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                                                    <span class="photo">
                                                        <img src="${staticPath}/layouts/layout3/img/avatar2.jpg" class="img-circle" alt=""> </span>
                                                    <span class="subject">
                                                        <span class="from"> Lisa Wong </span>
                                                        <span class="time">40 mins </span>
                                                    </span>
                      <span class="message"> Vivamus sed auctor 40% nibh congue nibh... </span>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                                                    <span class="photo">
                                                        <img src="${staticPath}/layouts/layout3/img/avatar3.jpg" class="img-circle" alt=""> </span>
                                                    <span class="subject">
                                                        <span class="from"> Richard Doe </span>
                                                        <span class="time">46 mins </span>
                                                    </span>
                      <span class="message"> Vivamus sed congue nibh auctor nibh congue nibh. auctor nibh auctor nibh... </span>
                    </a>
                  </li>
                </ul>
              </li>
            </ul>
          </li>
          <!--dropdown-->
          <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
          <li class="dropdown dropdown-extended dropdown-tasks" id="header_task_bar">
            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
              <i class="icon-calendar"></i>
              <span class="badge badge-default"> 3 </span>
            </a>
            <ul class="dropdown-menu extended tasks">
              <li class="external">
                <h3>你有
                  <span class="bold">12个待处理</span> 任务</h3>
                <a href="app_todo.html">查看所有</a>
              </li>
              <li>
                <ul class="dropdown-menu-list scroller" style="height: 275px;" data-handle-color="#637283">
                  <li>
                    <a href="javascript:;">
                                                    <span class="task">
                                                        <span class="desc">New release v1.2 </span>
                                                        <span class="percent">30%</span>
                                                    </span>
                                                    <span class="progress">
                                                        <span style="width: 40%;" class="progress-bar progress-bar-success" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
                                                            <span class="sr-only">40% Complete</span>
                                                        </span>
                                                    </span>
                    </a>
                  </li>
                  <li>
                    <a href="javascript:;">
                                                    <span class="task">
                                                        <span class="desc">Application deployment</span>
                                                        <span class="percent">65%</span>
                                                    </span>
                                                    <span class="progress">
                                                        <span style="width: 65%;" class="progress-bar progress-bar-danger" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100">
                                                            <span class="sr-only">65% Complete</span>
                                                        </span>
                                                    </span>
                    </a>
                  </li>
                  <li>
                    <a href="javascript:;">
                                                    <span class="task">
                                                        <span class="desc">Mobile app release</span>
                                                        <span class="percent">98%</span>
                                                    </span>
                                                    <span class="progress">
                                                        <span style="width: 98%;" class="progress-bar progress-bar-success" aria-valuenow="98" aria-valuemin="0" aria-valuemax="100">
                                                            <span class="sr-only">98% Complete</span>
                                                        </span>
                                                    </span>
                    </a>
                  </li>
                  <li>
                    <a href="javascript:;">
                                                    <span class="task">
                                                        <span class="desc">Database migration</span>
                                                        <span class="percent">10%</span>
                                                    </span>
                                                    <span class="progress">
                                                        <span style="width: 10%;" class="progress-bar progress-bar-warning" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">
                                                            <span class="sr-only">10% Complete</span>
                                                        </span>
                                                    </span>
                    </a>
                  </li>
                  <li>
                    <a href="javascript:;">
                                                    <span class="task">
                                                        <span class="desc">Web server upgrade</span>
                                                        <span class="percent">58%</span>
                                                    </span>
                                                    <span class="progress">
                                                        <span style="width: 58%;" class="progress-bar progress-bar-info" aria-valuenow="58" aria-valuemin="0" aria-valuemax="100">
                                                            <span class="sr-only">58% Complete</span>
                                                        </span>
                                                    </span>
                    </a>
                  </li>
                  <li>
                    <a href="javascript:;">
                                                    <span class="task">
                                                        <span class="desc">Mobile development</span>
                                                        <span class="percent">85%</span>
                                                    </span>
                                                    <span class="progress">
                                                        <span style="width: 85%;" class="progress-bar progress-bar-success" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100">
                                                            <span class="sr-only">85% Complete</span>
                                                        </span>
                                                    </span>
                    </a>
                  </li>
                  <li>
                    <a href="javascript:;">
                                                    <span class="task">
                                                        <span class="desc">New UI release</span>
                                                        <span class="percent">38%</span>
                                                    </span>
                                                    <span class="progress progress-striped">
                                                        <span style="width: 38%;" class="progress-bar progress-bar-important" aria-valuenow="18" aria-valuemin="0" aria-valuemax="100">
                                                            <span class="sr-only">38% Complete</span>
                                                        </span>
                                                    </span>
                    </a>
                  </li>
                </ul>
              </li>
            </ul>
          </li>

            <!--user-->
            <li class="dropdown dropdown-user">
            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
              <img alt="" class="img-circle" src="${staticPath}/layouts/layout/img/avatar3_small.jpg" />
              <span class="username username-hide-on-mobile"> ${currentUser.name} </span>
              <i class="fa fa-angle-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-default">
              <li>
                <a href="page_user_profile_1.html">
                  <i class="icon-user"></i> 我的主页 </a>
              </li>
              <li>
                <a href="app_calendar.html">
                  <i class="icon-calendar"></i> 我的日历 </a>
              </li>
              <li>
                <a href="app_inbox.html">
                  <i class="icon-envelope-open"></i> 我的收件箱
                  <span class="badge badge-danger"> 3 </span>
                </a>
              </li>
              <li>
                <a href="app_todo.html">
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
                <a href="page_user_login_1.html">
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

  </div>
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
                    <c:if test="${menu1.subMenuList != null}">
                        <ul class="sub-menu">
                            <c:forEach items="${menu1.subMenuList}" var="menu2">
                                <li class="nav-item">
                                    <a href="javascript:;" target="_blank" class="nav-link">
                                         ${menu2.name}
                                        <c:if test="${not empty menu2.subMenuList}"><span class="arrow nav-toggle"></span></c:if>
                                    </a>
                                    <c:if test="${menu2.subMenuList != null}">
                                        <ul class="sub-menu">
                                            <c:forEach items="${menu2.subMenuList}" var="menu3">
                                                <li class="nav-item">
                                                    <a href="javascript:;" target="_blank" class="nav-link">
                                                        ${menu3.name}
                                                        <c:if test="${not empty menu3.subMenuList}"><span class="arrow nav-toggle"></span></c:if>
                                                    </a>
                                                    <c:if test="${menu3.subMenuList != null}">
                                                        <ul class="sub-menu">
                                                            <c:forEach items="${menu3.subMenuList}" var="menu4">
                                                                <li class="nav-item">
                                                                    <a href="javascript:;" target="_blank" class="nav-link">
                                                                         ${menu4.name}
                                                                        <c:if test="${not empty menu4.subMenuList}"><span class="arrow nav-toggle"></span></c:if>
                                                                    </a>
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

    <!-- content -->
    <div class="page-content-wrapper">
      <div class="page-content">

          <!--选项卡-->
          <div class="row content-tabs">
              <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
              </button>
              <nav class="page-tabs J_menuTabs">
                  <div class="page-tabs-content">
                      <a href="javascript:;" class="active J_menuTab" data-id="index_v1.html">首页</a>
                  </div>
              </nav>
              <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
              </button>
              <div class="btn-group roll-nav roll-right">
                  <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>
                  </button>
                  <ul role="menu" class="dropdown-menu dropdown-menu-right" ">
                      <li class="J_tabShowActive"><a>定位当前选项卡</a></li>
                      <li class="divider"></li>
                      <li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
                      <li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
                  </ul>
              </div>
          </div>

          <div class="row " id="content-main">
              <iframe class="J_iframe" name="iframe0" width="100%" height="500px"  src="tabindex" frameborder="0" data-id="tabindex" seamless></iframe>
          </div>

      </div>
    </div>

  </div>

  <!-- footer -->
  <div class="page-footer">
    <div class="page-footer-inner"> 2016 &copy; jeebase By
      <a target="_blank" href="http://keenthemes.com">doubleview</a> &nbsp;|&nbsp;
    </div>
    <div class="scroll-to-top">
      <i class="icon-arrow-up"></i>
    </div>
  </div>

</div>


<!--[if ie9]-->
<script src="${staticPath}/global/plugins/respond.min.js"></script>
<script src="${staticPath}/global/plugins/excanvas.min.js"></script>
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
<script src="${staticPath}/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
<script src="${staticPath}/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
<script src="${staticPath}/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>

<!--menu-tab-->
<script src="${staticPath}/apps/scripts/menu-tab.js" type="text/javascript"></script>

</body>