<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 10/28/2025
  Time: 8:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.shop.model.*, com.shop.dao.ProductDAO, java.util.*" %>
<%
  User user = (User) session.getAttribute("user");
  if (user == null || !"ADMIN".equals(user.getRole())) {
    response.sendRedirect("../login.jsp");
    return;
  }


%>
<!DOCTYPE html>
<html>
<head>
  <title>Quản lý sản phẩm - Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-4">
  <h2 class="mb-4">Quản lý sản phẩm</h2>
  <form action="../admin" method="post" class="mb-4 border p-3 bg-white rounded">
    <input type="hidden" name="action" value="add">
    <div class="row g-3">
      <div class="col-md-3"><input name="name" class="form-control" placeholder="Tên sản phẩm" required></div>
      <div class="col-md-2"><input name="price" type="number" step="0.01" class="form-control" placeholder="Giá" required></div>
      <div class="col-md-3"><input name="image_url" class="form-control" placeholder="URL hình ảnh"></div>
      <div class="col-md-3"><input name="description" class="form-control" placeholder="Mô tả"></div>
      <div class="col-md-1"><button class="btn btn-dark w-100">Thêm</button></div>
    </div>
  </form>

  <table class="table table-striped bg-white shadow-sm">
    <thead class="table-dark">
    <tr>
      <th>ID</th><th>Tên</th><th>Giá</th><th>Hình ảnh</th><th>Mô tả</th><th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <% for (Product p : list) { %>
    <tr>
      <td><%=p.getId()%></td>
      <td><%=p.getName()%></td>
      <td><%=p.getPrice()%></td>
      <td><img src="<%=p.getImageUrl()%>" width="80" height="80"></td>
      <td><%=p.getDescription()%></td>
      <td>
        <form action="../admin" method="post" style="display:inline;">
          <input type="hidden" name="action" value="delete">
          <input type="hidden" name="id" value="<%=p.getId()%>">
          <button class="btn btn-sm btn-danger">Xóa</button>
        </form>
      </td>
    </tr>
    <% } %>
    </tbody>
  </table>
</div>
</body>
</html>
