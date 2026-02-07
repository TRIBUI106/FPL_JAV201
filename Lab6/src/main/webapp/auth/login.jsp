<%--
  Created by IntelliJ IDEA.
  User: nguyenhau
  Date: 5/2/26
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <h2>🔑 Đăng nhập</h2>

    <form method="post">
        <input name="username" placeholder="Username" required><br><br>
        <input type="password" name="password" placeholder="Password" required><br><br>

        <button>Đăng nhập</button>
    </form>

    <p style="color:red">${error}</p>

    <hr>
    <a href="register">👉 Chưa có tài khoản? Đăng ký</a>

</head>
<body>

</body>
</html>
