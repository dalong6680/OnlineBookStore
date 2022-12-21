<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="com.wsyu.onlinebookstore.entity.CartDetail" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>购物车</title>
    <link rel="stylesheet" href="../static/bs/css/bootstrap.css">
    <script type="text/javascript" src="../static/bs/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/bs/js/bootstrap.js"></script>
    <script type="text/javascript" src="../static/js/book/landing.js"></script>
    <link href="../static/css/book/head_footer.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../static/js/book/addcart.js"></script>
    <link rel="stylesheet" type="text/css" href="../static/bs/validform/style.css">
    <script type="text/javascript" src="../static/bs/validform/Validform_v5.3.2_min.js"></script>
    <script type="text/javascript" src="../static/js/book/user_reg_login.js"></script>
    <style>
        .wrapper {
            minheight: 400px;
        }

        .wrapper .main {
            padding: 20px 50px;
        }

        .wrapper .main .content .spinner a {
            display: inline-block;
        }

        .wrapper .main .content .spinner input {
            display: inline-block;
            width: 30px;
            height: 22px;
            border-radius: 3px;
        }
    </style>

</head>
<body>
<div class="container-fullid">
    <%@include file="header.jsp" %>
    <div class="wrapper">
        <!-- main start -->
        <div class="main container">
            <h3>
                <span>我的购物车</span>
            </h3>
            <div class="content table-responsive">
                <table class="table">
                    <tr class="info row">
                        <th class="col-md-6">商品</th>
                        <th class="col-md-2">单价</th>
                        <th class="col-md-1">数量</th>
                        <th class="col-md-2">小计</th>
                        <th class="col-md-1">操作</th>
                    </tr>
                    <%
                        List<CartDetail> cartList = (List<CartDetail>) session.getAttribute("cartList");
                        for (CartDetail cart : cartList) {
                    %>
                    <tr class="row" id="pro-tr-<%= cart.getSerial_no()%>">
                        <td>
                            <div class="col-md-8">
                                <p><%= cart.getName()%>---<%= cart.getWriter()%>
                                </p>
                            </div>
                        </td>
                        <td>￥<i id="price-<%= cart.getSerial_no()%>"><%= cart.getPrice()%>
                        </i></td>
                        <td>
                            <div class="spinner">
                                <span onclick="changeVal(<%= cart.getCart_id()%>, <%= cart.getSerial_no()%>, -1)"
                                      class="btn btn-xs btn-default">
                                    <b>-</b>
                                </span>
                                <input type="text" id="count-<%= cart.getSerial_no()%>" value="<%= cart.getCount()%>"
                                       onchange="changeInput(this, <%= cart.getCart_id()%>, <%= cart.getSerial_no()%>)">
                                <span onclick="changeVal(<%= cart.getCart_id()%>, <%= cart.getSerial_no()%>, 1)"
                                      class="btn btn-xs btn-default">
                                    <b>+</b>
								</span>
                            </div>
                        </td>
                        <script>
                            calcPrice(<%= cart.getSerial_no()%>);
                        </script>
                        <td style="color:red;font-size:20px;">￥<i class="subtotal"
                                                                  id="subtotal-<%= cart.getSerial_no()%>">0.00</i></td>
                        <td><a class="btn btn-danger btn-sm"
                               href="${pageContext.request.contextPath}/api/cart/deCart?cartId=<%= cart.getCart_id()%>"
                               onClick="return confirm('确定要删除此项了么？')">删除</a></td>
                    </tr>
                    <%
                        }
                    %>

                    <tr class="row">
                        <td colspan="2"><a href="${pageContext.request.contextPath}/api/cart/clearCart"
                                           class="btn btn-danger">清空购物车</a></td>
                        <td class="pull-right" style="font-size: 24px;">合计：</td>
                        <td>
                            <b style="color:red;font-size: 24px;">
                                ￥
                                <i id="totalPrice">0.00</i>
                            </b></td>
                        <td><a id="createOrder" class="btn btn-success"
                               href="${pageContext.request.contextPath}/api/order/createOrder">去结算</a></td>
                    </tr>
                    <%
                        if (((List<CartDetail>) session.getAttribute("cartList")).size() == 0) {
                    %>
                    <tr>
                        <td colspan="6"
                            style="height: 200px; line-height: 100px; font-size: 24px;">
                            <span>购物车内暂时没有商品，</span>
                            <a style="font-size: 24px; color: red" href="${pageContext.request.contextPath}/user/store">去购物>></a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp" %>
</div>

<script type="text/javascript">
    function changeVal(cartId, id, delta) {
        var input = document.getElementById("count-" + id);
        num = parseInt(input.value)
        num += parseInt(delta);
        input.value = num;
        updateCart(cartId, input.value);
        calcPrice(id);
    }

    //输入框处理
    function changeInput(obj, cartId, id) {
        var val = parseInt(obj.value);
        calcPrice(id);
        updateCart(cartId, val);
    }

    function calcPrice(id) {
        var count = document.getElementById("count-" + id).value;
        var price = document.getElementById("price-" + id).innerHTML;
        var subtotal = document.getElementById("subtotal-" + id);
        subtotal.innerHTML = parseFloat(price) * parseInt(count)
        calcTotalPrice();
    }

    function calcTotalPrice() {
        var subtotals = document.getElementsByClassName("subtotal");
        var total = 0;
        for (const subtotal of subtotals) {
            total += parseInt(subtotal.innerHTML)
        }
        document.getElementById("totalPrice").innerHTML = total;
    }

    function updateCart(cartId, val) {
        $.get("${pageContext.request.contextPath}/api/cart/updateCart?cartId=" + cartId + "&newCount=" + val);
    }
</script>
</body>
</html>