<%@ page import="com.wsyu.onlinebookstore.entity.MessageDetail" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Wang
  Date: 2022/12/21
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言管理</title>
    <link rel="stylesheet" href="../static/bs/css/bootstrap.css">
    <script type="text/javascript" src="../static/bs/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/bs/js/bootstrap.js"></script>
</head>
<body>
<%@include file="header.jsp" %>
<div class="container">

    <div class="container">
        <h2>留言管理</h2>
        <table class="table table-bordered">
            <thead>
            <tr class="info">
                <th>编号</th>
                <th>留言时间</th>
                <th>留言内容</th>
                <th>回复</th>
                <th>操作</th>
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
                <td><input type="text" name="reply" id="reply-<%=message.getMessage_id()%>"
                           value="<%=message.getReply()%>">
                </td>
                <td>
                    <button class="btn btn-success" onclick="doChange(<%=message.getMessage_id() %>)">回复</button>
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
<script>
    function doChange(id) {
        var reply = $("#reply-" + id).val();
        $.get("${pageContext.request.contextPath}/api/admin/replyMessage?messageId=" + id + "&reply=" + reply);
    }
</script>
</body>
</html>
