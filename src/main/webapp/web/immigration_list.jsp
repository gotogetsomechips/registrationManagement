<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>迁入管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css"/>
    <style>
        .name-sortable {
            cursor: pointer;
            position: relative;
            padding-right: 20px;
            color: #1890ff;
        }
        .name-sortable:hover {
            text-decoration: underline;
        }
        .name-sortable.asc:after {
            content: "↑";
            position: absolute;
            right: 5px;
        }
        .name-sortable.desc:after {
            content: "↓";
            position: absolute;
            right: 5px;
        }
    </style>
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
            <a class="btn btn-grad btn-info btn-sm" href="../feedback/list">反馈管理</a>
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
        <a class="info-detail">迁入管理</a>
        <br>
        <br>
    </div>
    <br>
    <div class="index-content-operation">
        <button class="btn btn-grad btn-primary btn-sm" onclick="window.location.href='toAdd'">添加</button>
        <div class="index-content-operation-search">
            <input id="search_keyword" placeholder="姓名" type="text" name="search_keyword" value="${keyword}"/>
            <input type="hidden" id="searchColumn" name="searchColumn" value="immigration_name"/>
            <input type="hidden" id="sortField" name="sortField" value="${param.sortField}"/>
            <input type="hidden" id="sortDirection" name="sortDirection" value="${param.sortDirection}"/>
            <button class="btn btn-grad btn-info btn-sm" onclick="searchList()">搜索</button>
        </div>
    </div>
    <br>
    <c:if test="${empty list}">
        <div class="no-data" style="text-align: center; padding: 20px; color: #666;">
            没有找到符合条件的迁入记录
        </div>
    </c:if>
    <c:if test="${not empty list}">
        <table class="table table-striped table-hover table-bordered">
            <thead>
            <tr class="index-content-table-th">
                <th class="name-sortable ${param.sortField == 'immigration_name' ? param.sortDirection : ''}" onclick="sortByName()">姓名</th>
                <th>迁入编号</th>
                <th>迁入时间</th>
                <th>备注</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="vo">
                <tr class="index-content-table-td">
                    <td>${vo.immigrationName}</td>
                    <td>${vo.immigrationNumber}</td>
                    <td><fmt:formatDate value="${vo.immigrationDate}" pattern="yyyy年MM月dd日"/></td>
                    <td title="${vo.immigrationText}">
                        <c:choose>
                            <c:when test="${fn:length(vo.immigrationText) > 19}">
                                <c:out value="${fn:substring(vo.immigrationText, 0, 19)}..."/>
                            </c:when>
                            <c:otherwise>
                                <c:out value="${vo.immigrationText}"/>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <button class="btn btn-grad btn-danger btn-sm" style="padding: 0px 1px;"
                                onclick="window.location.href='info?id=${vo.id}'">详情</button>&nbsp;
                        <button class="btn btn-grad btn-danger btn-sm" style="padding: 0px 1px;"
                                onclick="window.location.href='toEdit?id=${vo.id}&pageNum=${pageNum}'">编辑</button>&nbsp;
                        <button class="btn btn-grad btn-danger btn-sm" style="padding: 0px 1px;"
                                onclick="confirmDelete(${vo.id}, '${vo.immigrationName}')">删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <!-- 分页控件 -->
        <div class="pagination">
            <c:choose>
                <c:when test="${pageNum == 1}">
                    <span class="disabled">首页</span>
                    <span class="disabled">上一页</span>
                </c:when>
                <c:otherwise>
                    <a href="javascript:void(0)" onclick="goToPage(1)">首页</a>
                    <a href="javascript:void(0)" onclick="goToPage(${pageNum - 1})">上一页</a>
                </c:otherwise>
            </c:choose>

            <!-- 页码链接 -->
            <c:set var="startPage" value="${(pageNum - 2 > 1) ? pageNum - 2 : 1}" />
            <c:set var="endPage" value="${(startPage + 4 < totalPages) ? startPage + 4 : totalPages}" />
            <c:set var="startPage" value="${(endPage - 4 > 1) ? endPage - 4 : 1}" />

            <c:forEach begin="${startPage}" end="${endPage}" var="i">
                <c:choose>
                    <c:when test="${i == pageNum}">
                        <span class="active">${i}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:void(0)" onclick="goToPage(${i})">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:choose>
                <c:when test="${pageNum == totalPages}">
                    <span class="disabled">下一页</span>
                    <span class="disabled">尾页</span>
                </c:when>
                <c:otherwise>
                    <a href="javascript:void(0)" onclick="goToPage(${pageNum + 1})">下一页</a>
                    <a href="javascript:void(0)" onclick="goToPage(${totalPages})">尾页</a>
                </c:otherwise>
            </c:choose>

            &nbsp;&nbsp;
            跳转到：<input type="number" id="jumpPageNum" min="1" max="${totalPages}" value="${pageNum}">
            <button onclick="jumpToPage()">跳转</button>
            &nbsp;&nbsp;
            共 ${totalCount} 条记录，每页 10 条，共 ${totalPages} 页
        </div>
    </c:if>
