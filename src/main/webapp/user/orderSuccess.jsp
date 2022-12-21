<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>订单提交成功</title>
    <link rel="stylesheet" href="../static/bs/css/bootstrap.css">
    <script type="text/javascript" src="../static/bs/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/bs/js/bootstrap.js"></script>
    <script type="text/javascript" src="../static/js/book/landing.js"></script>
    <link href="../static/css/book/head_footer.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        .wrapper {
            min-height: 500px;
        }

        .wrapper .main .info {
            width: 900px;
            margin: 70px auto 0;
            padding: 50px;
            border: 1px #ccc solid;
            font-size: 24px;
        }

        .wrapper .main .info i {
            color: red;

        }

        .wrapper .main .info .op {
            width: 300px;
            margin: 20px auto 0;
        }
    </style>

</head>
<body>
<div class="container-fullid">
    <%@include file="header.jsp" %>
    <div class="wrapper">
        <div class="main container">
            <div class="info">
                <div class="row">
                    <div class="col-md-4">
                        <img src="../images/corr.png" alt=""/>
                    </div>
                    <div class="col-md-8">
                        <p>订单已成功生成，我们会尽快送达！</p>
                    </div>
                    <div class="op col-md-8">
                        <a class="btn btn-success "
                           href="${pageContext.request.contextPath}/user/myOrder">查看我的订单</a>
                        <a class="btn btn-default" href="${pageContext.request.contextPath}/user/store">返回首页</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp" %>
</div>
</body>
</html>