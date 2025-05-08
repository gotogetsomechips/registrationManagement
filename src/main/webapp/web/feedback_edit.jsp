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
    <form action="/registrationManagementSystem_war/feedback/edit" method="post" onsubmit="return check()" id="feedbackForm">
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
                    <div id="feedbackNameError" class="error-message"></div>
                </td>
            </tr>
            <tr>
                <td width="12%">电话：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="feedbackPhone" name="feedbackPhone" value="${vo.feedbackPhone}"/>
                    <div id="feedbackPhoneError" class="error-message"></div>
                </td>
            </tr>
            <tr>
                <td width="12%">标题：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="feedbackTitle" name="feedbackTitle" value="${vo.feedbackTitle}"/>
                    <div id="feedbackTitleError" class="error-message"></div>
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

        // 绑定输入框的blur事件进行异步校验
        $("#feedbackName").blur(function() {
            validateFeedbackName();
        });

        $("#feedbackPhone").blur(function() {
            validateFeedbackPhone();
        });

        $("#feedbackTitle").blur(function() {
            validateFeedbackTitle();
        });
    });

    // 验证反馈人姓名
    function validateFeedbackName() {
        const feedbackName = $("#feedbackName").val().trim();
        const errorElement = $("#feedbackNameError");
        const id = $("#id").val();

        if (feedbackName.length === 0) {
            showError(errorElement, "反馈人不能为空!");
            return false;
        }

        // 异步检查反馈人是否已存在（排除当前记录）
        $.ajax({
            url: "/registrationManagementSystem_war/feedback/checkNameExcludeId",
            type: "POST",
            data: {
                feedbackName: feedbackName,
                id: id
            },
            success: function(response) {
                if (response.exists) {
                    showError(errorElement, "反馈人姓名已存在!");
                } else {
                    showSuccess(errorElement, "反馈人姓名可用");
                }
            },
            error: function() {
                showError(errorElement, "验证失败，请稍后重试");
            }
        });

        return true;
    }

    // 验证电话
    function validateFeedbackPhone() {
        const phone = $("#feedbackPhone").val().trim();
        const errorElement = $("#feedbackPhoneError");

        if (phone.length === 0) {
            showError(errorElement, "电话不能为空!");
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

    // 验证标题
    function validateFeedbackTitle() {
        const feedbackTitle = $("#feedbackTitle").val().trim();
        const errorElement = $("#feedbackTitleError");

        if (feedbackTitle.length === 0) {
            showError(errorElement, "标题不能为空!");
            return false;
        }

        showSuccess(errorElement, "标题有效");
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

        // 验证反馈人
        if (!validateFeedbackName()) {
            isValid = false;
        }

        // 验证电话
        if (!validateFeedbackPhone()) {
            isValid = false;
        }

        // 验证标题
        if (!validateFeedbackTitle()) {
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
        const feedbackName = $("#feedbackName").val().trim();
        const feedbackPhone = $("#feedbackPhone").val().trim();
        const feedbackTitle = $("#feedbackTitle").val().trim();
        const feedbackText = $("#feedbackText").val();

        // 获取原始值
        const originalFeedbackName = $("#originalFeedbackName").val();
        const originalFeedbackPhone = $("#originalFeedbackPhone").val();
        const originalFeedbackTitle = $("#originalFeedbackTitle").val();
        const originalFeedbackText = $("#originalFeedbackText").val();

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