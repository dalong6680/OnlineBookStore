<%--
  Created by IntelliJ IDEA.
  User: Wang
  Date: 2022/12/21
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理后台-首页</title>
    <link rel="stylesheet" href="../static/bs/css/bootstrap.css">
    <script type="text/javascript" src="../static/bs/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/bs/js/bootstrap.js"></script>
</head>
<body>
<%@include file="header.jsp" %>
<h3>HI,${sessionScope.username}!欢迎来到网上书店管理后台！</h3>
</body>
</html>
