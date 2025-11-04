<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đăng nhập</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5" style="max-width: 400px;">
  <h3 class="text-center mb-4">Đăng nhập</h3>
  <% if (request.getAttribute("error") != null) { %>
  <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
  <% } %>
  <% if (request.getParameter("success") != null) { %>
  <div class="alert alert-success">Đăng ký thành công, mời đăng nhập!</div>
  <% } %>
  <form action="login" method="post">
    <div class="mb-3">
      <label class="form-label">Tên đăng nhập</label>
      <input type="text" name="username" class="form-control" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Mật khẩu</label>
      <input type="password" name="password" class="form-control" required>
    </div>
    <button class="btn btn-primary w-100">Đăng nhập</button>
    <p class="mt-3 text-center">Chưa có tài khoản? <a href="register.jsp">Đăng ký</a></p>
  </form>
</div>
</body>
</html>
