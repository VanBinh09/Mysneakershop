<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đăng nhập - MySneakerShop</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
  <div class="card mx-auto" style="max-width:400px;">
    <div class="card-body">
      <h3 class="text-center mb-4">Đăng nhập</h3>
      <form action="login" method="post">
        <div class="mb-3">
          <label class="form-label">Tên đăng nhập</label>
          <input type="text" name="username" class="form-control" required>
        </div>
        <div class="mb-3">
          <label class="form-label">Mật khẩu</label>
          <input type="password" name="password" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
      </form>
      <% if (request.getAttribute("error") != null) { %>
      <div class="alert alert-danger mt-3">
        <%= request.getAttribute("error") %>
      </div>
      <% } %>
      <p class="text-center mt-3">
        Chưa có tài khoản? <a href="register.jsp">Đăng ký</a>
      </p>
    </div>
  </div>
</div>
</body>
</html>
