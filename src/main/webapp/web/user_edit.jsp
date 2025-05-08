<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>修改用户</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .error-message {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }
        .success-message {
            color: green;
            font-size: 12px;
            margin-top: 5px;
        }
        .error-input {
            border: 1px solid red !important;
        }
        .success-input {
            border: 1px solid green !important;
        }
    </style>
</head>
<body>
<div class="index-nav">
    <div class="index-nav-frame clearfix">
        <div class="nav-line"></div>
        <div class="nav-small" tabindex="-1">
            <div class="nav-small-focus" tabindex="-1">
            </div>
            <img src="${pageContext.request.contextPath}/img/icon.png"/>
        </div>
        <div class="index-nav-frame-line" tabindex="-1">
            <a class="btn btn-grad btn-info btn-sm" href="../user/list">用户管理</a>
        </div>
        <div class="index-nav-frame-line" tabindex="-1">
            <a class="btn btn-grad btn-info btn-sm" href="../feedback/list">反馈管理</a>
        </div>
        <div class="index-nav-frame-line" tabindex="-1">
            <a class="btn btn-grad btn-info btn-sm" href="../household/list">户籍管理</a>
        </div>
        <div class="index-nav-frame-line" tabindex="-1">
            <a class="btn btn-grad btn-info btn-sm" href="../immigration/list">迁入管理</a>
        </div>
        <div class="index-nav-frame-line" tabindex="-1">
            <a class="btn btn-grad btn-info btn-sm" href="../outmigration/list">迁出管理</a>
        </div>
        <div class="index-nav-frame-line" tabindex="-1">
            <a class="btn btn-grad btn-info btn-sm" href="../notice/list">公告管理</a>
        </div>

        <div class="index-nav-frame-line" style="float: right;" tabindex="-1">
            <a href="${pageContext.request.contextPath}/auth/logout" class="btn btn-grad btn-info btn-sm">退出</a>
        </div>
        <div class="index-nav-frame-line" style="float: right;color: #000000;width: 200px">
            欢迎：<a>${loginUser.username}</a>
        </div>
    </div>
</div>
<div class="index-content">
    <div class="index-content-operation">
        <a class="info-detail">修改用户</a>
        <br>
        <br>
    </div>
    <br>
    <form action="/registrationManagementSystem_war/user/edit" method="post" onsubmit="return check()" id="userForm">
        <input type="hidden" id="id" name="id" value="${vo.id}"/>
        <input type="hidden" id="createBy" name="createBy" value="${vo.createBy}"/>
        <!-- 存储原始数据，用于检查是否有修改 -->
        <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"/>
        <input type="hidden" id="originalUsername" value="${vo.username}"/>
        <input type="hidden" id="originalPassword" value="${vo.password}"/>
        <input type="hidden" id="originalRealName" value="${vo.realName}"/>
        <input type="hidden" id="originalUserSex" value="${vo.userSex}"/>
        <input type="hidden" id="originalUserPhone" value="${vo.userPhone}"/>
        <input type="hidden" id="originalUserText" value="${vo.userText}"/>
        <input type="hidden" id="originalUserType" value="${vo.userType}"/>
        <input type="hidden" id="originalStatus" value="${vo.status}"/>

        <table class="index-content-table-add">
            <tr>
                <td width="12%">用户名：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="username" name="username" value="${vo.username}"/>
                    <div id="usernameError" class="error-message"></div>
                </td>
            </tr>
            <tr>
                <td width="12%">密码：</td>
                <td>
                    <input class="index-content-table-td-add" type="password" id="password" name="password" value="${vo.password}"/>
                    <div id="passwordError" class="error-message"></div>
                </td>
            </tr>
            <tr>
                <td width="12%">姓名：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="realName" name="realName" value="${vo.realName}"/>
                    <div id="realNameError" class="error-message"></div>
                </td>
            </tr>
            <tr>
                <td width="12%">性别：</td>
                <td>
                    <input name="userSex" type="radio" value="男" ${vo.userSex=='男'?'checked':''}/>&nbsp;&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="userSex" type="radio" value="女" ${vo.userSex=='女'?'checked':''}/>&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td width="12%">手机：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="userPhone" name="userPhone" value="${vo.userPhone}"/>
                    <div id="userPhoneError" class="error-message"></div>
                </td>
            </tr>
            <tr>
                <td width="12%">备注：</td>
                <td><textarea id="userText" name="userText" style="width: 60%; height: 100px;padding: 0px 17px;" placeholder="请输入内容......">${vo.userText}</textarea></td>
            </tr>
            <tr>
                <td width="12%">账户状态：</td>
                <td>
                    <input name="status" type="radio" value="1" ${vo.status==1 || vo.status==null?'checked':''}/>&nbsp;&nbsp;&nbsp;正常&nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="status" type="radio" value="0" ${vo.status==0?'checked':''}/>&nbsp;&nbsp;&nbsp;锁定&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td width="12%">类型：</td>
                <td>
                    <input name="userType" type="radio" value="管理员" ${vo.userType=='管理员'?'checked':''}/>&nbsp;&nbsp;&nbsp;管理员&nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="userType" type="radio" value="普通用户" ${vo.userType=='普通用户'?'checked':''}/>&nbsp;&nbsp;&nbsp;普通用户&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
        </table>
        <br>
        <br>
        <br>
        &nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-grad btn-primary btn-sm">提交</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-grad btn-danger btn-sm" onclick="javascript:history.back(-1);">取消</button>
    </form>
</div>

