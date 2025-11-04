<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.shop.model.User" %>
<%
    User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>MySneakerShop</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">MySneakerShop</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <% if (user == null) { %>
                <li class="nav-item"><a href="login.jsp" class="nav-link">Đăng nhập</a></li>
                <li class="nav-item"><a href="register.jsp" class="nav-link">Đăng ký</a></li>
                <% } else { %>
                <li class="nav-item"><a href="products" class="nav-link">Sản phẩm</a></li>
                <% if ("admin".equals(user.getRole())) { %>
                <li class="nav-item"><a href="admin_products.jsp" class="nav-link">Quản lý</a></li>
                <% } %>
                <li class="nav-item"><a href="logout.jsp" class="nav-link text-danger">Đăng xuất</a></li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

<div class="container text-center mt-5">
    <h2>Chào mừng đến với <strong>MySneakerShop</strong></h2>
    <p class="text-muted">Cửa hàng giày Sneaker chính hãng giá tốt</p>
    <a href="products" class="btn btn-primary">Xem sản phẩm</a>
</div>
</body>
</html>
