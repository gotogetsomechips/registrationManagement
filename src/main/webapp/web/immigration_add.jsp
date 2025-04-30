<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>添加迁入</title>
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
</div>
</div>
<div class="index-content">
    <div class="index-content-operation">
        <a class="info-detail">添加迁入</a>
        <br>
        <br>
    </div>
    <br>
    <form action="ImmigrationServlet?action=add" method="post" onsubmit="return check()">
        <table class="index-content-table-add">
            <tr>
                <td width="12%">姓名：</td><td><input class="index-content-table-td-add" type="text" id="immigrationName" name="immigrationName" value=""/></td>
            </tr>
            <tr>
                <td width="12%">迁入编号：</td><td><input class="index-content-table-td-add" type="text" id="immigrationNo" name="immigrationNo" value=""/></td>
            </tr>
            <tr>
                <td width="12%">迁入时间：</td><td><input class="index-content-table-td-add" type="text" id="immigrationTime" name="immigrationTime" value=""/></td>
            </tr>
            <tr>
                <td width="12%">备注：</td><td><textarea id="immigrationText" name="immigrationText" style="width: 60%; height: 100px;padding: 0px 17px;" placeholder="请输入内容......"></textarea></td>
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
    //提交之前进行检查，如果return false，则不允许提交
    function check() {
        //根据ID获取值
        if (document.getElementById("immigrationName").value.trim().length == 0) {
            alert("姓名不能为空!");
            return false;
        }
        if (document.getElementById("immigrationNo").value.trim().length == 0) {
            alert("迁入编号不能为空!");
            return false;
        }
        if (document.getElementById("immigrationTime").value.trim().length == 0) {
            alert("迁入时间不能为空!");
            return false;
        }
        return true;
    }
</script>
</html>