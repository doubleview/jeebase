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
<<<<<<< HEAD
    <link href="${staticPath}/pages/css/profile.min.css" rel="stylesheet" type="text/css" />
    <link href="${staticPath}/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />

    <script src="${staticPath}/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
    <script src="${staticPath}/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${staticPath}/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
    <script src="${staticPath}/global/plugins/jquery-validation/js/jquery.validate.method.js" type="text/javascript"></script>
=======
    <link href="${staticPath}/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
    <link href="${staticPath}/pages/css/profile.min.css" rel="stylesheet" type="text/css" />
    <script src="${staticPath}/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${staticPath}/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
    <script src="${staticPath}/global/plugins/jquery-validation/js/jquery.validate.method.js" type="text/javascript"></script>
    <script src="${staticPath}/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
    <script src="${staticPath}/pages/scripts/profile.min.js" type="text/javascript"></script>
>>>>>>> c8a5ea59c9c7f24d421849f4c7e1d51d18cad5f3
</head>
<body>

<div class="page-inner-container" style="padding: 0px 15px">
    <div class="row">
        <div class="col-md-12">
<<<<<<< HEAD
=======

>>>>>>> c8a5ea59c9c7f24d421849f4c7e1d51d18cad5f3
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
<<<<<<< HEAD
                                        <a href="${adminPath}/system/user/user-profile">个人信息</a>
                                    </li>
                                    <li>
                                        <a href="${adminPath}/system/user/user-profile-photo">头像修改</a>
                                    </li>
                                    <li>
                                        <a href="${adminPath}/system/user/user-profile-pass">密码修改</a>
=======
                                        <a href="#tab_1_1" data-toggle="tab">个人信息</a>
                                    </li>
                                    <li>
                                        <a href="#tab_1_2" data-toggle="tab">头像修改</a>
                                    </li>
                                    <li>
                                        <a href="#tab_1_3" data-toggle="tab">密码修改</a>
                                    </li>
                                    <li>
                                        <a href="#tab_1_4" data-toggle="tab">私人设置</a>
>>>>>>> c8a5ea59c9c7f24d421849f4c7e1d51d18cad5f3
                                    </li>
                                </ul>
                            </div>
                            <div class="portlet-body">
                                <div class="tab-content">
