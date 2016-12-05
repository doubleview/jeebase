<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>字典管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@ include file="/WEB-INF/view/global/head-lib.jsp" %>
    <link href="${staticPath}/global/plugins/sweet-alert/css/sweet-alert.css" rel="stylesheet" type="text/css"/>
    <script src="${staticPath}/global/plugins/sweet-alert/js/sweet-alert.min.js" type="text/javascript"></script>
</head>
<body>
<div class="page-inner-container" style="padding: 0px 15px;">
    <div class="row">
        <div class="portlet light">

                    <form:form id="searchForm" modelAttribute="log"  class="form-horizontal row"  action="${adminPath}/system/log" role="form">
                        <input type="hidden" name="pageNo" value="1">
                        <div class="form-group col-md-3">
                            <label class="col-md-5 control-label">类型</label>
                            <div class="input-group col-md-7">
                                <form:select path="type" cssClass="form-control">
                                    <form:option value="" label=""/>
                                    <form:options  items="${typeList}" itemValue="" itemLabel=""/>
                                </form:select>
                                <span class="input-group-btn">
                                    <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                </span>
                            </div>
                        </div>

                        <div class="form-group col-md-3">
                            <label class="col-md-5 control-label">描述</label>
                            <div class="input-group col-md-7"  >
                                <form:input path="description" cssClass="form-control" readonly="true"/>
                                <span class="input-group-btn">
                                    <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                </span>
                            </div>
                        </div>

                        <div class="form-actions col-md-4">
                            <div class="row">
                                <div class="col-md-offset-3 col-md-9">
                                    <button type="submit" class="btn green">查询</button>
                                    <button type="button" class="btn default" id="reset">重置</button>
                                </div>
                            </div>
                        </div>
                    </form:form>
            <div class="portlet-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th> 类型</th>
                            <th> 键值</th>
                            <th> 标签</th>
                            <th>描述</th>
                            <th> 排序</th>
                            <th> 操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.list}" var="dict">
                            <tr>
                                <td>${dict.type}</td>
                                <td>${dict.value}</td>
                                <td>${dict.label}</td>
                                <td>${dict.description}</td>
                                <td>${dict.sort}</td>
                                <td>
                                    <a href="javascript:;" class="btn btn-circle blue" id="edit">
                                        <i class="fa fa-edit"></i> 编辑 </a>
                                    <a href="javascript:;" class="btn btn-circle red" id="del">
                                        <i class="fa fa-times" data-id="${dict.id}"></i> 删除 </a>
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
    var Dict = function(){

        var bindPageNo = function () {
            $(".pagination a[data-pageNo]").click(function () {
                var pageNo =$(this).attr("data-pageNo");
                $("input[name='pageNo']").val(pageNo);
                //提交表单
                $("#searchForm").submit();
            });
        }

        var bindOperation = function(){
            $("#reset").click(function(){
                $("#searchForm input").val();
            });
            $("#del").click(function(){
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
                            $.post("${adminPath}/system/dict/del",{id : id} , function(result){
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
                bindOperation();
            }
        }
    }();

    $(document).ready(function () {
        Dict.init();
    });
</script>
</body>
</html>