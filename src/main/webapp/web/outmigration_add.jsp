<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>添加迁出</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css"/>
    <!-- 引入jQuery和日期选择器 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/zh.js"></script>
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
        <a class="info-detail">添加迁出</a>
        <br>
        <br>
    </div>
    <br>
    <form action="${pageContext.request.contextPath}/outmigration/add" method="post" onsubmit="return check()" id="outmigrationForm">
        <table class="index-content-table-add">
            <tr>
                <td width="12%">姓名：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="name" name="name" value=""/>
                    <div id="nameError" class="error-message"></div>
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
                <td width="12%">迁出金额：</td>
                <td>
                    <input class="index-content-table-td-add" type="number" id="amount" name="amount" value=""/>
                    <div id="amountError" class="error-message"></div>
                </td>
            </tr>
            <tr>
                <td width="12%">缴费方式：</td>
                <td>
                    <select class="index-content-table-td-add" id="paymentMethod" name="paymentMethod">
                        <option value="">请选择缴费方式</option>
                        <option value="现金">现金</option>
                        <option value="微信">微信</option>
                        <option value="支付宝">支付宝</option>
                        <option value="银行卡">银行卡</option>
                    </select>
                    <div id="paymentMethodError" class="error-message"></div>
                </td>
            </tr>
            <tr>
                <td width="12%">收费人员：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="collector" name="collector" value=""/>
                    <div id="collectorError" class="error-message"></div>
                </td>
            </tr>
            <tr>
                <td width="12%">迁出时间：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="outTime" name="outTime" value="" readonly/>
                    <div id="outTimeError" class="error-message"></div>
                </td>
            </tr>
            <tr>
                <td width="12%">备注：</td>
                <td>
                    <textarea id="remarks" name="remarks" style="width: 60%; height: 100px;padding: 0px 17px;" placeholder="请输入内容......"></textarea>
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
        <c:if test="${not empty operationMessage}">
        alert("${operationMessage}");
        </c:if>

        // 初始化日期选择器
        flatpickr("#outTime", {
            locale: "zh",
            dateFormat: "Y-m-d",
            defaultDate: new Date(),
            maxDate: new Date()
        });

        // 绑定输入框的blur事件进行异步校验
        $("#name").blur(function() {
            validateName();
        });

        $("#amount").blur(function() {
            validateAmount();
        });

        $("#paymentMethod").blur(function() {
            validatePaymentMethod();
        });

        $("#collector").blur(function() {
            validateCollector();
        });

        $("#outTime").blur(function() {
            validateOutTime();
        });
    });

    // 验证姓名
    function validateName() {
        const name = $("#name").val().trim();
        const errorElement = $("#nameError");

        if (name.length === 0) {
            showError(errorElement, "姓名不能为空!");
            return false;
        }

        // 异步检查姓名是否已存在
        $.ajax({
            url: "${pageContext.request.contextPath}/outmigration/checkName",
            type: "POST",
            data: { name: name },
            success: function(response) {
                if (response.exists) {
                    showError(errorElement, "该姓名已存在，请使用其他姓名!");
                } else {
                    showSuccess(errorElement, "姓名可用");
                }
            },
            error: function() {
                showError(errorElement, "验证失败，请稍后重试");
            }
        });

        return true;
    }

    // 验证金额
    function validateAmount() {
        const amount = $("#amount").val().trim();
        const errorElement = $("#amountError");

        if (amount.length === 0) {
            showError(errorElement, "迁出金额不能为空!");
            return false;
        }

        if (parseFloat(amount) <= 0) {
            showError(errorElement, "迁出金额必须大于0!");
            return false;
        }

        showSuccess(errorElement, "金额有效");
        return true;
    }

    // 验证缴费方式
    function validatePaymentMethod() {
        const paymentMethod = $("#paymentMethod").val();
        const errorElement = $("#paymentMethodError");

        if (!paymentMethod) {
            showError(errorElement, "请选择缴费方式!");
            return false;
        }

        showSuccess(errorElement, "缴费方式有效");
        return true;
    }

    // 验证收费人员
    function validateCollector() {
        const collector = $("#collector").val().trim();
        const errorElement = $("#collectorError");

        if (collector.length === 0) {
            showError(errorElement, "收费人员不能为空!");
            return false;
        }

        showSuccess(errorElement, "收费人员有效");
        return true;
    }

    // 验证迁出时间
    function validateOutTime() {
        const outTime = $("#outTime").val().trim();
        const errorElement = $("#outTimeError");

        if (outTime.length === 0) {
            showError(errorElement, "迁出时间不能为空!");
            return false;
        }

        showSuccess(errorElement, "迁出时间有效");
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

        // 验证姓名
        if (!validateName()) {
            isValid = false;
        }

        // 验证金额
        if (!validateAmount()) {
            isValid = false;
        }

        // 验证缴费方式
        if (!validatePaymentMethod()) {
            isValid = false;
        }

        // 验证收费人员
        if (!validateCollector()) {
            isValid = false;
        }

        // 验证迁出时间
        if (!validateOutTime()) {
            isValid = false;
        }

        return isValid;
    }
</script>
</html>