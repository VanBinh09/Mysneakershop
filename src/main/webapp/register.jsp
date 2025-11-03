<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 10/28/2025
  Time: 8:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đăng ký - MySneakerShop</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
  <div class="card mx-auto" style="max-width:400px;">
    <div class="card-body">
      <h3 class="text-center mb-4">Đăng ký tài khoản</h3>
      <form action="register" method="post">
        <div class="mb-3">
          <label class="form-label">Tên đăng nhập</label>
          <input type="text" name="username" class="form-control" required>
        </div>
        <div class="mb-3">
          <label class="form-label">Mật khẩu</label>
          <input type="password" name="password" class="form-control" required>
        </div>
        <div class="mb-3">
          <label class="form-label">Email</label>
          <input type="email" name="email" class="form-control">
        </div>
        <button type="submit" class="btn btn-success w-100">Đăng ký</button>
      </form>
      <% if (request.getAttribute("error") != null) { %>
      <div class="alert alert-danger mt-3">
        <%= request.getAttribute("error") %>
      </div>
      <% } %>
      <p class="text-center mt-3">
        Đã có tài khoản? <a href="login.jsp">Đăng nhập</a>
      </p>
    </div>
  </div>
</div>
</body>
</html>
