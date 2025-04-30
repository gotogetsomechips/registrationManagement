<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>添加户籍</title>
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
        <a class="info-detail">添加户籍</a>
        <br>
        <br>
    </div>
    <br>
    <form action="HouseholdServlet?action=add" method="post" onsubmit="return check()">
        <table class="index-content-table-add">
            <tr>
                <td width="12%">姓名：</td><td><input class="index-content-table-td-add" type="text" id="householdName" name="householdName" value=""/></td>
            </tr>
            <tr>
                <td width="12%">性别：</td>
                <td>
                    <input name="householdSex" type="radio" value="男" checked="checked"/>&nbsp;&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="householdSex" type="radio" value="女"/>&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td width="12%">电话：</td><td><input class="index-content-table-td-add" type="text" id="householdPhone" name="householdPhone" value=""/></td>
            </tr>
            <tr>
                <td width="12%">所在区：</td><td><input class="index-content-table-td-add" type="text" id="householdArea" name="householdArea" value=""/></td>
            </tr>
            <tr>
                <td width="12%">房屋号：</td><td><input class="index-content-table-td-add" type="text" id="householdHouseno" name="householdHouseno" value=""/></td>
            </tr>
            <tr>
                <td width="12%">单元：</td><td><input class="index-content-table-td-add" type="text" id="householdUnit" name="householdUnit" value=""/></td>
            </tr>
            <tr>
                <td width="12%">户型：</td><td><input class="index-content-table-td-add" type="text" id="householdStyle" name="householdStyle" value=""/></td>
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
        if (document.getElementById("householdName").value.trim().length == 0) {
            alert("姓名不能为空!");
            return false;
        }
        if (document.getElementById("householdPhone").value.trim().length == 0) {
            alert("电话不能为空!");
            return false;
        }
        if (document.getElementById("householdArea").value.trim().length == 0) {
            alert("所在区不能为空!");
            return false;
        }
        if (document.getElementById("householdHouseno").value.trim().length == 0) {
            alert("房屋号不能为空!");
            return false;
        }
        if (document.getElementById("householdUnit").value.trim().length == 0) {
            alert("单元不能为空!");
            return false;
        }
        if (document.getElementById("householdStyle").value.trim().length == 0) {
            alert("户型不能为空!");
            return false;
        }
        return true;
    }
</script>
</html>