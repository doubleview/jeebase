<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>用户编辑</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@ include file="/WEB-INF/view/global/head-lib.jsp" %>
    <link href="${staticPath}/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <script src="${staticPath}/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
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
                    <span class="caption-subject font-blue-sharp bold uppercase">用户编辑</span>
                </div>
            </div>
            <div class="portlet-body">
                 <form:form modelAttribute="user" action="${adminPath}/system/user/save" method="post" id="user-form" class="form-horizontal">
                    <form:hidden path="id"/>
                    <div class="form-body">
                        <div class="alert alert-danger display-hide alert-dismissible" role="alert">
                             <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span></button>
                                请保证表单信息填写正确
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-md-3">登录名
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-9">
                                <div class="input-icon input-inline input-medium right">
                                    <i class="fa"></i>
                                    <form:input path="loginName" cssClass="form-control required" maxlength="50"/>
                                </div>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-md-3">名称
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-9">
                                <div class="input-icon input-inline input-medium right">
                                    <i class="fa"></i>
                                    <form:input path="name" cssClass="form-control required" maxlength="50"/>
                                </div>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-md-3">新密码
                                <span class="required"></span>
                            </label>
                            <div class="col-md-9">
                                <div class="input-icon input-inline input-medium right">
                                    <i class="fa"></i>
                                    <form:input path="newPassword" cssClass="form-control required" minlength="6" maxlength="20"/>
                                </div>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-md-3">确认密码
                                <span class="required"></span>
                            </label>
                            <div class="col-md-9">
                                <div class="input-icon input-inline input-medium right">
                                    <i class="fa"></i>
                                    <input path="confirmNewPassword" class="form-control"  minlength="6" maxlength="20" equalTo="#newPassword"/>
                                </div>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-md-3">邮箱
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-9">
                                <div class="input-icon input-inline input-medium right">
                                    <i class="fa"></i>
                                    <form:input path="email" cssClass="form-control required email" maxlength="50"/>
                                </div>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-md-3" style="text-align: right; padding-top:7px">电话
                                <span class="required"></span>
                            </label>
                            <div class="col-md-9">
                                <div class="input-icon input-inline input-medium right">
                                    <i class="fa"></i>
                                    <form:input path="phone" cssClass="form-control" maxlength="50" />
                                </div>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-md-3" style="text-align: right; padding-top:7px">手机
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-9">
                                <div class="input-icon input-inline input-medium right">
                                    <i class="fa"></i>
                                    <form:input path="mobile" cssClass="form-control required" minlength="11" maxlength="11"/>
                                </div>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-md-3">是否允许登录
                                <span class="required"></span>
                            </label>
                            <div class="col-md-9">
                                <div class="input-icon input-inline input-medium right">
                                    <i class="fa"></i>
                                    <form:checkbox path="loginFlag"  value="1"  cssClass="make-switch form-control"  data-size="small"/>
                                </div>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-md-3">所属部门
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-9">
                                <div class="input-icon input-inline input-medium right">
                                    <i class="fa"></i>
                                    <form:input path="department.name" cssClass="form-control" />
                                    <form:hidden path="department.id" cssClass="form-control" />
                                </div>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-md-3">用户角色
                                <span class="required"> </span>
                            </label>
                            <div class="col-md-9">
                                <div class="input-icon input-inline input-medium right">
                                    <i class="fa"></i>
                                    <form:checkboxes path="roleIdList" items="${sys:getRoleList()}" itemLabel="name" itemValue="id"  class="required"/>
                                </div>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                        <div class="form-group  margin-top-20">
                            <label class="control-label col-md-3">备注
                                <span class="required"> </span>
                            </label>
                            <div class="col-md-9">
                                <div class="input-icon input-inline input-medium right">
                                    <i class="fa"></i>
                                    <form:textarea path="remarks" cssClass="form-control" maxlength="200"/>
                                </div>
                                <span class="help-inline"></span>
                            </div>
                        </div>

                        <div class="form-actions">
                            <div class="row">
                                <div class="col-md-offset-3 col-md-9">
                                    <input type="submit" class="btn green" value="保存"/>
                                    <input type="button" class="btn default" value="返回"
                                           onclick="location.href='${adminPath}/system/user/list'"/>
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
            var userForm = $('#user-form');
            var error = $('.alert-danger', userForm);

            userForm.validate({
                errorElement: 'span',
                errorClass: 'help-block help-block-error',
                focusInvalid: false,
                ignore: "",
                rules: {

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