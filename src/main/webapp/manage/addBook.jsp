<%--
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
    <h2 class="col-sm-offset-5">添加书籍</h2>
    <form id="bookAddForm" class="form-horizontal" action="${pageContext.request.contextPath}/api/admin/addBook">
        <div class="form-group">
            <label for="name" class="col-sm-2 col-sm-offset-2 control-label">名称</label>
            <div class="col-sm-4 ">
                <input type="text" name="name" id="name" class="form-control"/>
            </div>
        </div>
        <div class="form-group">
            <label for="writer" class="col-sm-2 col-sm-offset-2 control-label">作者</label>
            <div class="col-sm-4 ">
                <input type="text" name="writer" id="writer" class="form-control"/>
            </div>
        </div>
        <div class="form-group">
            <label for="price" class="col-sm-2 col-sm-offset-2 control-label">价格</label>
            <div class="col-sm-4">
                <input type="number" step="0.01" name="price" id="price" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label for="stock" class="col-sm-2 col-sm-offset-2 control-label">库存</label>
            <div class="col-sm-4">
                <input type="number" name="stock" id="stock" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 col-sm-offset-4 control-label">
                <input class="btn btn-success btn-block" type="submit" value="提交">
            </label>
            <label class="col-sm-2 control-label">
                <input class="btn btn-warning btn-block" type="reset" value="重置">
            </label>
        </div>
    </form>
</div>
</body>
</html>
