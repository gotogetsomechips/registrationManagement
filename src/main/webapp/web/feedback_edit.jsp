<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>修改反馈</title>
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
            <a class="btn btn-grad btn-info btn-sm" href="list">反馈管理</a>
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
        <a class="info-detail">修改反馈</a>
        <br>
        <br>
    </div>
    <br>
    <form action="/registrationManagementSystem_war/feedback/edit" method="post" onsubmit="return check()">
        <input type="hidden" id="id" name="id" value="${vo.id}"/>
        <!-- 存储原始数据，用于检查是否有修改 -->
        <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"/>
        <input type="hidden" id="originalFeedbackName" value="${vo.feedbackName}"/>
        <input type="hidden" id="originalFeedbackPhone" value="${vo.feedbackPhone}"/>
        <input type="hidden" id="originalFeedbackTitle" value="${vo.feedbackTitle}"/>
        <input type="hidden" id="originalFeedbackText" value="${vo.feedbackText}"/>
        <input type="hidden" id="originalStatus" value="${vo.status}"/>

        <table class="index-content-table-add">
            <tr>
                <td width="12%">反馈人：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="feedbackName" name="feedbackName" value="${vo.feedbackName}"/>
                </td>
            </tr>
            <tr>
                <td width="12%">电话：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="feedbackPhone" name="feedbackPhone" value="${vo.feedbackPhone}"/>
                </td>
            </tr>
            <tr>
                <td width="12%">标题：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="feedbackTitle" name="feedbackTitle" value="${vo.feedbackTitle}"/>
                </td>
            </tr>
            <tr>
                <td width="12%">内容：</td>
                <td>
                    <textarea id="feedbackText" name="feedbackText" style="width: 60%; height: 100px;padding: 0px 17px;" placeholder="请输入内容......">${vo.feedbackText}</textarea>
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
        // 反馈人验证
        if (document.getElementById("feedbackName").value.trim().length == 0) {
            alert("反馈人不能为空!");
            return false;
        }

        // 电话验证
        const phone = document.getElementById("feedbackPhone").value.trim();
        if (phone.length == 0) {
            alert("电话不能为空!");
            return false;
        }

        // 验证手机号格式 (中国大陆11位手机号)
        const phoneRegex = /^1[3-9]\d{9}$/;
        if (!phoneRegex.test(phone)) {
            alert("请输入有效的11位手机号码!");
            return false;
        }

        // 标题验证
        if (document.getElementById("feedbackTitle").value.trim().length == 0) {
            alert("标题不能为空!");
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
        const feedbackName = document.getElementById("feedbackName").value.trim();
        const feedbackPhone = document.getElementById("feedbackPhone").value.trim();
        const feedbackTitle = document.getElementById("feedbackTitle").value.trim();
        const feedbackText = document.getElementById("feedbackText").value;

        // 获取原始值
        const originalFeedbackName = document.getElementById("originalFeedbackName").value;
        const originalFeedbackPhone = document.getElementById("originalFeedbackPhone").value;
        const originalFeedbackTitle = document.getElementById("originalFeedbackTitle").value;
        const originalFeedbackText = document.getElementById("originalFeedbackText").value;

        // 检查是否有任何字段被修改
        return (
            feedbackName !== originalFeedbackName ||
            feedbackPhone !== originalFeedbackPhone ||
            feedbackTitle !== originalFeedbackTitle ||
            feedbackText !== originalFeedbackText
        );
    }
</script>
</html>