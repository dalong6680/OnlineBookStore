<%@ page import="com.wsyu.onlinebookstore.entity.Book" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Wang
  Date: 2022/12/21
  Time: 14:59
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
    <h2>库存管理</h2>
    <table class="table table-bordered">
        <thead>
        <tr class="info">
            <th>编号</th>
            <th>名称</th>
            <th>作者</th>
            <th>价格</th>
            <th>库存</th>
            <th>操作</th>
        </tr>
        </thead>
        <%
            List<Book> bookList = (List<Book>) session.getAttribute("bookList");
            for (Book book : bookList) {
        %>
        <tbody style="margin-top: 10px;">
        <tr>
            <td><span id="bookId-<%=book.getBook_id() %>"><%=book.getBook_id()%></span></td>
            <td><input type="text" id="name-<%=book.getBook_id() %>" value="<%=book.getName()%>" name="name"></td>
            <td><input type="text" id="writer-<%=book.getBook_id() %>" value="<%=book.getWriter()%>" name="writer"></td>
            <td><input type="number" id="price-<%=book.getBook_id() %>" step="0.01" value="<%=book.getPrice()%>"
                       name="price"></td>
            <td><input type="number" id="stock-<%=book.getBook_id() %>" value="<%=book.getStock()%>" name="stock"></td>
            <td>
                <button class="btn btn-success" onclick="doChange(<%=book.getBook_id() %>)">修改</button>
            </td>

        </tr>
        </tbody>
        <%
            }
        %>
        <%
            if (bookList.size() == 0) {
        %>
        <tbody>
        <tr>
            <td colspan="6"><h2 class="text-center">没有图书</h2></td>
        </tr>
        </tbody>
        <%
            }
        %>
    </table>
</div>
<script>
    function doChange(id) {
        var bookId = $("#bookId-" + id).get(0).innerHTML;
        var name = $("#name-" + id).val();
        var writer = $("#writer-" + id).val();
        var price = $("#price-" + id).val();
        var stock = $("#stock-" + id).val();
        $.get("${pageContext.request.contextPath}/api/admin/changeBook?bookId=" + bookId + "&name=" + name + "&writer=" + writer + "&price=" + price + "&stock=" + stock);
    }
</script>
</body>

</html>
