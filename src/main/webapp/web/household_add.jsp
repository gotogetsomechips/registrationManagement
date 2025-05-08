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
    <!-- 导航部分保持不变，与原来相同 -->
</div>
<div class="index-content">
    <div class="index-content-operation">
        <a class="info-detail">添加户籍</a>
        <br>
        <br>
    </div>
    <br>
    <form action="/registrationManagementSystem_war/household/add" method="post" onsubmit="return check()" id="householdForm">
        <table class="index-content-table-add">
            <tr>
                <td width="12%">姓名：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="householdName" name="householdName" value=""/>
                    <div id="householdNameError" class="error-message"></div>
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
                    <div id="phoneError" class="error-message"></div>
                </td>
            </tr>
            <tr>
                <td width="12%">所在区：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="district" name="district" value=""/>
                    <div id="districtError" class="error-message"></div>
                </td>
            </tr>
            <tr>
                <td width="12%">房屋号：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="houseNumber" name="houseNumber" value=""/>
                    <div id="houseNumberError" class="error-message"></div>
                </td>
            </tr>
            <tr>
                <td width="12%">单元：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="unit" name="unit" value=""/>
                    <div id="unitError" class="error-message"></div>
                </td>
            </tr>
            <tr>
                <td width="12%">户型：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="houseType" name="houseType" value=""/>
                    <div id="houseTypeError" class="error-message"></div>
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
    $(document).ready(function() {
        <c:if test="${not empty error}">
        alert("${error}");
        </c:if>
        <c:if test="${not empty success}">
        alert("${success}");
        </c:if>

        // 绑定输入框的blur事件进行异步校验
        $("#householdName").blur(function() {
            validateHouseholdName();
        });

        $("#phone").blur(function() {
            validatePhone();
        });

        $("#district").blur(function() {
            validateDistrict();
        });

        $("#houseNumber").blur(function() {
            validateHouseNumber();
        });

        $("#unit").blur(function() {
            validateUnit();
        });

        $("#houseType").blur(function() {
            validateHouseType();
        });
    });

    // 验证姓名
    function validateHouseholdName() {
        const householdName = $("#householdName").val().trim();
        const errorElement = $("#householdNameError");

        if (householdName.length === 0) {
            showError(errorElement, "姓名不能为空!");
            return false;
        }

        // 异步检查姓名是否已存在
        $.ajax({
            url: "/registrationManagementSystem_war/household/checkNameExists",
            type: "POST",
            data: { householdName: householdName },
            success: function(response) {
                if (response === "true") {
                    showError(errorElement, "该姓名已存在!");
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

    // 验证电话
    function validatePhone() {
        const phone = $("#phone").val().trim();
        const errorElement = $("#phoneError");

        if (phone.length === 0) {
            showError(errorElement, "电话不能为空!");
            return false;
        }

        // 验证手机号格式
        const phoneRegex = /^1[3-9]\d{9}$/;
        if (!phoneRegex.test(phone)) {
            showError(errorElement, "请输入有效的11位手机号码!");
            return false;
        }

        showSuccess(errorElement, "手机号码格式正确");
        return true;
    }

    // 验证所在区
    function validateDistrict() {
        const district = $("#district").val().trim();
        const errorElement = $("#districtError");

        if (district.length === 0) {
            showError(errorElement, "所在区不能为空!");
            return false;
        }

        showSuccess(errorElement, "所在区有效");
        return true;
    }

    // 验证房屋号
    function validateHouseNumber() {
        const houseNumber = $("#houseNumber").val().trim();
        const errorElement = $("#houseNumberError");

        if (houseNumber.length === 0) {
            showError(errorElement, "房屋号不能为空!");
            return false;
        }

        showSuccess(errorElement, "房屋号有效");
        return true;
    }

    // 验证单元
    function validateUnit() {
        const unit = $("#unit").val().trim();
        const errorElement = $("#unitError");

        if (unit.length === 0) {
            showError(errorElement, "单元不能为空!");
            return false;
        }

        showSuccess(errorElement, "单元有效");
        return true;
    }

    // 验证户型
    function validateHouseType() {
        const houseType = $("#houseType").val().trim();
        const errorElement = $("#houseTypeError");

        if (houseType.length === 0) {
            showError(errorElement, "户型不能为空!");
            return false;
        }

        showSuccess(errorElement, "户型有效");
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

    // 提交前检查
    function check() {
        let isValid = true;

        if (!validateHouseholdName()) isValid = false;
        if (!validatePhone()) isValid = false;
        if (!validateDistrict()) isValid = false;
        if (!validateHouseNumber()) isValid = false;
        if (!validateUnit()) isValid = false;
        if (!validateHouseType()) isValid = false;

        return isValid;
    }
</script>
</html>