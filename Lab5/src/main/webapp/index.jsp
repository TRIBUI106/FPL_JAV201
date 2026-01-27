<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang chủ | Lab5</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <span class="navbar-brand fw-bold">Lab5</span>

        <div class="d-flex align-items-center text-white">
            <span class="me-3">
                Xin chào, <strong>${sessionScope.user.fullname}</strong>
            </span>

            <a href="${pageContext.request.contextPath}/login"
               class="btn btn-outline-light btn-sm">
                Logout
            </a>
        </div>
    </div>
</nav>

<!-- CONTENT -->
<div class="container mt-5">
    <div class="row g-4">

        <!-- Visitors -->
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title">Lượt truy cập</h5>
                    <p class="display-6 fw-bold text-primary">
                        ${applicationScope.visitors}
                    </p>
                </div>
            </div>
        </div>

        <!-- Filter test -->
        <!-- Filter test -->
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title">Filter</h5>
                    <p class="text-muted">Test từng Filter</p>

                    <a href="${pageContext.request.contextPath}/test-filter1"
                       class="btn btn-outline-primary btn-sm mb-2 w-100">
                        Xem Filter 1
                    </a>

                    <a href="${pageContext.request.contextPath}/test-filter2"
                       class="btn btn-outline-success btn-sm w-100">
                        Xem Filter 2
                    </a>
                </div>
            </div>
        </div>


        <!-- Info -->
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title">Thông tin</h5>
                    <p class="text-muted">Java Web nâng cao</p>
                    <span class="badge bg-success">JDK 21</span>
                    <span class="badge bg-info">Tomcat 10</span>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>
