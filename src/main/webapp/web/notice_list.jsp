<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title>公告管理</title>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
</head>
<body>
<div class="index-nav">
    <div class="index-nav-frame clearfix">
        <div class="nav-line"></div>
        <div class="nav-small" tabindex="-1">
            <div class="nav-small-focus" tabindex="-1">
            </div>
            <img src="img/icon.png"/>
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
            <a class="btn btn-grad btn-info btn-sm" href="notice_list.html">公告管理</a>
        </div>

        <div class="index-nav-frame-line" style="float: right;" tabindex="-1">
            <a href="AuthServlet?action=logout" class="btn btn-grad btn-info btn-sm">退出</a>
        </div>
        <div class="index-nav-frame-line" style="float: right;color: #000000;width: 200px">
            欢迎：<a>${loginUser.username}</a>
        </div>
    </div>
</div>
</div>
</div>
<div class="index-content">
    <div class="index-content-operation">
        <a class="info-detail">公告管理</a>
        <br>
        <br>
    </div>
    <br>
    <div class="index-content-operation">
        <button class="btn btn-grad btn-primary btn-sm"  onclick="window.location.href='notice_add.html'">添加</button>
        <div class="index-content-operation-search"><input id="search_keyword" placeholder="标题" type="text" name="search_keyword"/><input type="hidden" id="searchColumn" name="searchColumn" value="notice_name"/><button class="btn btn-grad btn-info btn-sm" onclick="searchList()">搜索</button></div>
    </div>
    <br>
    <table class="table table-striped table-hover table-bordered">
        <thead>
        <tr class="index-content-table-th">
            <th>标题</th>
            <th>内容</th>
            <th>类型</th>
            <th>创建时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="vo">
            <tr class="index-content-table-td">
                <td>111</td>
                <td title="${vo.noticeText}">
                    <c:choose>
                        <c:when test="${fn:length(vo.noticeText) > 19}">
                            <c:out value="${fn:substring(vo.noticeText, 0, 19)}..."/>
                        </c:when>
                        <c:otherwise>
                            <c:out value="${vo.noticeText}"/>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>111</td>
                <td>111</td>
                <td>
                    <button class="btn btn-grad btn-danger btn-sm" style="padding: 0px 1px;" onclick="window.location.href='notice_info.html'">详情</button>&nbsp;
                    <button class="btn btn-grad btn-danger btn-sm" style="padding: 0px 1px;"  onclick="window.location.href='notice_edit.html'">编辑</button>&nbsp;
                    <button class="btn btn-grad btn-danger btn-sm" style="padding: 0px 1px;" onclick="if(window.confirm('将要删除：${vo.immigrationName}？'))window.location.href='ImmigrationServlet?action=delete&id=${vo.id}'">删除</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div style="float: right;padding-right: 10px;color: #515151;"><jsp:include page="split.jsp"/></div>
</div>
</body>
<script>
    function searchList() {
        window.location.href = "NoticeServlet?action=list&searchColumn="+document.getElementById("searchColumn").value+"&keyword=" + document.getElementById("search_keyword").value;
    }
</script>
</html>