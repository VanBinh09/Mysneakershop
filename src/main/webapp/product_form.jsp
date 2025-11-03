<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.shop.model.Product" %>
<%
  Product p = (Product) request.getAttribute("editProduct");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title><%= p != null ? "Cập nhật" : "Thêm mới" %> sản phẩm</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5" style="max-width:600px;">
  <h3 class="text-center mb-4"><%= p != null ? "Cập nhật" : "Thêm mới" %> sản phẩm</h3>
  <form action="products" method="post">
    <% if (p != null) { %>
    <input type="hidden" name="id" value="<%= p.getId() %>">
    <% } %>
    <div class="mb-3">
      <label class="form-label">Tên sản phẩm</label>
      <input type="text" name="name" value="<%= p != null ? p.getName() : "" %>" class="form-control" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Giá</label>
      <input type="number" name="price" value="<%= p != null ? p.getPrice() : "" %>" class="form-control" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Ảnh (URL)</label>
      <input type="text" name="image" value="<%= p != null ? p.getImage() : "" %>" class="form-control">
    </div>
    <div class="mb-3">
      <label class="form-label">Mô tả</label>
      <textarea name="description" class="form-control" rows="3"><%= p != null ? p.getDescription() : "" %></textarea>
    </div>
    <button type="submit" class="btn btn-primary w-100"><%= p != null ? "Cập nhật" : "Thêm mới" %></button>
  </form>
</div>
</body>
</html>
