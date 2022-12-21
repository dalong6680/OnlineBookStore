<%@ page import="com.wsyu.onlinebookstore.entity.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Wang
  Date: 2022/12/21
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/bs/css/bootstrap.css">
    <script type="text/javascript" src="../static/bs/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/bs/js/bootstrap.js"></script>
</head>
<body>
<%@include file="header.jsp" %>
<div class="container">
    <h2>用户管理</h2>
    <table class="table table-bordered">
        <thead>
        <tr class="info">
            <th>编号</th>
            <th>用户名</th>
            <th>密码</th>
            <th>操作</th>
        </tr>
        </thead>
        <%
            List<User> userList = (List<User>) session.getAttribute("userList");
            for (User user : userList) {
        %>
        <tbody style="margin-top: 10px;">
        <tr>
            <td><span id="userId-<%=user.getUser_id() %>"><%=user.getUser_id()%></span></td>
            <td><input type="text" id="username-<%=user.getUser_id() %>" value="<%=user.getUsername()%>"
                       name="username"></td>
            <td><input type="text" id="password-<%=user.getUser_id() %>" value="<%=user.getPassword()%>"
                       name="password"></td>
            <td>
                <button class="btn btn-success" onclick="doChange(<%=user.getUser_id() %>)">修改</button>
            </td>
        </tr>
        </tbody>
        <%
            }
        %>
        <%
            if (userList.size() == 0) {
        %>
        <tbody>
        <tr>
            <td colspan="6"><h2 class="text-center">没有用户</h2></td>
        </tr>
        </tbody>
        <%
            }
        %>
    </table>
</div>
<script>
    function doChange(id) {
        var username = $("#username-" + id).val();
        var password = $("#password-" + id).val();
        $.post("${pageContext.request.contextPath}/api/admin/changePassword", {
            username: username,
            password: password
        })
    }
</script>
</body>
</html>
