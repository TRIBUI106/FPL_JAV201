<%--
  Created by IntelliJ IDEA.
  User: nguyenhau
  Date: 23/1/26
  Time: 00:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/login" method="post">
    <input name="username" placeholder="Username or Email">
    <input name="password" type="password">
    <button>Login</button>
</form>


</body>
</html>
