<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script type="text/javascript" src="../static/js/book/landing.js"></script>
<div class="head">
    <div class="top">
        <div class="container">
            <div class="pull-right">|
                <a href="#">服务中心</a>
                <a href="#">网站地图</a>
            </div>

            <div class="pull-right">
                <div class="top-right">
                    HI~
                    <%
                        if (session.getAttribute("username") == null) {
                    %>
                    <a href="${pageContext.request.contextPath}/login">[登录]</a>
                    <a href="${pageContext.request.contextPath}/register">[免费注册]</a>
                    <%
                        }
                    %>
                </div>
                <div class="btn-group adminName top-right">
                    <a href="javascript:void(0)">
                        ${sessionScope.username} <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li><a href="${pageContext.request.contextPath}/user/myOrder">我的订单</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/myMessage">我的留言</a></li>
                        <li><a style="border-top:1px #ccc solid" href="${pageContext.request.contextPath}/api/logout"
                               onClick="return confirm('确定要退出登陆了么？')">退出登录</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="mid container">
        <div class="row">
            <a class="logo col-md-5" href="${pageContext.request.contextPath}/user/store">
                <img alt="" src="../images/logo.png">
                <span>网上书店</span>
            </a>
            <div class="search col-md-4">
                <form action="${pageContext.request.contextPath}/api/store/findBook">
                    <div class="input-group">
                        <input type="text" name="bookName" class="form-control" placeholder="输入要搜索的图书...">
                        <span class="input-group-btn">
						<button class="btn btn-default" type="submit">Go!</button>
					</span>
                    </div>
                </form>
            </div>
            <div class="shopcart col-md-2 col-md-offset-1">
                <a id="cart" href="${pageContext.request.contextPath}/user/cart">
					<span class="badge num">
                        ${sessionScope.cartList.size()}
                    </span>
                    <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
                    <span>购物车</span>
                    <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
                </a>
            </div>
        </div>
        <div class="navbar">
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="${pageContext.request.contextPath}/user/store">首 页 <span class="sr-only">(current)</span></a>
                </li>
                <li><a href="#">分 类</a></li>
                <li><a href="#">新 品</a></li>
                <li><a href="#">特 惠</a></li>
                <li><a href="#">热销榜</a></li>
            </ul>
        </div>
    </div>
</div>