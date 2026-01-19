<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Welcome</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="container mt-5 text-center">

<h1 class="display-4 text-primary"><%= "Chào mừng đến với hệ thống!" %></h1>
<p class="lead">Nhấn vào nút bên dưới để bắt đầu quản lý người dùng.</p>

<br/>

<a href="${pageContext.request.contextPath}/user" class="btn btn-primary btn-lg">
  <i class="bi bi-people-fill"></i> Quản lý người dùng
</a>

</body>
</html>