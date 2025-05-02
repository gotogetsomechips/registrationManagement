<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>迁出详情</title>
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
            <a class="btn btn-grad btn-info btn-sm" href="${pageContext.request.contextPath}/user/list">用户管理</a>
        </div>
        <div class="index-nav-frame-line" tabindex="-1">
            <a class="btn btn-grad btn-info btn-sm" href="${pageContext.request.contextPath}/feedback/list">反馈管理</a>
        </div>
        <div class="index-nav-frame-line" tabindex="-1">
            <a class="btn btn-grad btn-info btn-sm" href="${pageContext.request.contextPath}/household/list">户籍管理</a>
        </div>
        <div class="index-nav-frame-line" tabindex="-1">
            <a class="btn btn-grad btn-info btn-sm" href="${pageContext.request.contextPath}/immigration/list">迁入管理</a>
        </div>
        <div class="index-nav-frame-line" tabindex="-1">
            <a class="btn btn-grad btn-info btn-sm" href="${pageContext.request.contextPath}/outmigration/list">迁出管理</a>
        </div>
        <div class="index-nav-frame-line" tabindex="-1">
            <a class="btn btn-grad btn-info btn-sm" href="${pageContext.request.contextPath}/notice/list">公告管理</a>
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
        <a class="info-detail">迁出详情</a>
        <br>
        <br>
    </div>
    <br>
    <form>
        <table class="index-content-table-add" style="font-size: 18px;">
            <tr>
                <td>姓名：<b>${vo.name}</b></td>
            </tr>
            <tr>
                <td>性别：<b>${vo.gender}</b></td>
            </tr>
            <tr>
                <td>迁出金额：<b>${vo.amount}</b></td>
            </tr>
            <tr>
                <td>缴费方式：<b>${vo.paymentMethod}</b></td>
            </tr>
            <tr>
                <td>收费人员：<b>${vo.collector}</b></td>
            </tr>
            <tr>
                <td>迁出时间：<b><fmt:formatDate value="${vo.outTime}" pattern="yyyy年MM月dd日"/></b></td>
            </tr>
            <tr>
                <td>备注：<b>${vo.remarks}</b></td>
            </tr>
            <tr>
                <td>创建时间：<b><fmt:formatDate value="${vo.createTime}" pattern="yyyy年MM月dd日 HH:mm:ss"/></b></td>
            </tr>
            <c:if test="${not empty vo.updateTime}">
                <tr>
                    <td>更新时间：<b><fmt:formatDate value="${vo.updateTime}" pattern="yyyy年MM月dd日 HH:mm:ss"/></b></td>
                </tr>
            </c:if>

        </table>
        <br>
        <button type="button" class="btn btn-grad btn-danger btn-sm" onclick="javascript:history.back(-1);">返回</button>
    </form>
</div>
</body>
</html>