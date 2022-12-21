<%@page import="java.util.List" %>
<%@ page import="com.wsyu.onlinebookstore.entity.OrderDetail" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
</head>
<body>
<div class="container-fullid">
    <%@include file="header.jsp" %>
    <div class="wrapper">
        <div class="main container">
            <h2>全部订单</h2>
            <table class="table table-bordered">
                <thead>
                <tr class="info">
                    <th>订单号</th>
                    <th>订单时间</th>
                    <th>商品</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>实付款</th>
                    <th>交易状态</th>
                </tr>
                </thead>

                <%
                    List<OrderDetail> orderList = (List<OrderDetail>) session.getAttribute("orderList");
                    for (OrderDetail order : orderList) {
                %>
                <tbody style="margin-top: 10px;">
                <tr>
                    <td><%= order.getOrder_id()%>
                    </td>
                    <td><%= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(order.getOrder_date())%>
                    </td>
                    <td><%= order.getName() + "---" + order.getWriter()%>
                    </td>
                    <td>￥<%= order.getPrice()%>
                    </td>
                    <td><%= order.getCount()%>
                    </td>
                    <td>￥<%= order.getCount() * order.getPrice()%>
                    </td>
                    <td>订单已完成</td>
                </tr>
                </tbody>
                <%
                    }
                %>
                <%
                    if (((List<?>) session.getAttribute("orderList")).size() == 0) {
                %>
                <tbody>
                <tr>
                    <td colspan="7"><h2 class="text-center">还莫有订单呢！</h2></td>
                </tr>
                </tbody>
                <%
                    }
                %>
            </table>
        </div>
    </div>
    <%@include file="footer.jsp" %>
</div>
</body>
</html>
