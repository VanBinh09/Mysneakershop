<%@ page import="com.shop.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
  Product product = (Product) request.getAttribute("product");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title><%= product != null ? product.getName() : "Chi tiết sản phẩm" %></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
  <% if (product == null) { %>
  <h4 class="text-center text-muted">Không tìm thấy sản phẩm.</h4>
  <% } else { %>
  <div class="row justify-content-center align-items-center">
    <div class="col-md-5 text-center">
      <img src="images/<%= product.getImage() %>"
           alt="<%= product.getName() %>"
           class="img-fluid rounded shadow"
           style="max-height: 350px; object-fit: cover;">
    </div>
    <div class="col-md-6">
      <h2><%= product.getName() %></h2>
      <h4 class="text-success"><%= product.getPrice() %> VNĐ</h4>
      <p class="mt-4"><%= product.getDescription() %></p>
      <a href="products.jsp" class="btn btn-secondary mt-3">Quay lại</a>
    </div>
  </div>
  <% } %>
</div>

</body>
</html>
