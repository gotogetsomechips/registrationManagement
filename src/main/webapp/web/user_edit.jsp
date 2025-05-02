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
            <a class="btn btn-grad btn-info btn-sm" href="user_list.jsp">用户管理</a>
        </div>
        <div class="index-nav-frame-line" tabindex="-1">
            <a class="btn btn-grad btn-info btn-sm" href="feedback_list.jsp">反馈管理</a>
        </div>
        <div class="index-nav-frame-line" tabindex="-1">
            <a class="btn btn-grad btn-info btn-sm" href="household_list.jsp">户籍管理</a>
        </div>
        <div class="index-nav-frame-line" tabindex="-1">
            <a class="btn btn-grad btn-info btn-sm" href="immigration_list.jsp">迁入管理</a>
        </div>
        <div class="index-nav-frame-line" tabindex="-1">
            <a class="btn btn-grad btn-info btn-sm" href="outmigration_list.jsp">迁出管理</a>
        </div>
        <div class="index-nav-frame-line" tabindex="-1">
            <a class="btn btn-grad btn-info btn-sm" href="notice_list.jsp">公告管理</a>
        </div>

        <div class="index-nav-frame-line" style="float: right;" tabindex="-1">
            <a href="AuthServlet?action=logout" class="btn btn-grad btn-info btn-sm">退出</a>
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
    <form action="/registrationManagementSystem_war/user/edit" method="post" onsubmit="return check()">
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

        <table class="index-content-table-add">
            <tr>
                <td width="12%">用户名：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="username" name="username" value="${vo.username}"/>
                </td>
            </tr>
            <tr>
                <td width="12%">密码：</td>
                <td>
                    <input class="index-content-table-td-add" type="password" id="password" name="password" value="${vo.password}"/>

                </td>
            </tr>
            <tr>
                <td width="12%">姓名：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="realName" name="realName" value="${vo.realName}"/>

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


                </td>
            </tr>
            <tr>
                <td width="12%">备注：</td>
                <td><textarea id="userText" name="userText" style="width: 60%; height: 100px;padding: 0px 17px;" placeholder="请输入内容......">${vo.userText}</textarea></td>
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
    });

    //提交之前进行检查，如果return false，则不允许提交
    function check() {
        // 用户名验证
        if (document.getElementById("username").value.trim().length == 0) {
            alert("用户名不能为空!");
            return false;
        }

        // 密码验证
        const password = document.getElementById("password").value.trim();
        if (password.length == 0) {
            alert("密码不能为空!");
            return false;
        }
        if (password.length < 8) {
            alert("密码长度不能少于8位!");
            return false;
        }

        // 姓名验证
        if (document.getElementById("realName").value.trim().length == 0) {
            alert("姓名不能为空!");
            return false;
        }

        // 手机号验证
        const phone = document.getElementById("userPhone").value.trim();
        if (phone.length == 0) {
            alert("手机不能为空!");
            return false;
        }

        // 验证手机号格式 (中国大陆11位手机号)
        const phoneRegex = /^1[3-9]\d{9}$/;
        if (!phoneRegex.test(phone)) {
            alert("请输入有效的11位手机号码!");
            return false;
        }

        // 检查是否有修改
        if (!hasChanged()) {
            alert("未做任何修改，无需提交!");
            return false;
        }

        return true;
    }

    // 检查是否有字段被修改
    function hasChanged() {
        const username = document.getElementById("username").value.trim();
        const password = document.getElementById("password").value.trim();
        const realName = document.getElementById("realName").value.trim();
        const userPhone = document.getElementById("userPhone").value.trim();
        const userText = document.getElementById("userText").value;

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

        // 获取原始值
        const originalUsername = document.getElementById("originalUsername").value;
        const originalPassword = document.getElementById("originalPassword").value;
        const originalRealName = document.getElementById("originalRealName").value;
        const originalUserSex = document.getElementById("originalUserSex").value;
        const originalUserPhone = document.getElementById("originalUserPhone").value;
        const originalUserText = document.getElementById("originalUserText").value;
        const originalUserType = document.getElementById("originalUserType").value;

        // 检查是否有任何字段被修改
        return (
            username !== originalUsername ||
            password !== originalPassword ||
            realName !== originalRealName ||
            userSex !== originalUserSex ||
            userPhone !== originalUserPhone ||
            userText !== originalUserText ||
            userType !== originalUserType
        );
    }

    // 异步检查用户名是否存在（如果已更改）
    $(document).ready(function() {
        $('#username').blur(function() {
            var username = $(this).val().trim();
            var originalUsername = $('#originalUsername').val();

            // 只有当用户名发生变化时才检查
            if (username.length > 0 && username !== originalUsername) {
                $.post('user/checkUsername', {username: username}, function(data) {
                    if (data === 'false') {
                        alert('用户名已存在，请更换其他用户名！');
                        $('#username').focus();
                    }
                });
            }
        });
    });
</script>
</html>