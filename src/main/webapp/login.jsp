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
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/login" method="post">
    <label>
        <span>用户名：</span>
        <input name="username" type="text"/>
    </label>
    <label>
        <span>密码：</span>
        <input name="password" type="password"/>
    </label>
    <input type="submit" name="登录">
</form>
</body>
</html>
