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
                                    <li >
                                        <a href="${adminPath}/system/user/user-profile" >个人信息</a>
                                    </li>
                                    <li>
                                        <a href="${adminPath}/system/user/user-profile-photo" >头像修改</a>
                                    </li>
                                    <li class="active">
                                        <a href="${adminPath}/system/user/user-profile-pass" >密码修改</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="portlet-body">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="password-edit">
                                        <form:form modelAttribute="user" action="${adminPath}/system/user/password-save" method="post" id="pass-form" class="form-horizontal">
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
                                                <label class="control-label col-md-3">当前密码
                                                    <span class="required">*</span>
                                                </label>
                                                <div class="col-md-9">
                                                    <div class="input-icon input-inline input-medium right">
                                                        <i class="fa"></i>
                                                        <input type="password" name="password" class="form-control required" maxlength="50"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group  margin-top-20">
                                                <label class="control-label col-md-3">新密码
                                                    <span class="required">*</span>
                                                </label>
                                                <div class="col-md-9">
                                                    <div class="input-icon input-inline input-medium right">
                                                        <i class="fa"></i>
                                                        <input type="password" name="newPassword" class="form-control required" maxlength="50"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group  margin-top-20">
                                                <label class="control-label col-md-3">确认密码
                                                    <span class="required">*</span>
                                                </label>
                                                <div class="col-md-9">
                                                    <div class="input-icon input-inline input-medium right">
                                                        <i class="fa"></i>
                                                        <input type="password"  name="confirmNewPassword" class="form-control required" maxlength="50"/>
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
            var passForm = $('#pass-form');
            var error = $('.alert-danger', passForm);
            passForm.validate({
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