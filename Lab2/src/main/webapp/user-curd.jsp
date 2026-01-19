<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Manager - Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

    <style>
        :root {
            --nen-xanh-nhat: #f0f2f5;
            --mau-chu-chinh: #333;
            --bo-goc-lon: 20px;
            --bo-goc-nho: 12px;
            --do-bong: 0 10px 30px rgba(0,0,0,0.08);
        }

        body {
            background: var(--nen-xanh-nhat);
            font-family: 'Segoe UI', sans-serif;
            color: var(--mau-chu-chinh);
        }

        /* Thẻ card chính bao ngoài */
        .main-card {
            border: none;
            border-radius: var(--bo-goc-lon);
            box-shadow: var(--do-bong);
            overflow: hidden;
        }

        /* Khu vực nhập liệu bên trái */
        .form-section {
            background: #ffffff;
            padding: 30px;
        }

        /* Khu vực danh sách bên phải */
        .table-section {
            background: #fafafa;
            padding: 30px;
            border-left: 1px solid #eee;
        }

        /* Ô nhập liệu */
        .form-control {
            border-radius: var(--bo-goc-nho);
            border: 1px solid #e0e0e0;
            padding: 12px;
        }

        /* Nút bấm */
        .btn-custom {
            border-radius: 10px;
            padding: 10px 20px;
            transition: 0.3s;
        }

        .btn-custom:hover {
            transform: translateY(-2px);
        }

        /* Tem (Badge) cho vai trò */
        .badge-admin {
            background: #ffe5e5;
            color: #ff4d4d;
            border-radius: 8px;
            padding: 5px 12px;
                font-weight: bold; }
        .badge-user {
            background: #e5f1ff;
            color: #007bff;
            border-radius: 8px;
            padding: 5px 12px;
            font-weight: bold; }
    </style>
</head>
<body>

<c:url var="url" value="/user"/>

<div class="container py-5">
    <div class="main-card card">
        <div class="row g-0">
            <div class="col-md-5 form-section">
                <h4 class="fw-bold mb-4">
                    <i class="bi bi-pencil-square me-2 text-primary"></i>
                    ${isEdit ? 'Sửa thông tin' : 'Thêm thành viên'}
                </h4>

                <form method="post">
                    <div class="mb-3">
                        <label class="form-label small text-muted">Mã ID</label>
                        <input type="text" name="id" class="form-control fw-bold" value="${user.id}" ${isEdit ? 'readonly' : ''}>
                    </div>
                    <div class="mb-3">
                        <label class="form-label small text-muted">Họ và tên</label>
                        <input type="text" name="fullname" class="form-control" value="${user.fullname}">
                    </div>
                    <div class="mb-3">
                        <label class="form-label small text-muted">Email</label>
                        <input type="email" name="email" class="form-control" value="${user.email}">
                    </div>
                    <div class="mb-3">
                        <label class="form-label small text-muted">Mật khẩu</label>
                        <input type="password" name="password" class="form-control" value="${user.password}">
                    </div>

                    <div class="mb-4">
                        <label class="form-label small text-muted d-block">Vai trò</label>
                        <div class="form-check form-check-inline mt-1">
                            <input class="form-check-input" type="radio" name="admin" value="true" ${user.admin ? 'checked' : ''}>
                            <label class="form-check-label">Quản trị</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="admin" value="false" ${(!empty user and !user.admin) ? 'checked' : ''}>
                            <label class="form-check-label">Thành viên</label>
                        </div>
                    </div>

                    <div class="d-flex flex-wrap gap-2">
                        <c:choose>
                            <c:when test="${isEdit}">
                                <button formaction="${url}/update" class="btn btn-primary btn-custom flex-grow-1">Cập nhật</button>
                            </c:when>
                            <c:otherwise>
                                <button formaction="${url}/create" class="btn btn-primary btn-custom flex-grow-1">Thêm mới</button>
                            </c:otherwise>
                        </c:choose>
                        <button formaction="${url}/delete" class="btn btn-outline-danger btn-custom" ${empty user.id ? 'disabled' : ''}>Xóa</button>
                        <a href="${url}" class="btn btn-light btn-custom border">Reset</a>
                    </div>
                </form>
            </div>

            <div class="col-md-7 table-section">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h5 class="fw-bold m-0 text-secondary">Danh sách hiện tại</h5>
                    <span class="badge bg-white text-dark border rounded-pill px-3 py-2 shadow-sm">
                        ${users.size()} users
                    </span>
                </div>

                <div class="table-responsive">
                    <table class="table table-borderless align-middle">
                        <thead class="text-muted small">
                        <tr class="border-bottom">
                            <th>THÔNG TIN</th>
                            <th>VAI TRÒ</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${users}" var="u">
                            <tr class="border-bottom">
                                <td class="py-3">
                                    <div class="fw-bold text-dark">${u.fullname}</div>
                                    <div class="text-muted small">${u.email}</div>
                                </td>
                                <td>
                                        <span class="${u.admin ? 'badge-admin' : 'badge-user'} small text-uppercase">
                                                ${u.admin ? 'Admin' : 'User'}
                                        </span>
                                </td>
                                <td class="text-end">
                                    <a href="${url}/edit/${u.id}" class="btn btn-sm btn-white border rounded-circle shadow-sm">
                                        <i class="bi bi-pencil text-primary"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>