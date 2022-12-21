<%--
  Created by IntelliJ IDEA.
  User: Wang
  Date: 2022/12/10
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <link rel="stylesheet" href="static/css/login/style.css">
</head>
<body>
<section>

    <!-- 登录 -->

    <div class="container">
        <div class="user singinBx">
            <div class="imgBx"><img src="images/logo.jpg" alt=""></div>
            <div class="formBx">
                <form action="${pageContext.request.contextPath}/api/login" method="post">
                    <h2>登录</h2>
                    <input type="text" name="username" placeholder="用户名">
                    <input type="password" name="password" placeholder="密码">
                    <input type="submit" name="" value="登录">
                    <span style="color: red">${sessionScope.errorMessage}</span>
                    <p class="signup">没有账号？<a href="#" onclick="topggleForm();">注册</a></p>
                </form>
            </div>
        </div>

        <!-- 注册 -->

        <div class="user singupBx">
            <div class="formBx">
                <form action="${pageContext.request.contextPath}/api/register" method="post">
                    <h2>注册</h2>
                    <input type="text" name="username" placeholder="用户名">
                    <input type="password" name="password" placeholder="密码">
                    <input type="password" name="" placeholder="再次输入密码">
                    <input type="submit" name="" value="注册">
                    <span style="color: red">${sessionScope.errorMessage}</span>
                    <p class="signup">已有账号？<a href="#" onclick="topggleForm();">登录</a></p>
                </form>
            </div>
            <div class="imgBx"><img src="images/logo.jpg" alt="" width="600" height="600"></div>
        </div>

    </div>
</section>
<script type="text/javascript">
    function topggleForm(){
        var container = document.querySelector('.container');
        container.classList.toggle('active');
    }
</script>
</body>
</html>
