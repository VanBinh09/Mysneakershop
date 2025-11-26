<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<%@ page import="com.shop.model.User" %>--%>
<%--<%--%>
<%--    User user = (User) session.getAttribute("user");--%>
<%--    String username = null;--%>
<%--    String role = null;--%>
<%--    if (user != null) {--%>
<%--        username = user.getUsername();--%>
<%--        role = user.getRole();--%>
<%--    }--%>
<%--%>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="vi">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Trang chủ - My Sneaker Shop</title>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <link rel="stylesheet" href="css/style.css">--%>
<%--</head>--%>
<%--<body>--%>

<%--<!-- NAVBAR -->--%>
<%--<nav class="navbar navbar-expand-lg navbar-dark bg-dark">--%>
<%--    <div class="container">--%>
<%--        <a class="navbar-brand" href="index.jsp">SneakerShop</a>--%>
<%--        <div class="collapse navbar-collapse" id="navbarNav">--%>
<%--            <ul class="navbar-nav ms-auto">--%>
<%--                <li class="nav-item"><a href="index.jsp" class="nav-link">Trang chủ</a></li>--%>
<%--                <li class="nav-item"><a href="products.jsp" class="nav-link">Sản phẩm</a></li>--%>

<%--                <% if (username == null) { %>--%>
<%--                <!-- Khi chưa đăng nhập -->--%>
<%--                <li class="nav-item"><a href="register.jsp" class="nav-link">Đăng ký</a></li>--%>
<%--                <li class="nav-item"><a href="login.jsp" class="nav-link">Đăng nhập</a></li>--%>
<%--                <% } else if ("ADMIN".equalsIgnoreCase(role)) { %>--%>
<%--                <!-- Khi là admin -->--%>
<%--                <li class="nav-item"><a href="admin-dashboard.jsp" class="nav-link text-warning">Quản trị</a></li>--%>
<%--                <li class="nav-item"><a href="logout" class="nav-link">Đăng xuất</a></li>--%>
<%--                <% } else { %>--%>
<%--                <!-- Khi là user -->--%>
<%--                <li class="nav-item"><a href="profile.jsp" class="nav-link">Xin chào, <%= username %></a></li>--%>
<%--                <li class="nav-item"><a href="logout" class="nav-link">Đăng xuất</a></li>--%>
<%--                <% } %>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>

<%--<!-- HERO -->--%>
<%--<header class="hero-section text-center py-5">--%>
<%--    <div class="container">--%>
<%--        <h1>Chào mừng đến với Sneaker Shop</h1>--%>
<%--        <p>Mua giày chính hãng - phong cách và chất lượng!</p>--%>
<%--        <a href="products.jsp" class="btn btn-primary mt-3">Xem sản phẩm</a>--%>
<%--    </div>--%>
<%--</header>--%>

<%--<!-- SẢN PHẨM DEMO -->--%>
<%--<main class="container my-5">--%>
<%--    <div class="row text-center">--%>
<%--        <div class="col-md-4">--%>
<%--            <div class="card product-card">--%>
<%--                <img src="images/shoe1.jpg" class="card-img-top">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title">Nike Air Max</h5>--%>
<%--                    <p class="text-muted">2.500.000 VNĐ</p>--%>
<%--                    <a href="products.jsp" class="btn btn-outline-dark btn-sm">Xem chi tiết</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="col-md-4">--%>
<%--            <div class="card product-card">--%>
<%--                <img src="images/shoe2.jpg" class="card-img-top">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title">Adidas Ultraboost</h5>--%>
<%--                    <p class="text-muted">3.200.000 VNĐ</p>--%>
<%--                    <a href="products.jsp" class="btn btn-outline-dark btn-sm">Xem chi tiết</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="col-md-4">--%>
<%--            <div class="card product-card">--%>
<%--                <img src="images/shoe3.jpg" class="card-img-top">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title">Puma Classic</h5>--%>
<%--                    <p class="text-muted">2.000.000 VNĐ</p>--%>
<%--                    <a href="products.jsp" class="btn btn-outline-dark btn-sm">Xem chi tiết</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</main>--%>

<%--<!-- FOOTER -->--%>
<%--<footer>--%>
<%--    <p>© 2025 SneakerShop. All rights reserved.</p>--%>
<%--</footer>--%>

<%--</body>--%>
<%--</html>--%>

<%
    response.sendRedirect("logout");
%>
