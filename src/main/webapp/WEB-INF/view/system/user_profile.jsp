<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>个人信息</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@ include file="/WEB-INF/view/global/head-lib.jsp" %>
    <link href="${staticPath}/pages/css/profile.min.css" rel="stylesheet" type="text/css" />
    <link href="${staticPath}/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />

    <script src="${staticPath}/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
    <script src="${staticPath}/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${staticPath}/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
    <script src="${staticPath}/global/plugins/jquery-validation/js/jquery.validate.method.js" type="text/javascript"></script>
</head>
<body>

<div class="page-inner-container" style="padding: 0px 15px">
    <div class="row">
        <div class="col-md-12">
            <div class="profile-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="portlet light ">
                            <div class="portlet-title tabbable-line">
                                <div class="caption caption-md">
                                    <i class="icon-globe theme-font hide"></i>
                                    <span class="caption-subject font-blue-madison bold uppercase">账户编辑</span>
                                </div>
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a href="${adminPath}/system/user/user-profile">个人信息</a>
                                    </li>
                                    <li>
                                        <a href="${adminPath}/system/user/user-profile-photo">头像修改</a>
                                    </li>
                                    <li>
                                        <a href="${adminPath}/system/user/user-profile-pass">密码修改</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="portlet-body">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="user-edit">
                                        <form:form modelAttribute="user" action="${adminPath}/system/user/profile-save" method="post" id="user-form" class="form-horizontal">
                                        <form:hidden path="id"/>
                                            <c:if test="${not empty message}">
                                                <div class="alert alert-success alert-dismissible" role="alert">
                                                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span></button>
                                                        ${message}
                                                </div>
                                            </c:if>
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
                                                </div>
                                            </div>

                                            <div class="form-group  margin-top-20">
                                                <label class="control-label col-md-3">是否允许登录
                                                    <span class="required"></span>
                                                </label>
                                                <div class="col-md-9">
                                                    <div class="input-icon input-inline input-medium right">
                                                        <i class="fa"></i>
                                                        <form:checkbox disabled="true" path="loginFlag"  value="1"  cssClass="make-switch form-control"  data-size="small"/>
                                                        <input type="hidden" name="loginFlag" value="${user.loginFlag}">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group  margin-top-20">
                                                <label class="control-label col-md-3">所属部门
                                                    <span class="required"></span>
                                                </label>
                                                <div class="col-md-9">
                                                    <div class="input-icon input-inline input-medium right">
                                                        <i class="fa"></i>
                                                        <form:input path="department.name" cssClass="form-control required" disabled="true"/>
                                                        <form:hidden path="department.id"/>
                                                    </div>
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
        };

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