</div>
</body>
<script>
    // 初始化排序状态，从URL参数获取
    var currentSort = {
        field: "${param.sortField}" || null,
        direction: "${param.sortDirection}" || 'asc'
    };

    // 页面加载时设置排序指示器
    $(document).ready(function() {
        if (currentSort.field) {
            updateSortIndicator(currentSort.field);
        }

        // 处理操作消息
        const urlParams = new URLSearchParams(window.location.search);
        const message = urlParams.get('message');

        if (message) {
            switch(message) {
                case 'add_success':
                    alert('迁入记录添加成功！');
                    break;
                case 'edit_success':
                    alert('迁入记录修改成功！');
                    break;
                case 'delete_success':
                    alert('迁入记录删除成功！');
                    break;
                case 'delete_fail':
                    alert('迁入记录删除失败！');
                    break;
            }

            // 移除message参数避免重复提示
            const newUrl = window.location.pathname +
                window.location.search.replace(/[?&]message=[^&]*/, '').replace(/^&/, '?');
            window.history.replaceState({}, document.title, newUrl);
        }
    });

    function searchList() {
        var url = "list?searchColumn=" + document.getElementById("searchColumn").value +
            "&keyword=" + document.getElementById("search_keyword").value;

        // 添加排序条件
        if (currentSort.field) {
            url += "&sortField=" + currentSort.field + "&sortDirection=" + currentSort.direction;
        }

        window.location.href = url;
    }

    function confirmDelete(id, name) {
        if (confirm('确定要删除迁入记录：' + name + '吗？')) {
            window.location.href = 'delete?id=' + id + '&pageNum=${pageNum}';
        }
    }

    // 姓名排序函数
    function sortByName() {
        sortTable('immigration_name');
    }

    // 通用表格排序函数
    function sortTable(field) {
        // 确定排序方向
        if (currentSort.field === field) {
            currentSort.direction = currentSort.direction === 'asc' ? 'desc' : 'asc';
        } else {
            currentSort.field = field;
            currentSort.direction = 'asc';
        }

        // 更新排序指示器
        updateSortIndicator(field);

        // 同时进行前端排序
        var $table = $('table');
        var $rows = $table.find('tbody tr').get();

        // 排序行
        $rows.sort(function(a, b) {
            var aVal = $(a).find('td').eq(getFieldIndex(field)).text().toLowerCase();
            var bVal = $(b).find('td').eq(getFieldIndex(field)).text().toLowerCase();

            if (currentSort.direction === 'asc') {
                return aVal.localeCompare(bVal);
            } else {
                return bVal.localeCompare(aVal);
            }
        });

        // 更新表格
        $.each($rows, function(index, row) {
            $table.find('tbody').append(row);
        });

        // 保存当前排序状态到隐藏字段
        document.getElementById("sortField").value = currentSort.field;
        document.getElementById("sortDirection").value = currentSort.direction;
    }

    // 获取字段在表格中的索引
    function getFieldIndex(field) {
        var headers = $('table thead th');
        for (var i = 0; i < headers.length; i++) {
            if ($(headers[i]).hasClass('name-sortable') && field === 'immigration_name') {
                return i;
            }
        }
        return 0;
    }

    // 更新排序指示器
    function updateSortIndicator(field) {
        $('.name-sortable').removeClass('asc desc');
        if (currentSort.field === field) {
            $('.name-sortable').addClass(currentSort.direction);
        }
    }

    // 分页跳转函数 - 修改以保持排序状态
    function goToPage(pageNum) {
        var url = "list?pageNum=" + pageNum;

        // 添加搜索条件（如果有）
        var searchColumn = document.getElementById("searchColumn").value;
        var keyword = document.getElementById("search_keyword").value;
        if (searchColumn && keyword) {
            url += "&searchColumn=" + searchColumn + "&keyword=" + keyword;
        }

        // 添加排序条件（使用隐藏字段中保存的最新排序状态）
        var sortField = document.getElementById("sortField").value;
        var sortDirection = document.getElementById("sortDirection").value;
        if (sortField) {
            url += "&sortField=" + sortField + "&sortDirection=" + sortDirection;
        }

        window.location.href = url;
    }

    // 跳转页面验证 - 修改以保持排序状态
    function jumpToPage() {
        var pageNum = document.getElementById("jumpPageNum").value;
        var totalPages = ${totalPages};

        // 验证输入的页码是否在合理范围内
        if (pageNum < 1 || pageNum > totalPages) {
            alert("请输入1到" + totalPages + "之间的页码！");
            document.getElementById("jumpPageNum").value = ${pageNum};
            return;
        }

        goToPage(pageNum);
    }
</script>
</html>