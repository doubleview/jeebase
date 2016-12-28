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
    <link href="${staticPath}/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
    <link href="${staticPath}/pages/css/profile.min.css" rel="stylesheet" type="text/css" />
    <script src="${staticPath}/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
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
                                    <li class="active">
                                        <a href="${adminPath}/system/user/user-profile-photo" >头像修改</a>
                                    </li>
                                    <li>
                                        <a href="${adminPath}/system/user/user-profile-pass" >密码修改</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="portlet-body">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="img-edit">
                                        <form action="${adminPath}/system/user/photo-save" method="post" enctype="multipart/form-data" role="form" id="photo-form">
                                            <input name="id" value="${user.id}" type="hidden">

                                            <c:if test="${not empty message}">
                                                <div class="alert alert-success alert-dismissible" role="alert">
                                                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span></button>
                                                        ${message}
                                                </div>
                                            </c:if>

                                            <div class="form-group">
                                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                                    <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                        <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt="" /> </div>
                                                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"> </div>
                                                    <div>
                                                                            <span class="btn default btn-file">
                                                                                <span class="fileinput-new"> 选取</span>
                                                                                <span class="fileinput-exists"> 更改 </span>
                                                                                <input type="file" name="userImg"> </span>
                                                        <a href="javascript:;" class="btn default fileinput-exists" data-dismiss="fileinput"> 移除 </a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="margin-top-10">
                                                <input type="submit" class="btn green" value="保存"/>
                                            </div>

                                        </form>
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

</body>
</html>