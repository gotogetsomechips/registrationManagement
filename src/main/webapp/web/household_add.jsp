<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>添加户籍</title>
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
            <a class="btn btn-grad btn-info btn-sm" href="../user/list">用户管理</a>
        </div>
        <div class="index-nav-frame-line" tabindex="-1">
            <a class="btn btn-grad btn-info btn-sm" href="../feedback/list">反馈管理</a>
        </div>
        <div class="index-nav-frame-line" tabindex="-1">
            <a class="btn btn-grad btn-info btn-sm" href="list">户籍管理</a>
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
            <a href="AuthServlet?action=logout" class="btn btn-grad btn-info btn-sm">退出</a>
        </div>
        <div class="index-nav-frame-line" style="float: right;color: #000000;width: 200px">
            欢迎：<a>${loginUser.username}</a>
        </div>
    </div>
</div>
<div class="index-content">
    <div class="index-content-operation">
        <a class="info-detail">添加户籍</a>
        <br>
        <br>
    </div>
    <br>
    <form action="/registrationManagementSystem_war/household/add" method="post" onsubmit="return check()">
        <table class="index-content-table-add">
            <tr>
                <td width="12%">姓名：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="householdName" name="householdName" value=""/>
                </td>
            </tr>
            <tr>
                <td width="12%">性别：</td>
                <td>
                    <input name="gender" type="radio" value="男" checked="checked"/>&nbsp;&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="gender" type="radio" value="女"/>&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td width="12%">电话：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="phone" name="phone" value=""/>
                </td>
            </tr>
            <tr>
                <td width="12%">所在区：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="district" name="district" value=""/>
                </td>
            </tr>
            <tr>
                <td width="12%">房屋号：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="houseNumber" name="houseNumber" value=""/>
                </td>
            </tr>
            <tr>
                <td width="12%">单元：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="unit" name="unit" value=""/>
                </td>
            </tr>
            <tr>
                <td width="12%">户型：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="houseType" name="houseType" value=""/>
                </td>
            </tr>
            <tr>
                <td width="12%">备注：</td>
                <td><textarea id="remark" name="remark" style="width: 60%; height: 100px;padding: 0px 17px;" placeholder="请输入内容......"></textarea></td>
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
        // 姓名验证
        const householdName = document.getElementById("householdName").value.trim();
        if (householdName.length == 0) {
            alert("姓名不能为空!");
            return false;
        }

        // 电话验证
        const phone = document.getElementById("phone").value.trim();
        if (phone.length == 0) {
            alert("电话不能为空!");
            return false;
        }

        // 验证电话格式 (中国大陆11位手机号)
        const phoneRegex = /^1[3-9]\d{9}$/;
        if (!phoneRegex.test(phone)) {
            alert("请输入有效的11位手机号码!");
            return false;
        }

        // 所在区验证
        if (document.getElementById("district").value.trim().length == 0) {
            alert("所在区不能为空!");
            return false;
        }

        // 房屋号验证
        if (document.getElementById("houseNumber").value.trim().length == 0) {
            alert("房屋号不能为空!");
            return false;
        }

        // 单元验证
        if (document.getElementById("unit").value.trim().length == 0) {
            alert("单元不能为空!");
            return false;
        }

        // 户型验证
        if (document.getElementById("houseType").value.trim().length == 0) {
            alert("户型不能为空!");
            return false;
        }

        // 使用同步AJAX检查姓名是否存在
        let nameExists = false;
        $.ajax({
            url: "/registrationManagementSystem_war/household/checkNameExists",
            type: "POST",
            data: {
                "householdName": householdName,
                "excludeId": null  // 添加时没有需要排除的ID
            },
            async: false,
            success: function(response) {
                if (response === "true") {
                    alert("该姓名已存在，请使用其他姓名!");
                    nameExists = true;
                }
            },
            error: function() {
                alert("验证姓名时发生错误，请稍后再试!");
                nameExists = true;
            }
        });

        if (nameExists) {
            return false;
        }

        return true;
    }
</script>
</html>