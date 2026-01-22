
<%--
  Created by IntelliJ IDEA.
  User: nguyenhau
  Date: 23/1/26
  Time: 00:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <tr>
        <th>Report</th><th>Count</th><th>First</th><th>Last</th>
    </tr>
    <c:forEach items="${reports}" var="r">
        <tr>
            <td>${r[0]}</td>
            <td>${r[1]}</td>
            <td>${r[2]}</td>
            <td>${r[3]}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
