<%--
  Created by IntelliJ IDEA.
  User: nguyenhau
  Date: 26/1/26
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập | Lab5</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="col-md-4">
        <div class="card shadow-lg border-0 rounded-4">
            <div class="card-body p-4">

                <h3 class="text-center fw-bold mb-4">Đăng nhập</h3>

                <!-- Thông báo lỗi -->
                <c:if test="${not empty error}">
                    <div class="alert alert-danger text-center py-2">
                            ${error}
                    </div>
                </c:if>

                <form method="post" action="login">
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input type="text" name="username"
                               class="form-control"
                               placeholder="Nhập username"
                               required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="password"
                               class="form-control"
                               placeholder="Nhập mật khẩu"
                               required>
                    </div>

                    <button type="submit"
                            class="btn btn-primary w-100 py-2 fw-semibold">
                        Đăng nhập
                    </button>
                </form>

            </div>
        </div>

        <p class="text-center text-muted mt-3 small">
            Lab 5 – Java Web Nâng Cao
        </p>
    </div>
</div>

</body>
</html>
