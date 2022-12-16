<%@ page import="java.util.List" %>
<%@ page import="com.wsyu.onlinebookstore.entity.Book" %><%--
  Created by IntelliJ IDEA.
  User: Wang
  Date: 2022/12/11
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>网上书店-主页</title>
</head>
<body>
<span>欢迎，${sessionScope.username}</span>
<%
    if (session.getAttribute("admin").equals("1")) {
%>
<a href="${pageContext.request.contextPath}/manage/user">用户管理</a>
<%
    }
%>
<a href="${pageContext.request.contextPath}/api/logout">退出登录</a>
<table>
    <tr>
        <th>名称</th>
        <th>作者</th>
        <th>价格</th>
        <th>库存</th>
    </tr>


    <%
        List<Book> bookList = (List<Book>) session.getAttribute("bookList");
        for (Book book : bookList) {
    %>
    <tr>
        <td><%= book.getName() %>
        </td>
        <td><%= book.getWriter() %>
        </td>
        <td><%= book.getPrice() %>
        </td>
        <td><%= book.getStock() %>
        </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
