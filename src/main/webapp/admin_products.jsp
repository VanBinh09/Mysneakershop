<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 11/1/2025
  Time: 8:40 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,com.shop.model.Product,com.shop.model.User" %>

<%
    User user = (User) session.getAttribute("username");
    if (user == null || !"ADMIN".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Product> products = (List<Product>) request.getAttribute("products");
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h3 class="text-center mb-3">QUẢN LÝ SẢN PHẨM</h3>
    <a href="product_form.jsp" class="btn btn-success mb-3">+ Thêm sản phẩm</a>

    <table class="table table-bordered text-center align-middle">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Tên sản phẩm</th>
            <th>Đơn giá</th>
            <th>Ảnh</th>
            <th>Mô tả</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <% if (products != null && !products.isEmpty()) {
            for (Product p : products) { %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getName() %></td>
            <td><%= String.format("%,.0f VND", p.getPrice()) %></td>
            <td><img src="images/<%= p.getImage() %>" width="80" height="80" style="object-fit:cover;"></td>
            <td><%= p.getDescription() %></td>
            <td>
                <a href="products?action=edit&id=<%= p.getId() %>" class="btn btn-warning btn-sm">Sửa</a>
                <a href="products?action=delete&id=<%= p.getId() %>" class="btn btn-danger btn-sm"
                   onclick="return confirm('Bạn có chắc muốn xóa?');">Xóa</a>
            </td>
        </tr>
        <% } } else { %>
        <tr><td colspan="6" class="text-muted">Chưa có sản phẩm nào.</td></tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
