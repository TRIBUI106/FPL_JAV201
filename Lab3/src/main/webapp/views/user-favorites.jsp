<%--
  Created by IntelliJ IDEA.
  User: nguyenhau
  Date: 22/1/26
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<h2>Video yêu thích của ${user.fullname}</h2>

<table border="1" cellpadding="8">
    <tr>
        <th>Tiêu đề video</th>
        <th>Ngày thích</th>
    </tr>

    <c:forEach var="fav" items="${user.favorites}">
        <tr>
            <td>${fav.video.title}</td>
            <td>${fav.likeDate}</td>
        </tr>
    </c:forEach>
</table>

