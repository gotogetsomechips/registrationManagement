<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>登录页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css"/>
    <script type="text/javascript">
        // 显示页面加载时的消息
        let alert_msg = '${alert_msg}';
        if (alert_msg != null && alert_msg.trim() != '') {
            window.alert(alert_msg);
        }

        // AJAX检查用户尝试登录次数，确定是否显示验证码
        function checkNeedValidationCode() {
            var username = document.getElementById("username").value;
            if (username.trim() === "") {
                return;
            }

            var xhr = new XMLHttpRequest();
            xhr.open("GET", "${pageContext.request.contextPath}/auth/needValidationCode?username=" + username, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    if (xhr.responseText === "true") {
                        document.getElementById("validationCodeDiv").style.display = "block";
                    } else {
                        document.getElementById("validationCodeDiv").style.display = "none";
                    }
                }
            };
            xhr.send();
        }
    </script>
</head>
<body>
<h1 style="text-align: center;font-size: 40px;padding-top:1px;font-weight: 700;color:#000000;text-shadow: 2px 3px #FFFFFF;">户籍管理系统</h1>
<form action="${pageContext.request.contextPath}/auth/login" method="post" onsubmit="return check()">
    <div class="login">
        <div class="login-top">
            <a href="#" style="color:dodgerblue ;text-decoration: none;padding-left: 63px;">登录</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a
                style="color: black;text-decoration: none;" href="${pageContext.request.contextPath}/register">注册</a>
        </div>
        <div class="login-center clearfix">
            <div class="login-center-img"><img src="${pageContext.request.contextPath}/img/name.png"/></div>
            <div class="login-center-input">
                <input type="text" id="username" name="username" placeholder="请输入您的账号"
                       onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的账号';checkNeedValidationCode()"/>
            </div>
        </div>
        <br>
        <br>
        <div class="login-center clearfix">
            <div class="login-center-img"><img src="${pageContext.request.contextPath}/img/password.png"/></div>
            <div class="login-center-input">
                <input type="password" id="password" name="password" placeholder="请输入您的密码"
                       onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的密码'"/>
            </div>
        </div>
        <br>
        <br>

        <div id="validationCodeDiv" class="login-center clearfix" style="display: none;">
            <div class="login-center-img"><img src="${pageContext.request.contextPath}/img/password.png"/></div>
            <div class="login-center-input">
                <input type="text" id="validationCode" name="validationCode" style="font-size: 10px;width: 90px;margin-top: 0px;" placeholder="请输入验证码"/>
                <img id="img_validation_code" src="${pageContext.request.contextPath}/auth/validationCode" onclick="refresh()" style="height: 30px;"/>
            </div>
        </div>
        <br>

        <button type="submit" class="login-button">登录</button>
    </div>
</form>
</body>
<script type="text/javascript">
    //提交之前进行检查，如果return false，则不允许提交
    function check() {
        //根据ID获取值
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        if (username == "") {
            alert("用户名不能为空");
            return false;
        }
        if (password == "") {
            alert("密码不能为空");
            return false;
        }

        // 检查验证码是否显示，如果显示则必须输入
        var validationCodeDiv = document.getElementById("validationCodeDiv");
        if (validationCodeDiv.style.display !== "none") {
            var validationCode = document.getElementById("validationCode").value;
            if (validationCode == "") {
                alert("请输入验证码");
                return false;
            }
        }

        return true;
    }

    function refresh() {
        var img = document.getElementById("img_validation_code")
        img.src = "${pageContext.request.contextPath}/auth/validationCode?r=" + Math.random();
    }

    // 页面加载完成后检查是否需要显示验证码
    window.onload = function() {
        var username = document.getElementById("username").value;
        if (username.trim() !== "") {
            checkNeedValidationCode();
        }
    }
</script>
</html>