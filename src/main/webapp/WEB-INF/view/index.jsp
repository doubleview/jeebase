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
  <title>jeebase快速开发平台</title>
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

  <link href="${staticPath}/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
  <link href="${staticPath}/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <!--布局样式-->
  <link href="${staticPath}/layouts/layout/css/layout.css" rel="stylesheet" type="text/css" />
  <link href="${staticPath}/layouts/layout/css/themes/light.min.css" rel="stylesheet" type="text/css" id="style_color" />
  <link href="${staticPath}/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />
  <link rel="shortcut icon" href="favicon.ico" /> </head>

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
          <!-- END NOTIFICATION DROPDOWN -->
          <!-- BEGIN INBOX DROPDOWN -->
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
          <!-- END INBOX DROPDOWN -->
          <!-- BEGIN TODO DROPDOWN -->
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

            <!--用户-->
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
                <a href="page_user_lock_1.html">
                  <i class="icon-lock"></i> 锁屏 </a>
              </li>
              <li>
                <a href="page_user_login_1.html">
                  <i class="icon-key"></i> 退出 </a>
              </li>
            </ul>
          </li>
            <!--注销-->
          <li class="dropdown dropdown-quick-sidebar-toggler">
            <a href="${adminPath}/logout" class="dropdown-toggle">
              <i class="icon-logout"></i>
            </a>
          </li>
        </ul>
      </div>
      <!-- END TOP NAVIGATION MENU -->
    </div>
    <!-- END HEADER INNER -->
  </div>
  <!-- END HEADER -->
  <!-- BEGIN HEADER & CONTENT DIVIDER -->
  <div class="clearfix"> </div>
  <!-- END HEADER & CONTENT DIVIDER -->










































  <!-- BEGIN CONTAINER -->
  <div class="page-container">
    <!-- BEGIN SIDEBAR -->
    <div class="page-sidebar-wrapper">
      <!-- BEGIN SIDEBAR -->
      <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
      <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
      <div class="page-sidebar navbar-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
        <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
        <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
        <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
          <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
          <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
          <li class="sidebar-toggler-wrapper hide">
            <div class="sidebar-toggler">
              <span></span>
            </div>
          </li>
          <!-- END SIDEBAR TOGGLER BUTTON -->
          <!-- DOC: To remove the search box from the sidebar you just need to completely remove the below "sidebar-search-wrapper" LI element -->
          <li class="sidebar-search-wrapper">
            <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
            <!-- DOC: Apply "sidebar-search-bordered" class the below search form to have bordered search box -->
            <!-- DOC: Apply "sidebar-search-bordered sidebar-search-solid" class the below search form to have bordered & solid search box -->
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
            <!-- END RESPONSIVE QUICK SEARCH FORM -->
          </li>

          <li class="nav-item start active open">
            <a href="javascript:;" class="nav-link nav-toggle">
              <i class="icon-home"></i>
              <span class="title">面板</span>
              <span class="selected"></span>
              <span class="arrow open"></span>
            </a>
            <ul class="sub-menu">
              <li class="nav-item start active open">
                <a href="index.html" class="nav-link ">
                  <i class="icon-bar-chart"></i>
                  <span class="title">面板 1</span>
                  <span class="selected"></span>
                </a>
              </li>
              <li class="nav-item start ">
                <a href="dashboard_2.html" class="nav-link ">
                  <i class="icon-bulb"></i>
                  <span class="title">面板 2</span>
                  <span class="badge badge-success">1</span>
                </a>
              </li>
              <li class="nav-item start ">
                <a href="dashboard_3.html" class="nav-link ">
                  <i class="icon-graph"></i>
                  <span class="title">面板 3</span>
                  <span class="badge badge-danger">5</span>
                </a>
              </li>
            </ul>
          </li>
          <li class="heading">
            <h3 class="uppercase">特色</h3>
          </li>
          <li class="nav-item  ">
            <a href="javascript:;" class="nav-link nav-toggle">
              <i class="icon-diamond"></i>
              <span class="title">UI 特色</span>
              <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
              <li class="nav-item  ">
                <a href="ui_colors.html" class="nav-link ">
                  <span class="title">颜色库</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_general.html" class="nav-link ">
                  <span class="title">常用组件</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_buttons.html" class="nav-link ">
                  <span class="title">按钮</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_buttons_spinner.html" class="nav-link ">
                  <span class="title">微调按钮</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_confirmations.html" class="nav-link ">
                  <span class="title">弹出按钮</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_icons.html" class="nav-link ">
                  <span class="title">字体图标</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_socicons.html" class="nav-link ">
                  <span class="title">社区图标</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_typography.html" class="nav-link ">
                  <span class="title">面板</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_tabs_accordions_navs.html" class="nav-link ">
                  <span class="title">标签，导航页</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_timeline.html" class="nav-link ">
                  <span class="title">时间线 1</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_timeline_2.html" class="nav-link ">
                  <span class="title">时间线 2</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_timeline_horizontal.html" class="nav-link ">
                  <span class="title">水平时间线</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_tree.html" class="nav-link ">
                  <span class="title">树</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="javascript:;" class="nav-link nav-toggle">
                  <span class="title">进度条</span>
                  <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                  <li class="nav-item ">
                    <a href="ui_page_progress_style_1.html" class="nav-link "> Flash </a>
                  </li>
                  <li class="nav-item ">
                    <a href="ui_page_progress_style_2.html" class="nav-link "> Big Counter </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item  ">
                <a href="ui_blockui.html" class="nav-link ">
                  <span class="title">块级 UI</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_bootstrap_growl.html" class="nav-link ">
                  <span class="title">Bootstrap提示</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_notific8.html" class="nav-link ">
                  <span class="title">Notific8提示</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_toastr.html" class="nav-link ">
                  <span class="title">Toastr提示</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_bootbox.html" class="nav-link ">
                  <span class="title">Bootbox对话框</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_alerts_api.html" class="nav-link ">
                  <span class="title">Metronic警示条API</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_session_timeout.html" class="nav-link ">
                  <span class="title">Session超时</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_idle_timeout.html" class="nav-link ">
                  <span class="title">用户空闲超时</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_modals.html" class="nav-link ">
                  <span class="title">弹出框</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_extended_modals.html" class="nav-link ">
                  <span class="title">扩展弹出框</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_tiles.html" class="nav-link ">
                  <span class="title">标签条</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_datepaginator.html" class="nav-link ">
                  <span class="title">时间选择</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="ui_nestable.html" class="nav-link ">
                  <span class="title">嵌套列表</span>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item  ">
            <a href="javascript:;" class="nav-link nav-toggle">
              <i class="icon-puzzle"></i>
              <span class="title">组件</span>
              <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
              <li class="nav-item  ">
                <a href="components_date_time_pickers.html" class="nav-link ">
                  <span class="title">时间选择器</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="components_color_pickers.html" class="nav-link ">
                  <span class="title">颜色选择</span>
                  <span class="badge badge-danger">2</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="components_select2.html" class="nav-link ">
                  <span class="title">下拉选择框</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="components_bootstrap_select.html" class="nav-link ">
                  <span class="title">Bootstrap选择</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="components_multi_select.html" class="nav-link ">
                  <span class="title">多选择</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="components_bootstrap_select_splitter.html" class="nav-link ">
                  <span class="title">分级选择</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="components_typeahead.html" class="nav-link ">
                  <span class="title">自动完成</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="components_bootstrap_tagsinput.html" class="nav-link ">
                  <span class="title">Bootstrap标签选择</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="components_bootstrap_switch.html" class="nav-link ">
                  <span class="title">Bootstrap切换</span>
                  <span class="badge badge-success">6</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="components_bootstrap_maxlength.html" class="nav-link ">
                  <span class="title">Bootstrap最大长度</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="components_bootstrap_fileinput.html" class="nav-link ">
                  <span class="title">Bootstrap上传文件</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="components_bootstrap_touchspin.html" class="nav-link ">
                  <span class="title">Bootstrap触摸题赠</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="components_form_tools.html" class="nav-link ">
                  <span class="title">表单工具</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="components_context_menu.html" class="nav-link ">
                  <span class="title">环境菜单</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="components_editors.html" class="nav-link ">
                  <span class="title">Markdown编辑器</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="components_code_editors.html" class="nav-link ">
                  <span class="title">Code编辑器</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="components_ion_sliders.html" class="nav-link ">
                  <span class="title">范围选择器1</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="components_noui_sliders.html" class="nav-link ">
                  <span class="title">范围选择器2</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="components_knob_dials.html" class="nav-link ">
                  <span class="title">圆环选择器</span>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item  ">
            <a href="javascript:;" class="nav-link nav-toggle">
              <i class="icon-settings"></i>
              <span class="title">表单</span>
              <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
              <li class="nav-item  ">
                <a href="form_controls.html" class="nav-link ">
                                            <span class="title">Bootstrap表单
                                                <br>Controls</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="form_controls_md.html" class="nav-link ">
                                            <span class="title">机械化设计
                                                <br>表单控制</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="form_validation.html" class="nav-link ">
                  <span class="title">Form验证</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="form_validation_states_md.html" class="nav-link ">
                                            <span class="title">机械化设计
                                                <br>表单验证1</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="form_validation_md.html" class="nav-link ">
                                            <span class="title">机械化设计
                                                <br>表单设计</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="form_layouts.html" class="nav-link ">
                  <span class="title">表单布局</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="form_input_mask.html" class="nav-link ">
                  <span class="title">表单输入Mask</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="form_editable.html" class="nav-link ">
                  <span class="title">表单 X-editable</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="form_wizard.html" class="nav-link ">
                  <span class="title">表单 步骤</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="form_icheck.html" class="nav-link ">
                  <span class="title">iCheck控制</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="form_image_crop.html" class="nav-link ">
                  <span class="title">图像裁剪</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="form_fileupload.html" class="nav-link ">
                  <span class="title">多文件上传</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="form_dropzone.html" class="nav-link ">
                  <span class="title">Dropzone 文件上传</span>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item  ">
            <a href="javascript:;" class="nav-link nav-toggle">
              <i class="icon-bulb"></i>
              <span class="title">元素</span>
              <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
              <li class="nav-item  ">
                <a href="elements_steps.html" class="nav-link ">
                  <span class="title">步骤</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="elements_lists.html" class="nav-link ">
                  <span class="title">列表</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="elements_ribbons.html" class="nav-link ">
                  <span class="title">丝带修饰</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="elements_overlay.html" class="nav-link ">
                  <span class="title">覆盖</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="elements_cards.html" class="nav-link ">
                  <span class="title">用户卡片</span>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item  ">
            <a href="javascript:;" class="nav-link nav-toggle">
              <i class="icon-briefcase"></i>
              <span class="title">表格</span>
              <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
              <li class="nav-item  ">
                <a href="table_static_basic.html" class="nav-link ">
                  <span class="title">基本表格</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="table_static_responsive.html" class="nav-link ">
                  <span class="title">响应式表格</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="table_bootstrap.html" class="nav-link ">
                  <span class="title">Bootstrap表格</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="javascript:;" class="nav-link nav-toggle">
                  <span class="title">数据表格</span>
                  <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                  <li class="nav-item ">
                    <a href="table_datatables_managed.html" class="nav-link "> Managed Datatables </a>
                  </li>
                  <li class="nav-item ">
                    <a href="table_datatables_buttons.html" class="nav-link "> Buttons Extension </a>
                  </li>
                  <li class="nav-item ">
                    <a href="table_datatables_colreorder.html" class="nav-link "> Colreorder Extension </a>
                  </li>
                  <li class="nav-item ">
                    <a href="table_datatables_rowreorder.html" class="nav-link "> Rowreorder Extension </a>
                  </li>
                  <li class="nav-item ">
                    <a href="table_datatables_scroller.html" class="nav-link "> Scroller Extension </a>
                  </li>
                  <li class="nav-item ">
                    <a href="table_datatables_fixedheader.html" class="nav-link "> FixedHeader Extension </a>
                  </li>
                  <li class="nav-item ">
                    <a href="table_datatables_responsive.html" class="nav-link "> Responsive Extension </a>
                  </li>
                  <li class="nav-item ">
                    <a href="table_datatables_editable.html" class="nav-link "> Editable Datatables </a>
                  </li>
                  <li class="nav-item ">
                    <a href="table_datatables_ajax.html" class="nav-link "> Ajax Datatables </a>
                  </li>
                </ul>
              </li>
            </ul>
          </li>
          <li class="nav-item  ">
            <a href="?p=" class="nav-link nav-toggle">
              <i class="icon-wallet"></i>
              <span class="title">门户组件</span>
              <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
              <li class="nav-item  ">
                <a href="portlet_boxed.html" class="nav-link ">
                  <span class="title">盒子 Portlets</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="portlet_light.html" class="nav-link ">
                  <span class="title">高亮 Portlets</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="portlet_solid.html" class="nav-link ">
                  <span class="title">固体 Portlets</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="portlet_ajax.html" class="nav-link ">
                  <span class="title">Ajax Portlets</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="portlet_draggable.html" class="nav-link ">
                  <span class="title">可拖拽 Portlets</span>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item  ">
            <a href="javascript:;" class="nav-link nav-toggle">
              <i class="icon-bar-chart"></i>
              <span class="title">图表</span>
              <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
              <li class="nav-item  ">
                <a href="charts_amcharts.html" class="nav-link ">
                  <span class="title">amChart</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="charts_flotcharts.html" class="nav-link ">
                  <span class="title">Flot Charts</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="charts_flowchart.html" class="nav-link ">
                  <span class="title">Flow Charts</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="charts_google.html" class="nav-link ">
                  <span class="title">Google Charts</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="charts_echarts.html" class="nav-link ">
                  <span class="title">eCharts</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="charts_morris.html" class="nav-link ">
                  <span class="title">Morris Charts</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="javascript:;" class="nav-link nav-toggle">
                  <span class="title">HighCharts</span>
                  <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                  <li class="nav-item ">
                    <a href="charts_highcharts.html" class="nav-link "> HighCharts </a>
                  </li>
                  <li class="nav-item ">
                    <a href="charts_highstock.html" class="nav-link "> HighStock </a>
                  </li>
                  <li class="nav-item ">
                    <a href="charts_highmaps.html" class="nav-link "> HighMaps </a>
                  </li>
                </ul>
              </li>
            </ul>
          </li>
          <li class="nav-item  ">
            <a href="javascript:;" class="nav-link nav-toggle">
              <i class="icon-pointer"></i>
              <span class="title">地图</span>
              <span class="arrow"></span>
            </a>
            <ul class="sub-menu">
              <li class="nav-item  ">
                <a href="maps_google.html" class="nav-link ">
                  <span class="title">Google Maps</span>
                </a>
              </li>
              <li class="nav-item  ">
                <a href="maps_vector.html" class="nav-link ">
                  <span class="title">Vector Maps</span>
                </a>
              </li>
            </ul>
          </li>

          <li class="nav-item">
            <a href="javascript:;" class="nav-link nav-toggle">
              <i class="icon-folder"></i>
              <span class="title">多级菜单</span>
              <span class="arrow "></span>
            </a>
            <ul class="sub-menu">
              <li class="nav-item">
                <a href="javascript:;" class="nav-link nav-toggle">
                  <i class="icon-settings"></i> 项目 1
                  <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                  <li class="nav-item">
                    <a href="javascript:;" target="_blank" class="nav-link">
                      <i class="icon-user"></i> 菜单切换
                      <span class="arrow nav-toggle"></span>
                    </a>
                    <ul class="sub-menu">
                      <li class="nav-item">
                        <a href="#" class="nav-link">
                          <i class="icon-power"></i> 连接1</a>
                      </li>
                      <li class="nav-item">
                        <a href="#" class="nav-link">
                          <i class="icon-paper-plane"></i>连接2</a>
                      </li>
                      <li class="nav-item">
                        <a href="#" class="nav-link">
                          <i class="icon-star"></i> 连接3</a>
                      </li>
                    </ul>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="icon-camera"></i>连接1</a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="icon-link"></i>连接2</a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="icon-pointer"></i>连接3</a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="javascript:;" target="_blank" class="nav-link">
                  <i class="icon-globe"></i> 菜单切换
                  <span class="arrow nav-toggle"></span>
                </a>
                <ul class="sub-menu">
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="icon-tag"></i>链接1</a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="icon-pencil"></i>链接2</a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="icon-graph"></i> 链接3</a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="icon-bar-chart"></i>项目3 </a>
              </li>
            </ul>
          </li>
        </ul>
        <!-- 结束侧边栏 -->
      </div>
      <!-- END SIDEBAR -->
    </div>
    <!-- END SIDEBAR -->




























    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
      <!-- BEGIN CONTENT BODY -->
      <div class="page-content">

      </div>
      <!-- END CONTENT BODY -->
    </div>


    <!-- END CONTENT -->

    <!-- BEGIN QUICK SIDEBAR -->
    <a href="javascript:;" class="page-quick-sidebar-toggler">
      <i class="icon-login"></i>
    </a>
    <div class="page-quick-sidebar-wrapper" data-close-on-body-click="false">
      <div class="page-quick-sidebar">
        <ul class="nav nav-tabs">
          <li class="active">
            <a href="javascript:;" data-target="#quick_sidebar_tab_1" data-toggle="tab"> Users
              <span class="badge badge-danger">2</span>
            </a>
          </li>
          <li>
            <a href="javascript:;" data-target="#quick_sidebar_tab_2" data-toggle="tab"> Alerts
              <span class="badge badge-success">7</span>
            </a>
          </li>
          <li class="dropdown">
            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"> More
              <i class="fa fa-angle-down"></i>
            </a>
            <ul class="dropdown-menu pull-right">
              <li>
                <a href="javascript:;" data-target="#quick_sidebar_tab_3" data-toggle="tab">
                  <i class="icon-bell"></i> Alerts </a>
              </li>
              <li>
                <a href="javascript:;" data-target="#quick_sidebar_tab_3" data-toggle="tab">
                  <i class="icon-info"></i> Notifications </a>
              </li>
              <li>
                <a href="javascript:;" data-target="#quick_sidebar_tab_3" data-toggle="tab">
                  <i class="icon-speech"></i> Activities </a>
              </li>
              <li class="divider"></li>
              <li>
                <a href="javascript:;" data-target="#quick_sidebar_tab_3" data-toggle="tab">
                  <i class="icon-settings"></i> Settings </a>
              </li>
            </ul>
          </li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active page-quick-sidebar-chat" id="quick_sidebar_tab_1">
            <div class="page-quick-sidebar-chat-users" data-rail-color="#ddd" data-wrapper-class="page-quick-sidebar-list">
              <h3 class="list-heading">Staff</h3>
              <ul class="media-list list-items">
                <li class="media">
                  <div class="media-status">
                    <span class="badge badge-success">8</span>
                  </div>
                  <img class="media-object" src="${staticPath}/layouts/layout/img/avatar3.jpg" alt="...">
                  <div class="media-body">
                    <h4 class="media-heading">Bob Nilson</h4>
                    <div class="media-heading-sub"> Project Manager </div>
                  </div>
                </li>
                <li class="media">
                  <img class="media-object" src="${staticPath}/layouts/layout/img/avatar1.jpg" alt="...">
                  <div class="media-body">
                    <h4 class="media-heading">Nick Larson</h4>
                    <div class="media-heading-sub"> Art Director </div>
                  </div>
                </li>
                <li class="media">
                  <div class="media-status">
                    <span class="badge badge-danger">3</span>
                  </div>
                  <img class="media-object" src="${staticPath}/layouts/layout/img/avatar4.jpg" alt="...">
                  <div class="media-body">
                    <h4 class="media-heading">Deon Hubert</h4>
                    <div class="media-heading-sub"> CTO </div>
                  </div>
                </li>
                <li class="media">
                  <img class="media-object" src="${staticPath}/layouts/layout/img/avatar2.jpg" alt="...">
                  <div class="media-body">
                    <h4 class="media-heading">Ella Wong</h4>
                    <div class="media-heading-sub"> CEO </div>
                  </div>
                </li>
              </ul>
              <h3 class="list-heading">Customers</h3>
              <ul class="media-list list-items">
                <li class="media">
                  <div class="media-status">
                    <span class="badge badge-warning">2</span>
                  </div>
                  <img class="media-object" src="${staticPath}/layouts/layout/img/avatar6.jpg" alt="...">
                  <div class="media-body">
                    <h4 class="media-heading">Lara Kunis</h4>
                    <div class="media-heading-sub"> CEO, Loop Inc </div>
                    <div class="media-heading-small"> Last seen 03:10 AM </div>
                  </div>
                </li>
                <li class="media">
                  <div class="media-status">
                    <span class="label label-sm label-success">new</span>
                  </div>
                  <img class="media-object" src="${staticPath}/layouts/layout/img/avatar7.jpg" alt="...">
                  <div class="media-body">
                    <h4 class="media-heading">Ernie Kyllonen</h4>
                    <div class="media-heading-sub"> Project Manager,
                      <br> SmartBizz PTL </div>
                  </div>
                </li>
                <li class="media">
                  <img class="media-object" src="${staticPath}/layouts/layout/img/avatar8.jpg" alt="...">
                  <div class="media-body">
                    <h4 class="media-heading">Lisa Stone</h4>
                    <div class="media-heading-sub"> CTO, Keort Inc </div>
                    <div class="media-heading-small"> Last seen 13:10 PM </div>
                  </div>
                </li>
                <li class="media">
                  <div class="media-status">
                    <span class="badge badge-success">7</span>
                  </div>
                  <img class="media-object" src="${staticPath}/layouts/layout/img/avatar9.jpg" alt="...">
                  <div class="media-body">
                    <h4 class="media-heading">Deon Portalatin</h4>
                    <div class="media-heading-sub"> CFO, H&D LTD </div>
                  </div>
                </li>
                <li class="media">
                  <img class="media-object" src="${staticPath}/layouts/layout/img/avatar10.jpg" alt="...">
                  <div class="media-body">
                    <h4 class="media-heading">Irina Savikova</h4>
                    <div class="media-heading-sub"> CEO, Tizda Motors Inc </div>
                  </div>
                </li>
                <li class="media">
                  <div class="media-status">
                    <span class="badge badge-danger">4</span>
                  </div>
                  <img class="media-object" src="${staticPath}/layouts/layout/img/avatar11.jpg" alt="...">
                  <div class="media-body">
                    <h4 class="media-heading">Maria Gomez</h4>
                    <div class="media-heading-sub"> Manager, Infomatic Inc </div>
                    <div class="media-heading-small"> Last seen 03:10 AM </div>
                  </div>
                </li>
              </ul>
            </div>
            <div class="page-quick-sidebar-item">
              <div class="page-quick-sidebar-chat-user">
                <div class="page-quick-sidebar-nav">
                  <a href="javascript:;" class="page-quick-sidebar-back-to-list">
                    <i class="icon-arrow-left"></i>Back</a>
                </div>
                <div class="page-quick-sidebar-chat-user-messages">
                  <div class="post out">
                    <img class="avatar" alt="" src="${staticPath}/layouts/layout/img/avatar3.jpg" />
                    <div class="message">
                      <span class="arrow"></span>
                      <a href="javascript:;" class="name">Bob Nilson</a>
                      <span class="datetime">20:15</span>
                      <span class="body"> When could you send me the report ? </span>
                    </div>
                  </div>
                  <div class="post in">
                    <img class="avatar" alt="" src="${staticPath}/layouts/layout/img/avatar2.jpg" />
                    <div class="message">
                      <span class="arrow"></span>
                      <a href="javascript:;" class="name">Ella Wong</a>
                      <span class="datetime">20:15</span>
                      <span class="body"> Its almost done. I will be sending it shortly </span>
                    </div>
                  </div>
                  <div class="post out">
                    <img class="avatar" alt="" src="${staticPath}/layouts/layout/img/avatar3.jpg" />
                    <div class="message">
                      <span class="arrow"></span>
                      <a href="javascript:;" class="name">Bob Nilson</a>
                      <span class="datetime">20:15</span>
                      <span class="body"> Alright. Thanks! :) </span>
                    </div>
                  </div>
                  <div class="post in">
                    <img class="avatar" alt="" src="${staticPath}/layouts/layout/img/avatar2.jpg" />
                    <div class="message">
                      <span class="arrow"></span>
                      <a href="javascript:;" class="name">Ella Wong</a>
                      <span class="datetime">20:16</span>
                      <span class="body"> You are most welcome. Sorry for the delay. </span>
                    </div>
                  </div>
                  <div class="post out">
                    <img class="avatar" alt="" src="${staticPath}/layouts/layout/img/avatar3.jpg" />
                    <div class="message">
                      <span class="arrow"></span>
                      <a href="javascript:;" class="name">Bob Nilson</a>
                      <span class="datetime">20:17</span>
                      <span class="body"> No probs. Just take your time :) </span>
                    </div>
                  </div>
                  <div class="post in">
                    <img class="avatar" alt="" src="${staticPath}/layouts/layout/img/avatar2.jpg" />
                    <div class="message">
                      <span class="arrow"></span>
                      <a href="javascript:;" class="name">Ella Wong</a>
                      <span class="datetime">20:40</span>
                      <span class="body"> Alright. I just emailed it to you. </span>
                    </div>
                  </div>
                  <div class="post out">
                    <img class="avatar" alt="" src="${staticPath}/layouts/layout/img/avatar3.jpg" />
                    <div class="message">
                      <span class="arrow"></span>
                      <a href="javascript:;" class="name">Bob Nilson</a>
                      <span class="datetime">20:17</span>
                      <span class="body"> Great! Thanks. Will check it right away. </span>
                    </div>
                  </div>
                  <div class="post in">
                    <img class="avatar" alt="" src="${staticPath}/layouts/layout/img/avatar2.jpg" />
                    <div class="message">
                      <span class="arrow"></span>
                      <a href="javascript:;" class="name">Ella Wong</a>
                      <span class="datetime">20:40</span>
                      <span class="body"> Please let me know if you have any comment. </span>
                    </div>
                  </div>
                  <div class="post out">
                    <img class="avatar" alt="" src="${staticPath}/layouts/layout/img/avatar3.jpg" />
                    <div class="message">
                      <span class="arrow"></span>
                      <a href="javascript:;" class="name">Bob Nilson</a>
                      <span class="datetime">20:17</span>
                      <span class="body"> Sure. I will check and buzz you if anything needs to be corrected. </span>
                    </div>
                  </div>
                </div>
                <div class="page-quick-sidebar-chat-user-form">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Type a message here...">
                    <div class="input-group-btn">
                      <button type="button" class="btn green">
                        <i class="icon-paper-clip"></i>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="tab-pane page-quick-sidebar-alerts" id="quick_sidebar_tab_2">
            <div class="page-quick-sidebar-alerts-list">
              <h3 class="list-heading">General</h3>
              <ul class="feeds list-items">
                <li>
                  <div class="col1">
                    <div class="cont">
                      <div class="cont-col1">
                        <div class="label label-sm label-info">
                          <i class="fa fa-check"></i>
                        </div>
                      </div>
                      <div class="cont-col2">
                        <div class="desc"> You have 4 pending tasks.
                                                            <span class="label label-sm label-warning "> Take action
                                                                <i class="fa fa-share"></i>
                                                            </span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col2">
                    <div class="date"> Just now </div>
                  </div>
                </li>
                <li>
                  <a href="javascript:;">
                    <div class="col1">
                      <div class="cont">
                        <div class="cont-col1">
                          <div class="label label-sm label-success">
                            <i class="fa fa-bar-chart-o"></i>
                          </div>
                        </div>
                        <div class="cont-col2">
                          <div class="desc"> Finance Report for year 2013 has been released. </div>
                        </div>
                      </div>
                    </div>
                    <div class="col2">
                      <div class="date"> 20 mins </div>
                    </div>
                  </a>
                </li>
                <li>
                  <div class="col1">
                    <div class="cont">
                      <div class="cont-col1">
                        <div class="label label-sm label-danger">
                          <i class="fa fa-user"></i>
                        </div>
                      </div>
                      <div class="cont-col2">
                        <div class="desc"> You have 5 pending membership that requires a quick review. </div>
                      </div>
                    </div>
                  </div>
                  <div class="col2">
                    <div class="date"> 24 mins </div>
                  </div>
                </li>
                <li>
                  <div class="col1">
                    <div class="cont">
                      <div class="cont-col1">
                        <div class="label label-sm label-info">
                          <i class="fa fa-shopping-cart"></i>
                        </div>
                      </div>
                      <div class="cont-col2">
                        <div class="desc"> New order received with
                          <span class="label label-sm label-success"> Reference Number: DR23923 </span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col2">
                    <div class="date"> 30 mins </div>
                  </div>
                </li>
                <li>
                  <div class="col1">
                    <div class="cont">
                      <div class="cont-col1">
                        <div class="label label-sm label-success">
                          <i class="fa fa-user"></i>
                        </div>
                      </div>
                      <div class="cont-col2">
                        <div class="desc"> You have 5 pending membership that requires a quick review. </div>
                      </div>
                    </div>
                  </div>
                  <div class="col2">
                    <div class="date"> 24 mins </div>
                  </div>
                </li>
                <li>
                  <div class="col1">
                    <div class="cont">
                      <div class="cont-col1">
                        <div class="label label-sm label-info">
                          <i class="fa fa-bell-o"></i>
                        </div>
                      </div>
                      <div class="cont-col2">
                        <div class="desc"> Web server hardware needs to be upgraded.
                          <span class="label label-sm label-warning"> Overdue </span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col2">
                    <div class="date"> 2 hours </div>
                  </div>
                </li>
                <li>
                  <a href="javascript:;">
                    <div class="col1">
                      <div class="cont">
                        <div class="cont-col1">
                          <div class="label label-sm label-default">
                            <i class="fa fa-briefcase"></i>
                          </div>
                        </div>
                        <div class="cont-col2">
                          <div class="desc"> IPO Report for year 2013 has been released. </div>
                        </div>
                      </div>
                    </div>
                    <div class="col2">
                      <div class="date"> 20 mins </div>
                    </div>
                  </a>
                </li>
              </ul>
              <h3 class="list-heading">System</h3>
              <ul class="feeds list-items">
                <li>
                  <div class="col1">
                    <div class="cont">
                      <div class="cont-col1">
                        <div class="label label-sm label-info">
                          <i class="fa fa-check"></i>
                        </div>
                      </div>
                      <div class="cont-col2">
                        <div class="desc"> You have 4 pending tasks.
                                                            <span class="label label-sm label-warning "> Take action
                                                                <i class="fa fa-share"></i>
                                                            </span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col2">
                    <div class="date"> Just now </div>
                  </div>
                </li>
                <li>
                  <a href="javascript:;">
                    <div class="col1">
                      <div class="cont">
                        <div class="cont-col1">
                          <div class="label label-sm label-danger">
                            <i class="fa fa-bar-chart-o"></i>
                          </div>
                        </div>
                        <div class="cont-col2">
                          <div class="desc"> Finance Report for year 2013 has been released. </div>
                        </div>
                      </div>
                    </div>
                    <div class="col2">
                      <div class="date"> 20 mins </div>
                    </div>
                  </a>
                </li>
                <li>
                  <div class="col1">
                    <div class="cont">
                      <div class="cont-col1">
                        <div class="label label-sm label-default">
                          <i class="fa fa-user"></i>
                        </div>
                      </div>
                      <div class="cont-col2">
                        <div class="desc"> You have 5 pending membership that requires a quick review. </div>
                      </div>
                    </div>
                  </div>
                  <div class="col2">
                    <div class="date"> 24 mins </div>
                  </div>
                </li>
                <li>
                  <div class="col1">
                    <div class="cont">
                      <div class="cont-col1">
                        <div class="label label-sm label-info">
                          <i class="fa fa-shopping-cart"></i>
                        </div>
                      </div>
                      <div class="cont-col2">
                        <div class="desc"> New order received with
                          <span class="label label-sm label-success"> Reference Number: DR23923 </span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col2">
                    <div class="date"> 30 mins </div>
                  </div>
                </li>
                <li>
                  <div class="col1">
                    <div class="cont">
                      <div class="cont-col1">
                        <div class="label label-sm label-success">
                          <i class="fa fa-user"></i>
                        </div>
                      </div>
                      <div class="cont-col2">
                        <div class="desc"> You have 5 pending membership that requires a quick review. </div>
                      </div>
                    </div>
                  </div>
                  <div class="col2">
                    <div class="date"> 24 mins </div>
                  </div>
                </li>
                <li>
                  <div class="col1">
                    <div class="cont">
                      <div class="cont-col1">
                        <div class="label label-sm label-warning">
                          <i class="fa fa-bell-o"></i>
                        </div>
                      </div>
                      <div class="cont-col2">
                        <div class="desc"> Web server hardware needs to be upgraded.
                          <span class="label label-sm label-default "> Overdue </span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col2">
                    <div class="date"> 2 hours </div>
                  </div>
                </li>
                <li>
                  <a href="javascript:;">
                    <div class="col1">
                      <div class="cont">
                        <div class="cont-col1">
                          <div class="label label-sm label-info">
                            <i class="fa fa-briefcase"></i>
                          </div>
                        </div>
                        <div class="cont-col2">
                          <div class="desc"> IPO Report for year 2013 has been released. </div>
                        </div>
                      </div>
                    </div>
                    <div class="col2">
                      <div class="date"> 20 mins </div>
                    </div>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div class="tab-pane page-quick-sidebar-settings" id="quick_sidebar_tab_3">
            <div class="page-quick-sidebar-settings-list">
              <h3 class="list-heading">General Settings</h3>
              <ul class="list-items borderless">
                <li> Enable Notifications
                  <input type="checkbox" class="make-switch" checked data-size="small" data-on-color="success" data-on-text="ON" data-off-color="default" data-off-text="OFF"> </li>
                <li> Allow Tracking
                  <input type="checkbox" class="make-switch" data-size="small" data-on-color="info" data-on-text="ON" data-off-color="default" data-off-text="OFF"> </li>
                <li> Log Errors
                  <input type="checkbox" class="make-switch" checked data-size="small" data-on-color="danger" data-on-text="ON" data-off-color="default" data-off-text="OFF"> </li>
                <li> Auto Sumbit Issues
                  <input type="checkbox" class="make-switch" data-size="small" data-on-color="warning" data-on-text="ON" data-off-color="default" data-off-text="OFF"> </li>
                <li> Enable SMS Alerts
                  <input type="checkbox" class="make-switch" checked data-size="small" data-on-color="success" data-on-text="ON" data-off-color="default" data-off-text="OFF"> </li>
              </ul>
              <h3 class="list-heading">System Settings</h3>
              <ul class="list-items borderless">
                <li> Security Level
                  <select class="form-control input-inline input-sm input-small">
                    <option value="1">Normal</option>
                    <option value="2" selected>Medium</option>
                    <option value="e">High</option>
                  </select>
                </li>
                <li> Failed Email Attempts
                  <input class="form-control input-inline input-sm input-small" value="5" /> </li>
                <li> Secondary SMTP Port
                  <input class="form-control input-inline input-sm input-small" value="3560" /> </li>
                <li> Notify On System Error
                  <input type="checkbox" class="make-switch" checked data-size="small" data-on-color="danger" data-on-text="ON" data-off-color="default" data-off-text="OFF"> </li>
                <li> Notify On SMTP Error
                  <input type="checkbox" class="make-switch" checked data-size="small" data-on-color="warning" data-on-text="ON" data-off-color="default" data-off-text="OFF"> </li>
              </ul>
              <div class="inner-content">
                <button class="btn btn-success">
                  <i class="icon-settings"></i> Save Changes</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- END QUICK SIDEBAR -->
  </div>
  <!-- END CONTAINER -->

  <!-- footer -->
  <div class="page-footer">
    <div class="page-footer-inner"> 2016 &copy; jeebase By
      <a target="_blank" href="http://keenthemes.com">doubleview</a> &nbsp;|&nbsp;
      <a href="http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes" title="Purchase Metronic just for 27$ and get lifetime updates for free" target="_blank">Purchase Metronic!</a>
    </div>
    <div class="scroll-to-top">
      <i class="icon-arrow-up"></i>
    </div>
  </div>
    <!--end footer-->

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
</body>