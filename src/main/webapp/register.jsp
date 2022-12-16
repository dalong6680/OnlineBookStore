<%--
  Created by IntelliJ IDEA.
  User: Wang
  Date: 2022/12/14
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>网上书店-注册</title>
    <%--    <script src="static/js/jquery.min.js"></script>--%>
    <%--    <script src="static/js/bootstrap.min.js"></script>--%>
    <%--    <link rel="stylesheet" href="static/css/bootstrap.min.css">--%>
</head>
<body>
<form action="api/register" method="post" onsubmit="
    if (document.getElementById('password').value !== document.getElementById('co-password').value) {
        document.getElementById('message').innerHTML = '两次输入的密码不一致';
        return false;
    }">
    <label>
        用户名
        <input type="text" name="username" id="username" placeholder="请输入用户名">
    </label>
    <br>
    <label>
        密码
        <input type="password" name="password" id="password" placeholder="请输入密码">
    </label>
    <br>
    <label>
        确认密码
        <input type="password" id="co-password" placeholder="请输入确认密码">
        <span id="message" style="color: red">${sessionScope.errorMessage}</span>
    </label>
    <br>
    <button type="submit">注册</button>
<%--    <p class="error-message">${sessionScope.errorMessage}</p>--%>
</form>
<%--TODO 调样式太烦，决定先用无样式的写法，先实现功能--%>
<%--<form action="api/register" method="post" onsubmit="function checkPassword() {--%>
<%--    if (document.getElementById('password').value !== document.getElementById('co-password').value) {--%>
<%--        alert('两次输入的密码不一致！');--%>
<%--    }--%>
<%--}--%>
<%--checkPassword()"--%>
<%--      class="form-horizontal" role="form">--%>
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
<%--        <label class="col-sm-2 control-label">确认密码</label>--%>
<%--        <div class="col-xs-4">--%>
<%--            <input type="password" class="form-control" id="co-password" placeholder="请输入确认密码">--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <div class="col-sm-offset-2 col-sm-10">--%>
<%--            <button type="submit" class="btn btn-default">注册</button>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</form>--%>
</body>
</html>

