<%--
  Created by IntelliJ IDEA.
  User:
  Date: 2022/12/20
  Time: 0:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台管理主页</title>
    <script type="text/javascript" src="./static/js/jquery.min.js"></script>
    <link rel="stylesheet" href="./static/bs/css/bootstrap.css">
    <script type="text/javascript" src="./static/bs/js/jquery.min.js"></script>
    <script type="text/javascript" src="./static/bs/js/bootstrap.js"></script>
    <link rel="stylesheet" href="./static/css/admin/header.css">
    <style type="text/css">

    </style>
</head>
<body>
<div class="header container-fluid">
    <a class="title" href="main.jsp" target="rFrame">书店后台管理系统</a>
    <div class="btn-group adminName">
        <button type="button" class="btn btn-default dropdown-toggle">
            ${adminUser.userName} <span class="caret"></span>
        </button>
        <ul class="dropdown-menu dropdown-menu-right">
            <li><a href="LoginOutServlet" target="_top" onClick="return confirm('确定要退出系统了么？')">退 出 登 录</a></li>
        </ul>
    </div>

</div>
<div class="left">
    <iframe src="left.jsp" width="210px" height="100%" frameborder="0" name="left" marginwidth="0" marginheight="0"></iframe>
</div>
<div class="right">
    <iframe src="main.jsp" width="100%" height="100%" frameborder="0" name="rFrame" marginwidth="0" marginheight="0"></iframe>
</div>

</body>
<script type="text/javascript">
    $(".adminName").mouseover(function(){
        $(".dropdown-menu").css("display","inline-block");
    })
    $(".adminName").mouseout(function(){
        $(".dropdown-menu").css("display","none");
    })
</script>
</html>
</body>
</html>
