<%--
  Created by IntelliJ IDEA.
  User: nguyenhau
  Date: 22/1/26
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<h2>DANH SÁCH VIDEO ĐƯỢC YÊU THÍCH</h2>

<table border="1" cellpadding="8">
    <tr>
        <th>Video Title</th>
        <th>Người thích</th>
        <th>Ngày thích</th>
    </tr>

    <c:forEach var="f" items="${favorites}">
        <tr>
            <td>${f.video.title}</td>
            <td>${f.user.fullname}</td>
            <td>${f.likeDate}</td>
        </tr>
    </c:forEach>
</table>

