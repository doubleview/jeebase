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

                    <form:form id="searchForm" modelAttribute="log"  class="form-horizontal row"  action="${adminPath}/system/log" role="form">
                        <input type="hidden" name="pageNo" value="1">
                        <div class="form-group col-md-3">
                            <label class="col-md-5 control-label">开始时间</label>
                            <div class="input-group col-md-7 date date-picker"  data-date-format="yyyy-mm-dd">
                                <form:input path="beginDate" cssClass="form-control" readonly="true"/>
                                <span class="input-group-btn">
                                    <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                </span>
                            </div>
                        </div>

                        <div class="form-group col-md-3">
                            <label class="col-md-5 control-label">结束时间</label>
                            <div class="input-group col-md-7 date date-picker"  data-date-format="yyyy-mm-dd" >
                                <form:input path="endDate" cssClass="form-control" readonly="true"/>
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

                    </form:form>

            <div class="portlet-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th> 日志类型</th>
                            <th> 操作ip</th>
                            <th> uri</th>
                            <th>操作方式</th>
                            <th> 异常信息</th>
                            <th> 操作者</th>
                            <th> 操作时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.list}" var="log">
                            <tr>
                                <td>
                                    <c:choose>
                                        <c:when test="${log.type eq 1 }">
                                            接入
                                        </c:when>
                                        <c:otherwise>
                                            异常
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${log.remoteIp}</td>
                                <td>${log.requestUri}</td>
                                <td>${log.method}</td>
                                <td>${log.exception}</td>
                                <td>${log.createBy.name}</td>
                                <td><fmt:formatDate value="${log.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <nav class="col-md-12">${page}</nav>
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

        var bindPageNo = function () {
            $(".pagination a[data-pageNo]").click(function () {
                var pageNo =$(this).attr("data-pageNo");
                $("input[name='pageNo']").val(pageNo);
                //提交表单
                $("#searchForm").submit();
            });
        }

        return {
            init : function(){
                handleDatePickers();
                bindPageNo();
            }
        }
    }();

    $(document).ready(function () {
        Log.init();
    });
</script>
</body>
</html>