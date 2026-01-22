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
    <title>Title</title>
</head>
<body>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<form action="${pageContext.request.contextPath}/search" method="get">
    <input type="text" name="keyword" placeholder="Nhập từ khóa">
    <button type="submit">Search</button>
</form>

<hr>

<c:if test="${not empty videos}">
    <c:forEach items="${videos}" var="v">
        <p>${v.title}</p>
    </c:forEach>
</c:if>

<c:if test="${empty videos}">
    <p>Không có dữ liệu</p>
</c:if>

</body>
</html>
