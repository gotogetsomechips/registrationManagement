<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>修改迁入</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/zh.js"></script>
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
        <a class="info-detail">修改迁入</a>
        <br>
        <br>
    </div>
    <br>
    <form action="/registrationManagementSystem_war/immigration/edit" method="post" onsubmit="return check()">
        <input type="hidden" id="id" name="id" value="${vo.id}"/>
        <input type="hidden" id="createBy" name="createBy" value="${vo.createBy}"/>
        <!-- 存储原始数据，用于检查是否有修改 -->
        <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}"/>
        <input type="hidden" id="originalImmigrationName" value="${vo.immigrationName}"/>
        <input type="hidden" id="originalImmigrationNumber" value="${vo.immigrationNumber}"/>
        <input type="hidden" id="originalImmigrationDate" value="<fmt:formatDate value='${vo.immigrationDate}' pattern='yyyy-MM-dd'/>"/>
        <input type="hidden" id="originalImmigrationText" value="${vo.immigrationText}"/>

        <table class="index-content-table-add">
            <tr>
                <td width="12%">姓名：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="immigrationName" name="immigrationName" value="${vo.immigrationName}"/>
                </td>
            </tr>
            <tr>
                <td width="12%">迁入编号：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="immigrationNumber" name="immigrationNumber" value="${vo.immigrationNumber}"/>
                </td>
            </tr>
            <tr>
                <td width="12%">迁入时间：</td>
                <td>
                    <input class="index-content-table-td-add" type="text" id="immigrationDate" name="immigrationDate"
                           value="<fmt:formatDate value='${vo.immigrationDate}' pattern='yyyy-MM-dd'/>"/>
                </td>
            </tr>
            <tr>
                <td width="12%">备注：</td>
                <td>
                    <textarea id="immigrationText" name="immigrationText" style="width: 60%; height: 100px;padding: 0px 17px;" placeholder="请输入内容......">${vo.immigrationText}</textarea>
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

        // 初始化日期选择器
        flatpickr("#immigrationDate", {
            dateFormat: "Y-m-d",
            locale: "zh",
            allowInput: true
        });
    });

    //提交之前进行检查，如果return false，则不允许提交
    function check() {
        // 姓名验证
        if (document.getElementById("immigrationName").value.trim().length == 0) {
            alert("姓名不能为空!");
            return false;
        }

        // 迁入编号验证
        if (document.getElementById("immigrationNumber").value.trim().length == 0) {
            alert("迁入编号不能为空!");
            return false;
        }

        // 迁入日期验证
        if (document.getElementById("immigrationDate").value.trim().length == 0) {
            alert("迁入时间不能为空!");
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
        const immigrationName = document.getElementById("immigrationName").value.trim();
        const immigrationNumber = document.getElementById("immigrationNumber").value.trim();
        const immigrationDate = document.getElementById("immigrationDate").value.trim();
        const immigrationText = document.getElementById("immigrationText").value;

        // 获取原始值
        const originalImmigrationName = document.getElementById("originalImmigrationName").value;
        const originalImmigrationNumber = document.getElementById("originalImmigrationNumber").value;
        const originalImmigrationDate = document.getElementById("originalImmigrationDate").value;
        const originalImmigrationText = document.getElementById("originalImmigrationText").value;

        // 检查是否有任何字段被修改
        return (
            immigrationName !== originalImmigrationName ||
            immigrationNumber !== originalImmigrationNumber ||
            immigrationDate !== originalImmigrationDate ||
            immigrationText !== originalImmigrationText
        );
    }
</script>
</html>