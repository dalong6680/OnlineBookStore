<%@page import="java.util.List" %>
<%@ page import="com.wsyu.onlinebookstore.entity.Book" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>啥也没有书城</title>
    <link rel="stylesheet" href="../static/bs/css/bootstrap.css">
    <script type="text/javascript" src="../static/bs/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/bs/js/bootstrap.js"></script>
    <link href="../static/css/book/head_footer.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../static/js/book/getCatalog.js"></script>
    <script type="text/javascript" src="../static/js/book/index.js"></script>
    <script type="text/javascript" src="../static/js/book/landing.js"></script>
    <link rel="stylesheet" href="../static/css/book/index.css"/>
    <script type="text/javascript" src="../static/js/book/addcart.js"></script>
    <style type="text/css">
        .dropdown-menu {
            margin: 0;
        }
    </style>

</head>
<body>

<div class="container-fullid">
    <%@include file="header.jsp" %>
    <div class="wrapper">
        <!-- banner start -->
        <div class="banner">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                </ol>
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="../images/banner1.jpg" alt="...">
                    </div>
                    <div class="item">
                        <img src="../images/banner2.jpg" alt="...">
                    </div>
                    <div class="item">
                        <img src="../images/banner3.jpg" alt="...">
                    </div>
                    <div class="item">
                        <img src="../images/banner4.jpg" alt="...">
                    </div>
                    <div class="item">
                        <img src="../images/banner5.jpg" alt="...">
                    </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                </a>
            </div>
        </div>
        <!-- main start -->
        <div class="main container">
            <div class="row">
                <div class="col-md-2 main-left">
                    <h3>图书分类</h3>
                    <ul id="catalog-list">
                        <li><a href="#">全部图书</a></li>
                    </ul>
                </div>
                <div class="col-md-10 main-right">
                    <div class="pro col-md-12">
                        <h3>推荐图书</h3>
                        <div id="recBooks" class="pro-list">
                            <ul>
                                <%
                                    List<Book> bookList = (List<Book>) session.getAttribute("bookList");
                                    for (Book book : bookList) {
                                %>
                                <li class="col-md-3">
                                    <div class="list">
                                        <a href="#">
                                            <img class="img-responsive" src="../images/noneImg.jpg" alt=""/>
                                        </a>
                                        <div class="proinfo">
                                            <h2>
                                                <a class="text-center"
                                                   href="#"><%=book.getName() + "---" + book.getWriter()%>
                                                </a>
                                            </h2>
                                            <p>
                                                <i class="">￥<%=book.getPrice()%>
                                                </i>
                                                <a class="btn btn-danger btn-xs"
                                                   href="${pageContext.request.contextPath}/api/cart/enCart?bookName=<%=book.getName()%>&count=1">加入购物车</a>
                                            </p>
                                        </div>
                                    </div>
                                </li>
                                <%
                                    }
                                %>
                            </ul>
                        </div>
                    </div>
                    <div class="pro col-md-12">
                        <h3>新书上架</h3>
                        <div id="newBooks" class="pro-list">
                            <ul>
                                <li class="col-md-3">
                                    <div class="list">
                                        <a href="#">
                                            <img class="img-responsive" src="../images/noneImg.jpg" alt=""/>
                                        </a>
                                        <div class="proinfo">
                                            <h2>
                                                <a class="text-center"
                                                   href="#">挪威的森林---村上春树
                                                </a>
                                            </h2>
                                            <p>
                                                <i class="">￥15.0
                                                </i>
                                                <a class="btn btn-danger btn-xs"
                                                   href="${pageContext.request.contextPath}/api/cart/enCart?bookName=挪威的森林&count=1">加入购物车</a>
                                            </p>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp" %>
</div>
<!--弹窗盒子start -->
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-body" style="color:green;font-size:24px;">
                <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp商品已成功加入购物车！
            </div>

            <div class="modal-footer">
                <a href="javascript:void(0)" type="button" class="btn btn-default" data-dismiss="modal">返回继续购物</a>
                <a href="cart.jsp" type="button" class="btn btn-success">立即去结算</a>
            </div>
        </div>
    </div>
</div>

<%--<table>--%>
<%--    <tr>--%>
<%--        <th>名称</th>--%>
<%--        <th>作者</th>--%>
<%--        <th>价格</th>--%>
<%--        <th>库存</th>--%>
<%--    </tr>--%>


<%--    <%--%>
<%--        List<Book> bookList = (List<Book>) session.getAttribute("bookList");--%>
<%--        for (Book book : bookList) {--%>
<%--    %>--%>
<%--    <tr>--%>
<%--        <td><%= book.getName() %>--%>
<%--        </td>--%>
<%--        <td><%= book.getWriter() %>--%>
<%--        </td>--%>
<%--        <td><%= book.getPrice() %>--%>
<%--        </td>--%>
<%--        <td><%= book.getStock() %>--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>
<%--</table>--%>

<!--弹窗盒子end -->
</body>
</html>
