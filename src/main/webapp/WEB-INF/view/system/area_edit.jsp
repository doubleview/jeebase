<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>区域编辑</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@ include file="/WEB-INF/view/global/head-lib.jsp"%>
    <link href="${staticPath}/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <link href="${staticPath}/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="${staticPath}/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="${staticPath}/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
    <script src="${staticPath}/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
    <script src="${staticPath}/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${staticPath}/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
    <script src="${staticPath}/global/plugins/jquery-validation/js/jquery.validate.method.js" type="text/javascript"></script>
</head>
<body>

<div class="page-inner-container" style="padding: 0px 15px">
    <div class="row">
        <div class="portlet  light  bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-bubble font-green"></i>
                    <span class="caption-subject font-blue-sharp bold uppercase">区域编辑</span>
                </div>
            </div>
            <div class="portlet-body">
                <form:form modelAttribute="area" action="${adminPath}/system/area/save" method="post" id="area-form" class="form-horizontal">
                    <form:hidden path="id"/>
                    <form:hidden path="parent.id"/>
                    <div class="form-body">
                        <div class="alert alert-danger display-hide alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span></button>
                            请保证表单信息填写正确
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-xs-3" style="text-align: right; padding-top:7px">名称
                                <span class="required"> * </span>
                            </label>
                            <div class="col-xs-9">
                                <div class="input-icon input-inline input-medium right">
                                    <i class="fa"></i>
                                    <form:input path="name" cssClass="form-control required" />
                                </div>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-xs-3" style="text-align: right; padding-top:7px">编码
                                <span class="required">* </span>
                            </label>
                            <div class="col-xs-9">
                                <div class="input-icon input-inline input-medium right">
                                    <i class="fa"></i>
                                    <form:input path="code" cssClass="form-control required" />
                                </div>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-xs-3" style="text-align: right; padding-top:7px">上级区域
                                <span class="required"></span>
                            </label>
                            <div class="col-xs-9">
                                <div class="input-icon input-inline input-medium right">
                                    <i class="fa"></i>
                                    <form:input path="parent.name" cssClass="form-control required" disabled="true"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-xs-3" style="text-align: right; padding-top:7px">类型
                                <span class="required">*</span>
                            </label>
                            <div class="col-xs-9">
                                <div class="input-icon input-inline input-medium right">
                                    <i class="fa"></i>
                                    <form:select  path="type" cssClass="select2 form-control required">
                                        <form:option value="" label="请选择"/>
                                        <form:options  items="${sys:getDictList('AREA_TYPE')}" itemLabel="label" itemValue="value"/>
                                    </form:select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-xs-3" style="text-align: right; padding-top:7px">排序
                                <span class="required"> * </span>
                            </label>
                            <div class="col-xs-9">
                                <div class="input-icon input-inline input-medium right">
                                    <i class="fa"></i>
                                    <form:input path="sort" cssClass="form-control required"  />
                                </div>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-xs-3" style="text-align: right; padding-top:7px">备注
                                <span class="required"> </span>
                            </label>
                            <div class="col-xs-9">
                                <div class="input-icon input-inline input-medium right">
                                    <i class="fa"></i>
                                    <form:textarea path="remarks" cssClass="form-control" />
                                </div>
                            </div>
                        </div>
                    <div class="form-actions">
                        <div class="row">
                            <div class="col-xs-offset-3 col-xs-9">
                                <input type="submit" class="btn green" value="保存"/>
                                <input type="button" class="btn default" value="返回" onclick="location.href='${adminPath}/system/area/show?parentId=${area.parent.id}'"/>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
    </div>
</div>

<script>

    var FormValidation = function () {

        var handleValidation = function () {
            var areaForm = $('#area-form');
            var error = $('.alert-danger', areaForm);

            areaForm.validate({
                errorElement: 'span',
                errorClass: 'help-inline help-inline-error',
                focusInvalid: false,
                ignore: "",

                invalidHandler: function (event, validator) {
                    error.show();
                },

                errorPlacement: function (error, element) {
                    var icon = $(element).parent('.input-icon').children('i');
                    icon.addClass("fa-warning");
                    if (element.is(":checkbox")||element.is(":radio")){
                        error.insertAfter(element.parent(".input-inline"));
                        element.removeClass("help-inline").addClass("help-block");
                    }else {
                        error.appendTo(element.parent().parent());
                    }
                },

                highlight: function (element) {
                    $(element).closest('.form-group').addClass('has-error');
                },

                success: function (label, element) {
                    var icon = $(element).parent('.input-icon').children('i');
                    $(element).closest('.form-group').removeClass('has-error');
                    icon.removeClass("fa-warning")
                },

                submitHandler: function (form) {
                    form.submit();
                }
            });
        }

        var bindSelect = function(){
            $.fn.select2.defaults.set("theme", "bootstrap");
            $(".select2, .select2-multiple").select2({
                width: null
            });
        }
        return {
            init: function () {
                handleValidation();
                bindSelect();
            }
        }
    }();
    $(document).ready(function () {
        FormValidation.init();
    });
</script>
</body>
</html>