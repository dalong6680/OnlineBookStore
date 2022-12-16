<%--
  Created by IntelliJ IDEA.
  User: Wang
  Date: 2022/12/10
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>网上书店-登录</title>
    <%--    <script src="static/js/jquery.min.js"></script>--%>
    <%--    <script src="static/js/bootstrap.min.js"></script>--%>
    <%--    <link rel="stylesheet" href="static/css/bootstrap.min.css">--%>
</head>
<body>
<form action="api/login" method="post">
    <label>
        用户名
        <input type="text" name="username" id="username" placeholder="请输入用户名">
    </label>
    <br>
    <label>
        密码
        <input type="password" name="password" id="password" placeholder="请输入密码">
        <span id="message" style="color: red">${sessionScope.errorMessage}</span>
    </label>
    <br>
    <button type="submit">登录</button>
<%--    <p class="error-message">${sessionScope.errorMessage}</p>--%>
    <a href="${pageContext.request.contextPath}/register">没有账号？点我注册。</a>
</form>
<%--TODO 调样式太烦，决定先用无样式的写法，先实现功能--%>
<%--<form action="api/login" method="post" class="form-horizontal" role="form">--%>
<%--    <div class="form-group">--%>
<%--        <label class="col-sm-2 control-label">用户名</label>--%>
<%--        <div class="col-xs-4">--%>
<%--            <input type="text" name="username" class="form-control" id="username" placeholder="请输入用户名">--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <label class="col-sm-2 control-label">密码</label>--%>
<%--        <div class="col-xs-4">--%>
<%--            <input type="password" name="password" class="form-control" id="password" placeholder="请输入密码">--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <div class="col-sm-offset-2 col-sm-10">--%>
<%--            <button type="submit" class="btn btn-default">登录</button>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <div class="col-sm-offset-2 col-sm-10">--%>
<%--            <a class="form-control-static" href="${pageContext.request.contextPath}/register">注册</a>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</form>--%>
</body>
</html>
