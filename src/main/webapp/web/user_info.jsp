<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>用户详情</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css"/>
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
            <a href="${pageContext.request.contextPath}/auth/logout" class="btn btn-grad btn-info btn-sm">退出</a>
        </div>
        <div class="index-nav-frame-line" style="float: right;color: #000000;width: 200px">
            欢迎：<a>${loginUser.username}</a>
        </div>
    </div>
</div>
<div class="index-content">
    <div class="index-content-operation">
        <a class="info-detail">用户详情</a>
        <br>
        <br>
    </div>
    <br>
    <form>
        <table class="index-content-table-add" style="font-size: 18px;">
            <tr>
                <td>用户名：<b>${vo.username}</b></td>
            </tr>
            <tr>
                <td>姓名：<b>${vo.realName}</b></td>
            </tr>
            <tr>
                <td>性别：<b>${vo.userSex}</b></td>
            </tr>
            <tr>
                <td>手机：<b>${vo.userPhone}</b></td>
            </tr>
            <tr>
                <td>备注：<b>${vo.userText}</b></td>
            </tr>
            <tr>
                <td>类型：<b>${vo.userType}</b></td>
            </tr>
            <tr>
                <td>状态：<b>${vo.status == 1 ? '正常' : '锁定'}</b></td>
            </tr>
            <tr>
                <td>创建时间：<b>${vo.createTime}</b></td>
            </tr>
        </table>
        <br>
        <button type="button" class="btn btn-grad btn-danger btn-sm" onclick="javascript:history.back(-1);">返回</button>
    </form>
</div>
</body>
</html>