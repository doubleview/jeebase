<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>菜单管理</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1" name="viewport" />
  <meta content="" name="description" />
  <meta content="" name="author" />
  <!-- BEGIN GLOBAL MANDATORY STYLES -->
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
  <link href="../assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <link href="../assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
  <link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
  <!-- END GLOBAL MANDATORY STYLES -->
  <!-- BEGIN PAGE LEVEL PLUGINS -->
  <link href="../assets/global/plugins/jstree/dist/themes/default/style.min.css" rel="stylesheet" type="text/css" />
  <!-- END PAGE LEVEL PLUGINS -->
  <!-- BEGIN THEME GLOBAL STYLES -->
  <link href="../assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
  <link href="../assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
  <!-- END THEME GLOBAL STYLES -->
  <!-- BEGIN THEME LAYOUT STYLES -->
  <link href="../assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
  <link href="../assets/layouts/layout/css/themes/darkblue.min.css" rel="stylesheet" type="text/css" id="style_color" />
  <link href="../assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />
  <!-- END THEME LAYOUT STYLES -->
  <link rel="shortcut icon" href="favicon.ico" /> </head>
<!-- END HEAD -->

<body>
        <div class="row">
          <div class="col-md-6">
            <div class="portlet light bordered">
              <div class="portlet-title">
                <div class="caption">
                  <i class="icon-social-dribbble font-blue-sharp"></i>
                  <span class="caption-subject font-blue-sharp bold uppercase">Default Tree</span>
                </div>
                <div class="actions">
                  <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                    <i class="icon-cloud-upload"></i>
                  </a>
                  <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                    <i class="icon-wrench"></i>
                  </a>
                  <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                    <i class="icon-trash"></i>
                  </a>
                </div>
              </div>
              <div class="portlet-body">
                <div id="tree_1" class="tree-demo">
                  <ul>
                    <li> Root node 1
                      <ul>
                        <li data-jstree='{ "selected" : true }'>
                          <a href="javascript:;"> Initially selected </a>
                        </li>
                        <li data-jstree='{ "icon" : "fa fa-briefcase icon-state-success " }'> custom icon URL </li>
                        <li data-jstree='{ "opened" : true }'> initially open
                          <ul>
                            <li data-jstree='{ "disabled" : true }'> Disabled Node </li>
                            <li data-jstree='{ "type" : "file" }'> Another node </li>
                          </ul>
                        </li>
                        <li data-jstree='{ "icon" : "fa fa-warning icon-state-danger" }'> Custom icon class (bootstrap) </li>
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
          <div class="col-md-6">
            <div class="portlet light bordered">
              <div class="portlet-title">
                <div class="caption">
                  <i class="icon-bubble font-green-sharp"></i>
                  <span class="caption-subject font-green-sharp bold uppercase">Checkable Tree</span>
                </div>
                <div class="actions">
                  <div class="btn-group">
                    <a class="btn green-haze btn-outline btn-circle btn-sm" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> Actions
                      <i class="fa fa-angle-down"></i>
                    </a>
                    <ul class="dropdown-menu pull-right">
                      <li>
                        <a href="javascript:;"> Option 1</a>
                      </li>
                      <li class="divider"> </li>
                      <li>
                        <a href="javascript:;">Option 2</a>
                      </li>
                      <li>
                        <a href="javascript:;">Option 3</a>
                      </li>
                      <li>
                        <a href="javascript:;">Option 4</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="portlet-body">
                <div id="tree_2" class="tree-demo"> </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="portlet yellow-lemon box">
              <div class="portlet-title">
                <div class="caption">
                  <i class="fa fa-cogs"></i>Contextual Menu with Drag & Drop </div>
                <div class="tools">
                  <a href="javascript:;" class="collapse"> </a>
                  <a href="#portlet-config" data-toggle="modal" class="config"> </a>
                  <a href="javascript:;" class="reload"> </a>
                  <a href="javascript:;" class="remove"> </a>
                </div>
              </div>
              <div class="portlet-body">
                <div id="tree_3" class="tree-demo"> </div>
                <div class="alert alert-success no-margin margin-top-10"> Note! Opened and selected nodes will be saved in the user's browser, so when returning to the same tree the previous state will be restored. </div>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="portlet red-pink box">
              <div class="portlet-title">
                <div class="caption">
                  <i class="fa fa-cogs"></i>Ajax Tree with Drag & Drop </div>
                <div class="tools">
                  <a href="javascript:;" class="collapse"> </a>
                  <a href="#portlet-config" data-toggle="modal" class="config"> </a>
                  <a href="javascript:;" class="reload"> </a>
                  <a href="javascript:;" class="remove"> </a>
                </div>
              </div>
              <div class="portlet-body">
                <div id="tree_4" class="tree-demo"> </div>
                <div class="alert alert-info no-margin margin-top-10"> Note! The tree nodes are loaded from ../demo/jstree_ajax_data.php via ajax. </div>
              </div>
            </div>
          </div>
        </div>


<!--[if lt IE 9]>
<script src="../assets/global/plugins/respond.min.js"></script>
<script src="../assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<!-- BEGIN CORE PLUGINS -->
<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="../assets/global/plugins/jstree/dist/jstree.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="../assets/pages/scripts/ui-tree.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<script src="../assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
<script src="../assets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
<script src="../assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
<!-- END THEME LAYOUT SCRIPTS -->
</body>