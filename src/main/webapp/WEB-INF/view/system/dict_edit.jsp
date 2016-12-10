<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>部门编辑</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@ include file="/WEB-INF/view/global/head-lib.jsp" %>
    <script src="${staticPath}/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${staticPath}/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
</head>
<body>

<div class="page-inner-container" style="padding: 0px 15px">
    <div class="row">
        <div class="portlet  light  bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-bubble font-green"></i>
                    <span class="caption-subject font-blue-sharp bold uppercase">字典编辑</span>
                </div>
            </div>
            <div class="portlet-body">
                 <form:form modelAttribute="dict" action="${adminPath}/system/dict/save" method="post" id="dict-form" class="form-horizontal">
                    <form:hidden path="id"/>
                    <div class="form-body">
                        <div class="alert alert-danger display-hide alert-dismissible" role="alert">
                             <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span></button>
                            请保证表单信息填写正确
                        </div>
                        <div class="form-group  margin-top-20">
                            <label class="control-label col-md-3" style="text-align: right; padding-top:7px">数据值
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <form:input path="value" cssClass="form-control" htmlEscape="false"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-md-3" style="text-align: right; padding-top:7px">标签
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <form:input path="label" cssClass="form-control" htmlEscape="false"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-md-3" style="text-align: right; padding-top:7px">类型
                                <span class="required">* </span>
                            </label>
                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <form:input path="type" cssClass="form-control" htmlEscape="false"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-md-3" style="text-align: right; padding-top:7px">排序
                                <span class="required">* </span>
                            </label>
                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <form:input path="sort" cssClass="form-control" htmlEscape="false"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-md-3" style="text-align: right; padding-top:7px">描述
                                <span class="required"> </span>
                            </label>
                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <form:input path="description" cssClass="form-control" htmlEscape="false"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-md-3" style="text-align: right; padding-top:7px">备注
                                <span class="required"> </span>
                            </label>
                            <div class="col-md-4">
                                <div class="input-icon right">
                                    <i class="fa"></i>
                                    <form:textarea path="remarks" cssClass="form-control" htmlEscape="false"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-actions">
                            <div class="row">
                                <div class="col-xs-offset-3 col-xs-9">
                                    <input type="submit" class="btn green" value="保存"/>
                                    <input type="button" class="btn default" value="返回"
                                           onclick="location.href='${adminPath}/system/dict/list'"/>
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
            var dictForm = $('#dict-form');
            var error = $('.alert-danger', dictForm);

            dictForm.validate({
                errorElement: 'span',
                errorClass: 'help-block help-block-error',
                focusInvalid: false,
                ignore: "",
                rules: {
                    value: {
                        required: true
                    },
                    label: {
                        required: true,
                    },
                    type: {
                        required: true
                    },
                    sort{
                        required:true,
                        number: true
                    },
                    description:{
                        required:true
                    }
                },

                invalidHandler: function (event, validator) {
                    error.show();
                },

                errorPlacement: function (error, element) {
                    var icon = $(element).parent('.input-icon').children('i');
                    icon.removeClass('fa-check').addClass("fa-warning");
                },

                highlight: function (element) {
                    $(element).closest('.form-group').removeClass("has-success").addClass('has-error');
                },

                success: function (label, element) {
                    var icon = $(element).parent('.input-icon').children('i');
                    $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
                    icon.removeClass("fa-warning").addClass("fa-check");
                },

                submitHandler: function (form) {
                    form.submit();
                }
            });

        }
        return {
            init: function () {
                handleValidation();
            }
        }
    }();
    $(document).ready(function () {
        FormValidation.init();
    });
</script>
</body>
</html>