</body>
<script type="text/javascript">
    // 页面加载完成后检查是否有错误或成功消息需要显示
    $(document).ready(function() {
        <c:if test="${not empty error}">
        alert("${error}");
        </c:if>
        <c:if test="${not empty success}">
        alert("${success}");
        </c:if>

        // 绑定输入框的blur事件进行异步校验
        $("#username").blur(function() {
            validateUsername();
        });

        $("#password").blur(function() {
            validatePassword();
        });

        $("#realName").blur(function() {
            validateRealName();
        });

        $("#userPhone").blur(function() {
            validateUserPhone();
        });
    });

    // 验证用户名
    function validateUsername() {
        const username = $("#username").val().trim();
        const errorElement = $("#usernameError");
        const originalUsername = $("#originalUsername").val();
        const id = $("#id").val();

        if (username.length === 0) {
            showError(errorElement, "用户名不能为空!");
            return false;
        }

        // 只有当用户名发生变化时才检查
        if (username !== originalUsername) {
            $.ajax({
                url: "/registrationManagementSystem_war/user/checkUsername",
                type: "POST",
                data: { username: username },
                success: function(response) {
                    if (response === "false") {
                        showError(errorElement, "用户名已存在!");
                    } else {
                        showSuccess(errorElement, "用户名可用");
                    }
                },
                error: function() {
                    showError(errorElement, "验证失败，请稍后重试");
                }
            });
        } else {
            showSuccess(errorElement, "用户名有效");
        }

        return true;
    }

    // 验证密码
    function validatePassword() {
        const password = $("#password").val().trim();
        const errorElement = $("#passwordError");

        if (password.length === 0) {
            showError(errorElement, "密码不能为空!");
            return false;
        }

        if (password.length < 8) {
            showError(errorElement, "密码长度不能少于8位!");
            return false;
        }

        showSuccess(errorElement, "密码有效");
        return true;
    }

    // 验证姓名
    function validateRealName() {
        const realName = $("#realName").val().trim();
        const errorElement = $("#realNameError");

        if (realName.length === 0) {
            showError(errorElement, "姓名不能为空!");
            return false;
        }

        showSuccess(errorElement, "姓名有效");
        return true;
    }

    // 验证手机号
    function validateUserPhone() {
        const phone = $("#userPhone").val().trim();
        const errorElement = $("#userPhoneError");

        if (phone.length === 0) {
            showError(errorElement, "手机不能为空!");
            return false;
        }

        // 验证手机号格式 (中国大陆11位手机号)
        const phoneRegex = /^1[3-9]\d{9}$/;
        if (!phoneRegex.test(phone)) {
            showError(errorElement, "请输入有效的11位手机号码!");
            return false;
        }

        showSuccess(errorElement, "手机号码格式正确");
        return true;
    }

    // 显示错误信息
    function showError(element, message) {
        element.text(message).removeClass("success-message").addClass("error-message");
        element.prev().removeClass("success-input").addClass("error-input");
    }

    // 显示成功信息
    function showSuccess(element, message) {
        element.text(message).removeClass("error-message").addClass("success-message");
        element.prev().removeClass("error-input").addClass("success-input");
    }

    //提交之前进行检查
    function check() {
        let isValid = true;

        // 验证用户名
        if (!validateUsername()) {
            isValid = false;
        }

        // 验证密码
        if (!validatePassword()) {
            isValid = false;
        }

        // 验证姓名
        if (!validateRealName()) {
            isValid = false;
        }

        // 验证手机号
        if (!validateUserPhone()) {
            isValid = false;
        }

        // 检查是否有修改
        if (!hasChanged()) {
            alert("未做任何修改，无需提交!");
            isValid = false;
        }

        return isValid;
    }

    // 检查是否有字段被修改
    function hasChanged() {
        const username = $("#username").val().trim();
        const password = $("#password").val().trim();
        const realName = $("#realName").val().trim();
        const userPhone = $("#userPhone").val().trim();
        const userText = $("#userText").val();

        // 获取选中的性别
        let userSex = "";
        const sexRadios = document.getElementsByName("userSex");
        for (let i = 0; i < sexRadios.length; i++) {
            if (sexRadios[i].checked) {
                userSex = sexRadios[i].value;
                break;
            }
        }

        // 获取选中的用户类型
        let userType = "";
        const typeRadios = document.getElementsByName("userType");
        for (let i = 0; i < typeRadios.length; i++) {
            if (typeRadios[i].checked) {
                userType = typeRadios[i].value;
                break;
            }
        }

        // 获取选中的账户状态
        let status = "";
        const statusRadios = document.getElementsByName("status");
        for (let i = 0; i < statusRadios.length; i++) {
            if (statusRadios[i].checked) {
                status = statusRadios[i].value;
                break;
            }
        }

        // 获取原始值
        const originalUsername = $("#originalUsername").val();
        const originalPassword = $("#originalPassword").val();
        const originalRealName = $("#originalRealName").val();
        const originalUserSex = $("#originalUserSex").val();
        const originalUserPhone = $("#originalUserPhone").val();
        const originalUserText = $("#originalUserText").val();
        const originalUserType = $("#originalUserType").val();
        const originalStatus = $("#originalStatus").val();

        // 检查是否有任何字段被修改
        return (
            username !== originalUsername ||
            password !== originalPassword ||
            realName !== originalRealName ||
            userSex !== originalUserSex ||
            userPhone !== originalUserPhone ||
            userText !== originalUserText ||
            userType !== originalUserType ||
            status !== originalStatus
        );
    }
</script>
</html>