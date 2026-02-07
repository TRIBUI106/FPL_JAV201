<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.poly.lab6.entity.User" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>LAB 6 - JAVA WEB</title>

    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 30px;
        }

        .container {
            max-width: 1000px;
            margin: auto;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        .card {
            background: #ffffff;
            border-radius: 10px;
            padding: 20px 25px;
            margin-bottom: 25px;
            box-shadow: 0 6px 16px rgba(0,0,0,0.08);
        }

        .card h3 {
            margin-top: 0;
            color: #34495e;
        }

        .btn {
            display: inline-block;
            padding: 10px 15px;
            margin: 6px 6px 6px 0;
            border-radius: 6px;
            text-decoration: none;
            color: white;
            font-size: 14px;
            transition: 0.2s;
        }

        .btn-blue { background: #3498db; }
        .btn-green { background: #2ecc71; }
        .btn-orange { background: #e67e22; }
        .btn-red { background: #e74c3c; }
        .btn-gray { background: #7f8c8d; }

        .btn:hover {
            opacity: 0.85;
        }

        .status {
            font-size: 16px;
        }

        .role-admin {
            color: #e74c3c;
            font-weight: bold;
        }

        .role-user {
            color: #27ae60;
            font-weight: bold;
        }

        footer {
            text-align: center;
            color: #888;
            margin-top: 40px;
        }
    </style>
</head>

<body>

<div class="container">

    <h1>🚀 LAB 6 – JAVA WEB NÂNG CAO</h1>

    <%
        User user = (User) session.getAttribute("user");
    %>

    <!-- TRẠNG THÁI ĐĂNG NHẬP -->
    <div class="card">
        <h3>🔐 Trạng thái đăng nhập</h3>

        <%
            if (user == null) {
        %>
        <p class="status">Bạn chưa đăng nhập</p>
        <a class="btn btn-blue" href="<%=request.getContextPath()%>/auth/login">
            Đăng nhập
        </a>
        <%
        } else {
        %>
        <p class="status">
            Xin chào <b><%= user.getUsername() %></b><br>
            Vai trò:
            <span class="<%= user.getRole() == 0 ? "role-admin" : "role-user" %>">
                <%= user.getRole() == 0 ? "ADMIN" : "USER" %>
            </span>
        </p>
        <%
            }
        %>
    </div>

    <!-- BÀI 1 -->
    <div class="card">
        <h3>📘 BÀI 1 – Servlet & Trang chung</h3>
        <a class="btn btn-gray" href="auth/register">Sign Up</a>
        <a class="btn btn-gray" href="video/list">Video List</a>
        <a class="btn btn-gray" href="admin/video">Admin Video</a>
    </div>

    <!-- BÀI 2 -->
    <div class="card">
        <h3>🔒 BÀI 2 – AuthFilter & Phân quyền</h3>
        <a class="btn btn-orange" href="auth/change-password">Change Password</a>
        <a class="btn btn-orange" href="video/like/1">Like Video</a>
        <a class="btn btn-red" href="admin/user">Admin User</a>
    </div>

    <!-- BÀI 3 -->
    <div class="card">
        <h3>🔑 BÀI 3 – Đăng nhập</h3>
        <a class="btn btn-blue" href="auth/login">Trang đăng nhập</a>
    </div>

    <!-- BÀI 4 -->
    <c:if test="${not empty sessionScope.user and sessionScope.user.role == 0}">
        <div class="card">
            <h3>🧪 BÀI 4 – Test phân quyền</h3>
            <a class="btn btn-green" href="auth/edit-profile">Edit Profile</a>
            <a class="btn btn-green" href="video/share/1">Share Video</a>
            <a class="btn btn-red" href="admin/share">Admin Share</a>
        </div>
    </c:if>

    <footer>
        Lab 6 • Jakarta Servlet • JPA 3.2 • Role: 0 = ADMIN, 1 = USER
    </footer>

</div>

</body>
</html>
