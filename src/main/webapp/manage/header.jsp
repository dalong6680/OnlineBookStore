<%--
  Created by IntelliJ IDEA.
  User: Wang
  Date: 2022/12/21
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(document).ready(function () {
        // 遍历li标签，从而获取下面a标签的href，这里为了方便说明选用的是.nav类，在实际应用中可以使用id代替
        $('.nav').find('li').each(function () {
            var a = $(this).find('a:first')[0];
            // 判断a标签的href是否与当前页面的路径相同
            if ($(a).attr("href") === location.pathname) {
                $(this).addClass("active");
            } else {
                $(this).removeClass("active");
            }
        })
    })
</script>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/manage/index">网上书店-管理后台</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/manage/bookManage">库存管理</a></li>
                <li><a href="${pageContext.request.contextPath}/manage/addBook">添加书籍</a></li>
                <li><a href="${pageContext.request.contextPath}/manage/userManage">用户管理</a></li>
                <li><a href="${pageContext.request.contextPath}/manage/messageManage">留言管理</a></li>
                <li><a href="${pageContext.request.contextPath}/manage/orderHistory">全部订单</a></li>
                <li><a href="${pageContext.request.contextPath}/api/logout">退出登录</a></li>
            </ul>
        </div>
    </div>
</nav>