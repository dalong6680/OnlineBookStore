<%@ page import="com.wsyu.onlinebookstore.entity.OrderDetail" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
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
<div class="main container">
    <h2>全部订单</h2>
    <table class="table table-bordered">
        <thead>
        <tr class="info">
            <th>订单号</th>
            <th>订单时间</th>
            <th>下单用户</th>
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
            <td><%= order.getUsername()%>
            </td>
            <td><%= order.getName() + "---" + order.getWriter()%>
            </td>
            <td>￥<%= order.getPrice()%>
            </td>
            <td><%= order.getCount()%>
            </td>
            <td class="subtotal">￥<%= order.getCount() * order.getPrice()%>
            </td>
            <td>订单已完成</td>
        </tr>
        </tbody>
        <%
            }
        %>
        <tbody>
        <tr>
            <td colspan="5" class="text-right">总收入：</td>
            <td colspan="2" id="total" style="color: red;">￥0.00</td>
            <td></td>
        </tr>
        </tbody>
        <%
            if (((List<?>) session.getAttribute("orderList")).size() == 0) {
        %>
        <tbody>
        <tr>
            <td colspan="8"><h2 class="text-center">还莫有订单呢！</h2></td>
        </tr>
        </tbody>
        <%
            }
        %>
    </table>
</div>
<script>
    $(document).ready(function () {
        var subtotals = document.getElementsByClassName("subtotal");
        var total = 0;
        for (let subtotal of subtotals) {
            total += parseFloat(subtotal.innerHTML.split('￥')[1].split('\n')[0]);
        }
        $('#total').get(0).innerHTML = '￥' + total.toFixed(2);
    })
</script>
</body>
</html>
