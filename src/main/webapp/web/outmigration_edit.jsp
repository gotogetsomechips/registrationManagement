<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>修改迁出</title>
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
        <a class="info-detail">修改迁出</a>
        <br>
        <br>
    </div>
    <br>
    <form action="OutmigrationServlet?action=edit" method="post" onsubmit="return check()">
        <input type="hidden" id="id" name="id" value="${vo.id}"/><input type="hidden" id="createBy" name="createBy" value="${vo.createBy}"/>
        <table class="index-content-table-add">
            <tr>
                <td width="12%">姓名：</td><td><input class="index-content-table-td-add" type="text" id="outmigrationName" name="outmigrationName" value="张三"/></td>
            </tr>
            <tr>
                <td width="12%">性别：</td>
                <td>
                    <input name="outmigrationSex" type="radio" value="男" ${vo.outmigrationSex=='男'?'checked':''}/>&nbsp;&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="outmigrationSex" type="radio" value="女" ${vo.outmigrationSex=='女'?'checked':''}/>&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td width="12%">迁出金额：</td><td><input class="index-content-table-td-add" type="text" id="outmigrationPrice" name="outmigrationPrice" value="200"/></td>
            </tr>
            <tr>
                <td width="12%">缴费方式：</td><td><input class="index-content-table-td-add" type="text" id="outmigrationPayway" name="outmigrationPayway" value="现金"/></td>
            </tr>
            <tr>
                <td width="12%">收费人员：</td><td><input class="index-content-table-td-add" type="text" id="outmigrationHandler" name="outmigrationHandler" value="李四"/></td>
            </tr>
            <tr>
                <td width="12%">迁出时间：</td><td><input class="index-content-table-td-add" type="text" id="outmigrationTime" name="outmigrationTime" value="2022-12-7"/></td>
            </tr>
            <tr>
                <td width="12%">备注：</td><td><textarea id="immigrationText" name="immigrationText" style="width: 60%; height: 100px;padding: 0px 17px;" placeholder="请输入内容......">${vo.immigrationText}</textarea></td>
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
        if (document.getElementById("outmigrationName").value.trim().length == 0) {
            alert("姓名不能为空!");
            return false;
        }
        if (document.getElementById("outmigrationPrice").value.trim().length == 0) {
            alert("迁出金额不能为空!");
            return false;
        }
        if (document.getElementById("outmigrationPayway").value.trim().length == 0) {
            alert("缴费方式不能为空!");
            return false;
        }
        if (document.getElementById("outmigrationHandler").value.trim().length == 0) {
            alert("收费人员不能为空!");
            return false;
        }
        if (document.getElementById("outmigrationTime").value.trim().length == 0) {
            alert("迁出时间不能为空!");
            return false;
        }
        return true;
    }
</script>
</html>