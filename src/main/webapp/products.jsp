<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,com.shop.model.Product,com.shop.model.User" %>
<%
  User user = (User) session.getAttribute("user");
  List<Product> products = (List<Product>) request.getAttribute("products");
  if (user == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Danh sách sản phẩm</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="index.jsp" />
<div class="container mt-5">
  <h3 class="text-center mb-4">Danh sách sản phẩm</h3>
  <% if (products == null || products.isEmpty()) { %>
  <p class="text-center text-muted">Không có sản phẩm nào để hiển thị.</p>
  <% } else { %>

  <div class="row">
    <% for (Product p : products) { %>
    <div class="col-md-4 mb-4">
      <div class="card h-100 shadow-sm">
        <img src="images/<%= p.getImage() %>" class="card-img-top" alt="<%= p.getName() %>"
             style="height: 250px; object-fit: cover;">
        <div class="card-body">
          <h5 class="card-title"><%= p.getName() %></h5>
          <p class="card-text text-muted"><%= p.getDescription() %></p>
          <p class="fw-bold text-danger">
            <%= String.format("%,.0f VND", p.getPrice()) %>
          </p>
          <a href="product-detail?id=<%= p.getId() %>" class="btn btn-outline-dark btn-sm">Xem chi tiết</a>
        </div>
      </div>
    </div>
    <% } %>
  </div>
  <% } %>
</div>
</body>
</html>
