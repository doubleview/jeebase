<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>用户管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@ include file="/WEB-INF/view/global/head-lib.jsp" %>
    <link href="${staticPath}/global/plugins/sweet-alert/css/sweet-alert.css" rel="stylesheet" type="text/css"/>
    <link href="${staticPath}/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="${staticPath}/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${staticPath}/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />

    <script src="${staticPath}/global/plugins/sweet-alert/js/sweet-alert.min.js" type="text/javascript"></script>
    <script src="${staticPath}/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
    <script src="${staticPath}/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
</head>
<body>
<div class="page-inner-container" style="padding: 0px 15px;">
    <div class="row">
        <div class="portlet light">

            <form:form id="searchForm" modelAttribute="user"  class="form-horizontal row"  action="${adminPath}/system/user" user="form">
                <input type="hidden" name="pageNo" value="1">
                <div class="form-group col-md-3">
                    <label class="col-md-5 control-label">登录名</label>
                    <div class="input-group col-md-7">
                        <form:input path="loginName" cssClass="form-control"/>
                    </div>
                </div>

                <div class="form-group col-md-3">
                    <label class="col-md-5 control-label">名称</label>
                    <div class="input-group col-md-7">
                        <form:input path="name" cssClass="form-control"/>
                    </div>
                </div>

                <div class="form-group col-md-3">
                    <label class="col-md-5 control-label">所属部门</label>
                    <div class="input-group col-md-7"  >
                        <form:input path="department.name" cssClass="form-control"/>
                    </div>
                </div>

                <div class="form-actions col-md-3 pull-right">
                    <div class="row">
                            <button type="submit" class="btn green">查询</button>
                            <button type="button" class="btn default" id="reset">重置</button>
                            <a href="${adminPath}/system/user/edit" class="btn blue" id="menu-add"><i class="fa fa-plus"></i> 添加用户 </a>
                    </div>
                </div>
            </form:form>
            <div class="portlet-body">
                <c:if test="${not empty message}">
                    <div class="alert alert-success alert-dismissible" user="alert">
                        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span></button>
                            ${message}
                    </div>
                </c:if>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th> 登录名</th>
                                <th> 名称</th>
                                <th> 所属部门</th>
                                <th> 邮箱</th>
                                <th> 手机</th>
                                <th> 最后登录日期</th>
                                <th> 操作</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.list}" var="user">
                            <tr>
                                <td>${user.loginName}</td>
                                <td>${user.name}</td>
                                <td>${user.department.name}</td>
                                <td>${user.email}</td>
                                <td>${user.mobile}</td>
                                <td><fmt:formatDate value="${user.loginDate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                <td>
                                    <a href="${adminPath}/system/user/edit?id=${user.id}" class="btn btn-circle btn-xs blue edit">
                                        <i class="fa fa-edit"></i> 编辑 </a>
                                    <a href="javascript:;" class="btn btn-circle btn-xs red del"  data-id="${user.id}">
                                        <i class="fa fa-times"></i> 删除 </a>
                                </td>
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
    var User = function(){

        var bindPageNo = function () {
            $(".pagination a[data-pageNo]").click(function () {
                var pageNo =$(this).attr("data-pageNo");
                $("input[name='pageNo']").val(pageNo);
                    //提交表单
                $("#searchForm").submit();
            });
        }

        var bindSelect = function(){
            $.fn.select2.defaults.set("theme", "bootstrap");
            $(".select2, .select2-multiple").select2({
                width: null
            });
        }

        var bindOperation = function(){
            $("#reset").click(function(){
                $("#searchForm .input-group input").val("");
                $("#searchForm .input-group select").val("");
            });
            $(".del").click(function(){
                var id = $(this).attr("data-id");
                window.swal({
                            title: "确认删除么?",
                            type: "warning",
                            showCancelButton: true,
                            confirmButtonColor: '#DD6B55',
                            confirmButtonText: '确认',
                            cancelButtonText: "取消",
                            closeOnConfirm: false,
                        },
                        function(){
                            $.post("${adminPath}/system/user/del",{id : id} , function(result){
                                if(result.code == "0"){
                                    window.swal("删除成功!","","success");
                                    $("#searchForm").submit();
                                }else {
                                    window.swal("删除失败!",result.message,"error");
                                }
                            });
                        });
            });
        }

        return {
            init : function(){
                bindPageNo();
                bindSelect();
                bindOperation();
            }
        }
    }();

    $(document).ready(function () {
        User.init();
    });
</script>
</body>
</html>