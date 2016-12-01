<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>日志管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@ include file="/WEB-INF/view/global/head-lib.jsp" %>
    <link href="${staticPath}/global/plugins/sweet-alert/css/sweet-alert.css" rel="stylesheet" type="text/css"/>
    <link href="${staticPath}/global/plugins/jstree/dist/themes/default/style.min.css" rel="stylesheet"  type="text/css"/>
    <link href="${staticPath}/global/plugins/bootstrap-datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
    <script src="${staticPath}/global/plugins/sweet-alert/js/sweet-alert.min.js" type="text/javascript"></script>
    <script src="${staticPath}/global/plugins/bootstrap-datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
</head>
<body>
<div class="page-inner-container" style="padding: 0px 15px;">
    <div class="row">
        <div class="portlet light">

                    <form class="form-horizontal row" role="form">

                        <div class="form-group col-md-3">
                            <label class="col-md-5 control-label">开始时间</label>
                            <div class="input-group col-md-7 date date-picker"  data-date-format="yyyy-mm-dd">
                                <input type="text" class="form-control" readonly>
                                <span class="input-group-btn">
                                    <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                </span>
                            </div>
                        </div>

                        <div class="form-group col-md-3">
                            <label class="col-md-5 control-label">结束时间</label>
                            <div class="input-group col-md-7 date date-picker"  data-date-format="yyyy-mm-dd" >
                                <input type="text" class="form-control" readonly>
                                <span class="input-group-btn">
                                    <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                </span>
                            </div>
                        </div>

                        <div class="form-actions col-md-4">
                            <div class="row">
                                <div class="col-md-offset-3 col-md-9">
                                    <button type="submit" class="btn green">查询</button>
                                    <button type="button" class="btn default">重置</button>
                                </div>
                            </div>
                        </div>

                    </form>

            <div class="portlet-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th> #</th>
                            <th> Table heading</th>
                            <th> Table heading</th>
                            <th> Table heading</th>
                            <th> Table heading</th>
                            <th> Table heading</th>
                            <th> Table heading</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td> 1</td>
                            <td> Table cell</td>
                            <td> Table cell</td>
                            <td> Table cell</td>
                            <td> Table cell</td>
                            <td> Table cell</td>
                            <td> Table cell</td>
                        </tr>
                        <tr>
                            <td> 2</td>
                            <td> Table cell</td>
                            <td> Table cell</td>
                            <td> Table cell</td>
                            <td> Table cell</td>
                            <td> Table cell</td>
                            <td> Table cell</td>
                        </tr>
                        <tr>
                            <td> 3</td>
                            <td> Table cell</td>
                            <td> Table cell</td>
                            <td> Table cell</td>
                            <td> Table cell</td>
                            <td> Table cell</td>
                            <td> Table cell</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <nav class="col-md-12">
                    <ul class="pagination"><li class="page-first disabled"><a href="javascript:void(0)">«</a></li><li class="page-pre disabled"><a href="javascript:void(0)">‹</a></li><li class="page-number active"><a href="javascript:void(0)">1</a></li><li class="page-number"><a href="javascript:void(0)">2</a></li><li class="page-number"><a href="javascript:void(0)">3</a></li><li class="page-number"><a href="javascript:void(0)">4</a></li><li class="page-number"><a href="javascript:void(0)">5</a></li><li class="page-next"><a href="javascript:void(0)">›</a></li><li class="page-last"><a href="javascript:void(0)">»</a></li>
                        <li class="pagination-info"><a>当前1到30条 ， 共500条</a></li>
                    </ul>
                </nav>
            </div>
        </div>

    </div>
</div>
<script>
    var Log = function(){
        var handleDatePickers = function () {
            if (jQuery().datepicker) {
                $('.date-picker').datepicker({
                    /*rtl: App.isRTL(),*/
                    /*orientation: "left",*/
                    autoclose: true,
                    clearBtn:true
                });
            }
        }

        return {
            init : function(){
                handleDatePickers();
            }
        }

    }();

    $(document).ready(function () {
        Log.init();
    });
</script>
</body>
</html>