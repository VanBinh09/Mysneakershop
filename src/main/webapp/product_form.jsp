<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.shop.model.Product" %>
<%
  Product p = (Product) request.getAttribute("product");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title><%= (p == null ? "Thêm" : "Sửa") %> sản phẩm</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <h3 class="text-center mb-3"><%= (p == null ? "Thêm mới" : "Chỉnh sửa") %> sản phẩm</h3>
  <form action="products" method="post">
    <input type="hidden" name="id" value="<%= (p != null ? p.getId() : "") %>">
    <div class="mb-3">
      <label class="form-label">Tên sản phẩm</label>
      <input type="text" name="name" class="form-control" value="<%= (p != null ? p.getName() : "") %>" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Giá</label>
      <input type="number" name="price" class="form-control" step="0.01" value="<%= (p != null ? p.getPrice() : "") %>" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Ảnh (tên file trong thư mục images/)</label>
      <input type="text" name="image" class="form-control" value="<%= (p != null ? p.getImage() : "") %>">
    </div>
    <div class="mb-3">
      <label class="form-label">Mô tả</label>
      <textarea name="description" class="form-control" rows="3"><%= (p != null ? p.getDescription() : "") %></textarea>
    </div>
    <button type="submit" class="btn btn-primary">Lưu</button>
    <a href="products?action=admin" class="btn btn-secondary">Hủy</a>
  </form>
</div>
</body>
</html>
