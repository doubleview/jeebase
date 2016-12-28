<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>角色管理</title>
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
            <form:form id="searchForm" modelAttribute="role"  class="form-horizontal row"  action="${adminPath}/system/role" role="form">
                <input type="hidden" name="pageNo" value="1">
                <div class="form-group col-md-3">
                    <label class="col-md-5 control-label">类型</label>
                    <div class="input-group col-md-7">
                        <form:select  path="roleType" cssClass="select2 form-control">
                            <form:option value="" label="请选择"/>
                            <form:options  items="${sys:getDictList('ROLE_TYPE')}" itemLabel="label" itemValue="value"/>
                        </form:select>
                    </div>
                </div>

                <div class="form-group col-md-3">
                    <label class="col-md-5 control-label">是否可用</label>
                    <div class="input-group col-md-7">
                        <form:select  path="useable" cssClass="select2 form-control">
                            <form:option value="" label="请选择"/>
                            <form:options  items="${sys:getDictList('USEABLE')}" itemLabel="label" itemValue="value"/>
                        </form:select>
                    </div>
                </div>

                <div class="form-group col-md-3">
                    <label class="col-md-5 control-label">名称</label>
                    <div class="input-group col-md-7"  >
                        <form:input path="name" cssClass="form-control"/>
                    </div>
                </div>

                <div class="form-actions col-md-3 pull-right">
                    <div class="row">
                            <button type="submit" class="btn green">
                                <i class="fa fa-search"></i>查询
                            </button>
                            <a href="${adminPath}/system/role/edit" class="btn blue" id="menu-add">
                                <i class="fa fa-plus"></i> 添加
                            </a>
                    </div>
                </div>
            </form:form>
            <div class="portlet-body">
                <c:if test="${not empty message}">
                    <div class="alert alert-success alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span></button>
                            ${message}
                    </div>
                </c:if>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th> 类型</th>
                            <th> 名称</th>
                            <th> 是否可用</th>
                            <th> 操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.list}" var="role">
                            <tr>
                                <td>${sys:getDictLabel(role.roleType, 'ROLE_TYPE', '---')}</td>
                                <td>${role.name}</td>
                                <td>
                                    <input type="checkbox" <c:if test="${role.useable eq '1'}">checked</c:if> readonly class="make-switch" data-size="mini">
                                </td>
                                <td>
                                    <a href="${adminPath}/system/role/edit?id=${role.id}" class="btn btn-circle btn-xs blue edit">
                                        <i class="fa fa-edit"></i> 编辑 </a>
                                    <a href="javascript:;" class="btn btn-circle btn-xs red del"  data-id="${role.id}">
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
    var Role = function(){

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
                            $.post("${adminPath}/system/role/del",{id : id} , function(result){
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
        Role.init();
    });
</script>
</body>
</html>