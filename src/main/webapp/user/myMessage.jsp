<%@ page import="com.wsyu.onlinebookstore.entity.MessageDetail" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--
  Created by IntelliJ IDEA.
  User: Wang
  Date: 2022/12/21
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>我的留言</title>
    <link rel="stylesheet" href="../static/bs/css/bootstrap.css">
    <script type="text/javascript" src="../static/bs/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/bs/js/bootstrap.js"></script>
    <link href="../static/css/book/head_footer.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container-fullid">
    <%@include file="header.jsp" %>
    <div class="wrapper">
        <div class="main container">
            <h2>我的留言</h2>
            <table class="table table-bordered">
                <thead>
                <tr class="info">
                    <th>编号</th>
                    <th>留言时间</th>
                    <th>留言内容</th>
                    <th>回复</th>
                </tr>
                </thead>
                <%
                    List<MessageDetail> messageList = (List<MessageDetail>) session.getAttribute("messageList");
                    for (MessageDetail message : messageList) {
                %>
                <tbody style="margin-top: 10px;">
                <tr>
                    <td id="messageId-<%=message.getMessage_id()%>"><%= message.getMessage_id()%>
                    </td>
                    <td><%= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(message.getMessage_date())%>
                    </td>
                    <td><%= message.getContent()%>
                    </td>
                    <td><%= message.getReply() %>
                    </td>
                </tr>
                </tbody>
                <%
                    }
                %>
                <%
                    if (messageList.size() == 0) {
                %>
                <tbody>
                <tr>
                    <td colspan="7"><h2 class="text-center">还莫有留言呢！</h2></td>
                </tr>
                </tbody>
                <%
                    }
                %>
            </table>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>

