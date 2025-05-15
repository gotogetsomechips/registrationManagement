<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>迁出管理</title>
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
        <a class="info-detail">迁出管理</a>
        <br>
        <br>
    </div>
    <br>
    <div class="index-content-operation">
        <button class="btn btn-grad btn-primary btn-sm" onclick="window.location.href='toAdd'">添加</button>
        <div class="index-content-operation-search">
            <input id="search_keyword" placeholder="姓名" type="text" name="search_keyword" value="${keyword}"/>
            <input type="hidden" id="searchColumn" name="searchColumn" value="name"/>

            <input type="hidden" id="sortField" name="sortField" value="${param.sortField}"/>
            <input type="hidden" id="sortDirection" name="sortDirection" value="${param.sortDirection}"/>
            <button class="btn btn-grad btn-info btn-sm" onclick="searchList()">搜索</button>
        </div>
    </div>
    <br>
    <c:if test="${empty list}">
        <div class="no-data" style="text-align: center; padding: 20px; color: #666;">
            没有找到符合条件的迁出记录
        </div>
    </c:if>
    <c:if test="${not empty list}">
        <table class="table table-striped table-hover table-bordered">
            <thead>
            <tr class="index-content-table-th">
                <th class="name-sortable ${param.sortField == 'name' ? param.sortDirection : ''}"
                    onclick="sortByName()">姓名</th>
                <th>性别</th>
                <th>迁出金额</th>
                <th>缴费方式</th>
                <th>收费人员</th>
                <th>迁出时间</th>
                <th>备注</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="vo">
                <tr class="index-content-table-td">
                    <td>${vo.name}</td>
                    <td>${vo.gender}</td>
                    <td>${vo.amount}</td>
                    <td>${vo.paymentMethod}</td>
                    <td>${vo.collector}</td>
                    <td><fmt:formatDate value="${vo.outTime}" pattern="yyyy-MM-dd"/></td>
                    <td title="${vo.remarks}">
                        <c:choose>
                            <c:when test="${fn:length(vo.remarks) > 19}">
                                <c:out value="${fn:substring(vo.remarks, 0, 19)}..."/>
                            </c:when>
                            <c:otherwise>
                                <c:out value="${vo.remarks}"/>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <button class="btn btn-grad btn-danger btn-sm" style="padding: 0px 1px;"
                                onclick="window.location.href='info?id=${vo.id}'">详情</button>&nbsp;
                        <button class="btn btn-grad btn-danger btn-sm" style="padding: 0px 1px;"
                                onclick="window.location.href='toEdit?id=${vo.id}&pageNum=${pageNum}'">编辑</button>&nbsp;
                        <button class="btn btn-grad btn-danger btn-sm" style="padding: 0px 1px;"
                                onclick="confirmDelete(${vo.id}, '${vo.name}')">删除</button>
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
    // 初始化排序状态
    var currentSort = {
        field: "${param.sortField}" || null,
        direction: "${param.sortDirection}" || 'asc'
    };

    // 页面加载时自动应用排序
    $(document).ready(function() {
        if (currentSort.field) {
            // 延迟执行以确保表格数据已加载
            setTimeout(function() {
                sortTable(currentSort.field, false); // false表示不更新URL
                sortTable(currentSort.field, false);
                updateSortIndicator(currentSort.field);
            }, 100);
        }
    });

    // 页面加载时设置排序指示器
    $(document).ready(function() {
        if (currentSort.field) {
            updateSortIndicator(currentSort.field);
        }
    });

    function searchList() {
        var url = "list?searchColumn=" + document.getElementById("searchColumn").value +
            "&keyword=" + document.getElementById("search_keyword").value;

        // 添加排序条件
        if (currentSort.field) {
            url += "&sortField=" + currentSort.field +
                "&sortDirection=" + currentSort.direction;
        }

        window.location.href = url;
    }
    function confirmDelete(id, name) {
        if (confirm('确定要删除迁出记录：' + name + '吗？')) {
            window.location.href = 'delete?id=' + id + '&pageNum=${pageNum}';
        }
    }

    // 姓名排序函数
    function sortByName() {
        sortTable('name');
    }
    // 通用表格排序函数
    function sortTable(field, updateUrl = true) {
        // 确定排序方向
        if (currentSort.field === field) {
            currentSort.direction = currentSort.direction === 'asc' ? 'desc' : 'asc';
        } else {
            currentSort.field = field;
            currentSort.direction = 'asc';
        }

        // 更新隐藏字段
        document.getElementById("sortField").value = currentSort.field;
        document.getElementById("sortDirection").value = currentSort.direction;
        updateSortIndicator(field);
        // 如果需要更新URL（点击表头时）
        if (updateUrl) {
            updateUrlWithSortParams();
        }

        // 对当前页数据进行排序
        var $table = $('table');
        var $rows = $table.find('tbody tr').get();

        $rows.sort(function(a, b) {
            var aVal = $(a).find('td').eq(getFieldIndex(field)).text().toLowerCase();
            var bVal = $(b).find('td').eq(getFieldIndex(field)).text().toLowerCase();

            return currentSort.direction === 'asc'
                ? aVal.localeCompare(bVal)
                : bVal.localeCompare(aVal);
        });

        $.each($rows, function(index, row) {
            $table.find('tbody').append(row);
        });
    }
    function updateUrlWithSortParams() {
        var url = window.location.pathname;
        var params = [];

        // 添加页码参数
        params.push("pageNum=${pageNum}");

        // 添加搜索参数
        var searchColumn = document.getElementById("searchColumn").value;
        var keyword = document.getElementById("search_keyword").value;
        if (searchColumn && keyword) {
            params.push("searchColumn=" + encodeURIComponent(searchColumn));
            params.push("keyword=" + encodeURIComponent(keyword));
        }

        // 添加排序参数
        params.push("sortField=" + currentSort.field);
        params.push("sortDirection=" + currentSort.direction);

        // 更新URL但不刷新页面
        history.replaceState(null, null, url + "?" + params.join("&"));
    }
    // 获取字段在表格中的索引
    function getFieldIndex(field) {
        var headers = $('table thead th');
        for (var i = 0; i < headers.length; i++) {
            if ($(headers[i]).hasClass('name-sortable') && field === 'name') {
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

    // 分页跳转函数
    function goToPage(pageNum) {
        var url = "list?pageNum=" + pageNum;

        // 添加搜索条件
        var searchColumn = document.getElementById("searchColumn").value;
        var keyword = document.getElementById("search_keyword").value;
        if (searchColumn && keyword) {
            url += "&searchColumn=" + encodeURIComponent(searchColumn) +
                "&keyword=" + encodeURIComponent(keyword);
        }

        // 添加排序条件
        if (currentSort.field) {
            url += "&sortField=" + currentSort.field +
                "&sortDirection=" + currentSort.direction;
        }

        window.location.href = url;
    }
    // 跳转页面验证
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

    // 处理操作消息
    $(document).ready(function() {
        const urlParams = new URLSearchParams(window.location.search);
        const message = urlParams.get('message');

        if (message) {
            switch(message) {
                case 'add_success':
                    alert('迁出记录添加成功！');
                    break;
                case 'edit_success':
                    alert('迁出记录修改成功！');
                    break;
                case 'delete_success':
                    alert('迁出记录删除成功！');
                    break;
                case 'delete_fail':
                    alert('迁出记录删除失败！');
                    break;
            }

            // 移除message参数避免重复提示
            const newUrl = window.location.pathname +
                window.location.search.replace(/[?&]message=[^&]*/, '').replace(/^&/, '?');
            window.history.replaceState({}, document.title, newUrl);
        }
    });
</script>
</html>