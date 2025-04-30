<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>登录页</title>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
    <script type="text/javascript">
        let alert_msg = '${alert_msg}';
        if (alert_msg != null && alert_msg.trim() != '') {
            window.alert(alert_msg);
        }
    </script>
</head>
<body>
<h1 style="text-align: center;font-size: 40px;padding-top:1px;font-weight: 700;color:#000000;text-shadow: 2px 3px #FFFFFF;">户籍管理系统</h1>
<form action="AuthServlet?action=login" method="post" onsubmit="return check()">
    <div class="login">
        <div class="login-top">
            <a href="#" style="color:dodgerblue ;text-decoration: none;padding-left: 63px;">登录</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a
                style="color: black;text-decoration: none;" href="register.jsp">注册</a>
        </div>
        <div class="login-center clearfix">
            <div class="login-center-img"><img src="img/name.png"/></div>
            <div class="login-center-input">
                <input type="text" id="username" name="username"  placeholder="请输入您的账号" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的账号'"/>
            </div>
        </div>
        <br>
        <br>
        <div class="login-center clearfix">
            <div class="login-center-img"><img src="img/password.png"/></div>
            <div class="login-center-input">
                <input type="password" id="password" name="password"  placeholder="请输入您的密码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的密码'"/>
            </div>
        </div>
        <br>
        <br>

        <div class="login-center clearfix">
            <div class="login-center-img"><img src="img/password.png"/></div>
            <div class="login-center-input">
                <input type="text" id="validationCode" name="validationCode"  style="font-size: 10px;width: 90px;margin-top: 0px;" placeholder="请输入验证码"/>
                <img id="img_validation_code" src="AuthServlet?action=validationCode" onclick="refresh()" style="height: 30px;"/>
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
        return true;
    }
    function refresh() {
        var img = document.getElementById("img_validation_code")
        img.src = "AuthServlet?action=validationCode&r=" + Math.random();
    }
</script>
</html>