<<<<<<< HEAD
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
=======
                                    <div class="tab-pane active" id="tab_1_1">
                                        <form role="form" action="#">
                                            <div class="form-group">
                                                <label class="control-label">First Name</label>
                                                <input type="text" placeholder="John" class="form-control" /> </div>
                                            <div class="form-group">
                                                <label class="control-label">Last Name</label>
                                                <input type="text" placeholder="Doe" class="form-control" /> </div>
                                            <div class="form-group">
                                                <label class="control-label">Mobile Number</label>
                                                <input type="text" placeholder="+1 646 580 DEMO (6284)" class="form-control" /> </div>
                                            <div class="form-group">
                                                <label class="control-label">Interests</label>
                                                <input type="text" placeholder="Design, Web etc." class="form-control" /> </div>
                                            <div class="form-group">
                                                <label class="control-label">Occupation</label>
                                                <input type="text" placeholder="Web Developer" class="form-control" /> </div>
                                            <div class="form-group">
                                                <label class="control-label">About</label>
                                                <textarea class="form-control" rows="3" placeholder="We are KeenThemes!!!"></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label">Website Url</label>
                                                <input type="text" placeholder="http://www.mywebsite.com" class="form-control" /> </div>
                                            <div class="margiv-top-10">
                                                <a href="javascript:;" class="btn green"> Save Changes </a>
                                                <a href="javascript:;" class="btn default"> Cancel </a>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="tab-pane" id="tab_1_2">
                                        <p> Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum
                                            eiusmod. </p>
                                        <form action="#" role="form">
                                            <div class="form-group">
                                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                                    <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                        <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt="" /> </div>
                                                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"> </div>
                                                    <div>
                                                                            <span class="btn default btn-file">
                                                                                <span class="fileinput-new"> Select image </span>
                                                                                <span class="fileinput-exists"> Change </span>
                                                                                <input type="file" name="..."> </span>
                                                        <a href="javascript:;" class="btn default fileinput-exists" data-dismiss="fileinput"> Remove </a>
                                                    </div>
                                                </div>
                                                <div class="clearfix margin-top-10">
                                                    <span class="label label-danger">NOTE! </span>
                                                    <span>Attached image thumbnail is supported in Latest Firefox, Chrome, Opera, Safari and Internet Explorer 10 only </span>
                                                </div>
                                            </div>
                                            <div class="margin-top-10">
                                                <a href="javascript:;" class="btn green"> Submit </a>
                                                <a href="javascript:;" class="btn default"> Cancel </a>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="tab-pane" id="tab_1_3">
                                        <form action="#">
                                            <div class="form-group">
                                                <label class="control-label">Current Password</label>
                                                <input type="password" class="form-control" /> </div>
                                            <div class="form-group">
                                                <label class="control-label">New Password</label>
                                                <input type="password" class="form-control" /> </div>
                                            <div class="form-group">
                                                <label class="control-label">Re-type New Password</label>
                                                <input type="password" class="form-control" /> </div>
                                            <div class="margin-top-10">
                                                <a href="javascript:;" class="btn green"> Change Password </a>
                                                <a href="javascript:;" class="btn default"> Cancel </a>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="tab-pane" id="tab_1_4">
                                        <form action="#">
                                            <table class="table table-light table-hover">
                                                <tr>
                                                    <td> Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus.. </td>
                                                    <td>
                                                        <div class="mt-radio-inline">
                                                            <label class="mt-radio">
                                                                <input type="radio" name="optionsRadios1" value="option1" /> Yes
                                                                <span></span>
                                                            </label>
                                                            <label class="mt-radio">
                                                                <input type="radio" name="optionsRadios1" value="option2" checked/> No
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td> Enim eiusmod high life accusamus terry richardson ad squid wolf moon </td>
                                                    <td>
                                                        <div class="mt-radio-inline">
                                                            <label class="mt-radio">
                                                                <input type="radio" name="optionsRadios11" value="option1" /> Yes
                                                                <span></span>
                                                            </label>
                                                            <label class="mt-radio">
                                                                <input type="radio" name="optionsRadios11" value="option2" checked/> No
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td> Enim eiusmod high life accusamus terry richardson ad squid wolf moon </td>
                                                    <td>
                                                        <div class="mt-radio-inline">
                                                            <label class="mt-radio">
                                                                <input type="radio" name="optionsRadios21" value="option1" /> Yes
                                                                <span></span>
                                                            </label>
                                                            <label class="mt-radio">
                                                                <input type="radio" name="optionsRadios21" value="option2" checked/> No
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td> Enim eiusmod high life accusamus terry richardson ad squid wolf moon </td>
                                                    <td>
                                                        <div class="mt-radio-inline">
                                                            <label class="mt-radio">
                                                                <input type="radio" name="optionsRadios31" value="option1" /> Yes
                                                                <span></span>
                                                            </label>
                                                            <label class="mt-radio">
                                                                <input type="radio" name="optionsRadios31" value="option2" checked/> No
                                                                <span></span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                            <div class="margin-top-10">
                                                <a href="javascript:;" class="btn red"> Save Changes </a>
                                                <a href="javascript:;" class="btn default"> Cancel </a>
                                            </div>
                                        </form>
>>>>>>> c8a5ea59c9c7f24d421849f4c7e1d51d18cad5f3
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
<<<<<<< HEAD
        var handleValidation = function () {
            var userForm = $('#user-form');
            var error = $('.alert-danger', userForm);
            userForm.validate({
=======

        var handleValidation = function () {
            var dictForm = $('#dict-form');
            var error = $('.alert-danger', dictForm);

            dictForm.validate({
>>>>>>> c8a5ea59c9c7f24d421849f4c7e1d51d18cad5f3
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
<<<<<<< HEAD
        };
=======
        }
>>>>>>> c8a5ea59c9c7f24d421849f4c7e1d51d18cad5f3

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