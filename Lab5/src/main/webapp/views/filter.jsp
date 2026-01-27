<%--
  Created by IntelliJ IDEA.
  User: nguyenhau
  Date: 26/1/26
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Filter Test</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow p-4">
        <h3 class="mb-3">Trang test Filter</h3>

        <p>
            Thuộc tính từ Filter:
            <strong>${hello}</strong>
        </p>

        <a href="${pageContext.request.contextPath}/index.jsp"
           class="btn btn-secondary mt-3">
            Quay về trang chính
        </a>
    </div>
</div>

</body>
</html>

