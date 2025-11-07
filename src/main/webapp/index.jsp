<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.shop.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    String username = null;
    String role = null;
    if (user != null) {
        username = user.getUsername();
        role = user.getRole();
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>MySneakerShop</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">MySneakerShop</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">

                <% if (username == null) { %>
                <!-- Khi chưa đăng nhập -->
                <li class="nav-item"><a href="register.jsp" class="nav-link">Đăng ký</a></li>
                <li class="nav-item"><a href="login.jsp" class="nav-link">Đăng nhập</a></li>

                <% } else if ("admin".equalsIgnoreCase(role)) { %>
                <!-- Khi đăng nhập bằng admin -->
                <li class="nav-item"><a href="admin" class="nav-link">Quản lý</a></li>
                <li class="nav-item"><a href="index.jsp" class="nav-link text-warning">Trang chủ</a></li>
                <li class="nav-item"><a href="logout.jsp" class="nav-link text-danger">Đăng xuất</a></li>

                <% } else { %>
                <!-- Khi đăng nhập bằng user -->
                <li class="nav-item"><a href="profile.jsp" class="nav-link">Tài khoản</a></li>
                <li class="nav-item"><a href="logout.jsp" class="nav-link text-danger">Đăng xuất</a></li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section text-center text-white d-flex align-items-center justify-content-center">
    <div class="overlay"></div>
    <div class="container position-relative">
        <h1 class="fw-bold mb-3">Khám phá thế giới Sneaker đẳng cấp</h1>
        <p class="lead">Hàng trăm mẫu giày hot trend - chính hãng 100%</p>
        <a href="products.jsp" class="btn btn-light btn-lg mt-3">Mua ngay</a>
    </div>
</section>

<!-- Feature Section -->
<section class="features py-5 text-center bg-light">
    <div class="container">
        <h2 class="fw-bold mb-4">Tại sao chọn MySneakerShop?</h2>
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="feature-card p-4 shadow-sm rounded">
                    <img src="images/free-shipping.jpg" class="mb-3" width="200">
                    <h5>Giao hàng miễn phí</h5>
                    <p>Miễn phí vận chuyển toàn quốc cho đơn hàng trên 500k.</p>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="feature-card p-4 shadow-sm rounded">
                    <img src="images/verified.jpg" class="mb-3" width="200">
                    <h5>Cam kết chính hãng</h5>
                    <p>100% sản phẩm được nhập trực tiếp từ thương hiệu uy tín.</p>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="feature-card p-4 shadow-sm rounded">
                    <img src="images/support.jpg" class="mb-3" width="200">
                    <h5>Hỗ trợ tận tâm</h5>
                    <p>Đội ngũ CSKH luôn sẵn sàng hỗ trợ bạn 24/7.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Product Demo Section -->
<section class="py-5">
    <div class="container">
        <h2 class="fw-bold text-center mb-5">Sản phẩm nổi bật</h2>
        <div class="row g-4">
            <div class="col-md-3 col-sm-6">
                <div class="card product-card shadow-sm">
                    <img src="images/shoe1.jpg" class="card-img-top" alt="Shoe 1">
                    <div class="card-body text-center">
                        <h5 class="card-title">Nike Air Jordan 1</h5>
                        <p class="card-text text-danger fw-bold">3.200.000₫</p>
                        <a href="products.jsp" class="btn btn-outline-dark btn-sm">Xem chi tiết</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="card product-card shadow-sm">
                    <img src="images/shoe2.jpg" class="card-img-top" alt="Shoe 2">
                    <div class="card-body text-center">
                        <h5 class="card-title">Adidas Ultraboost</h5>
                        <p class="card-text text-danger fw-bold">2.800.000₫</p>
                        <a href="products.jsp" class="btn btn-outline-dark btn-sm">Xem chi tiết</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="card product-card shadow-sm">
                    <img src="images/shoe3.jpg" class="card-img-top" alt="Shoe 3">
                    <div class="card-body text-center">
                        <h5 class="card-title">Puma RS-X</h5>
                        <p class="card-text text-danger fw-bold">2.500.000₫</p>
                        <a href="products.jsp" class="btn btn-outline-dark btn-sm">Xem chi tiết</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="card product-card shadow-sm">
                    <img src="images/shoe4.jpg" class="card-img-top" alt="Shoe 4">
                    <div class="card-body text-center">
                        <h5 class="card-title">Converse Chuck 70</h5>
                        <p class="card-text text-danger fw-bold">1.800.000₫</p>
                        <a href="products.jsp" class="btn btn-outline-dark btn-sm">Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Blog Section -->
<section class="blog-section bg-light py-5">
    <div class="container">
        <h2 class="fw-bold text-center mb-5">Tin tức & Bài viết</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card border-0 shadow-sm">
                    <img src="images/blog1.jpg" class="card-img-top" alt="Blog 1">
                    <div class="card-body">
                        <h5 class="card-title">Top 5 đôi sneaker đáng mua nhất 2025</h5>
                        <p class="card-text">Khám phá những đôi giày đang "làm mưa làm gió" trong giới trẻ năm nay.</p>
                        <a href="#" class="btn btn-outline-dark btn-sm">Đọc thêm</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-0 shadow-sm">
                    <img src="images/blog2.jpg" class="card-img-top" alt="Blog 2">
                    <div class="card-body">
                        <h5 class="card-title">Bí quyết bảo quản giày luôn như mới</h5>
                        <p class="card-text">Giữ cho đôi sneaker của bạn luôn sạch đẹp với 5 mẹo đơn giản.</p>
                        <a href="#" class="btn btn-outline-dark btn-sm">Đọc thêm</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-0 shadow-sm">
                    <img src="images/blog3.jpg" class="card-img-top" alt="Blog 3">
                    <div class="card-body">
                        <h5 class="card-title">Phong cách streetwear cùng sneaker</h5>
                        <p class="card-text">Kết hợp sneaker với outfit đường phố - cá tính và nổi bật.</p>
                        <a href="#" class="btn btn-outline-dark btn-sm">Đọc thêm</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-3">
    <p class="mb-0">&copy; 2025 MySneakerShop. All rights reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
