<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Đăng nhập</title>
  <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>

<jsp:include page="/WEB-INF/header.jsp"/>

<div class="container">

  <form class="form" method="post" action="login">
    <h2>Đăng nhập</h2>

    <c:if test="${not empty error}">
      <div style="color:red">${error}</div>
    </c:if>

    <label>Tài khoản</label>
    <input type="text" name="username" required>

    <label>Mật khẩu</label>
    <input type="password" name="password" required>

    <button class="btn primary block">Đăng nhập</button>

    <div style="margin-top:8px">
      Chưa có tài khoản?
      <a href="register.jsp">Đăng ký</a>
    </div>
  </form>

</div>

<jsp:include page="/WEB-INF/footer.jsp"/>

</body>
</html>
