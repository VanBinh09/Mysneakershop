<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>${empty product ? "Thêm sản phẩm" : "Cập nhật sản phẩm"}</title>
  <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>

<jsp:include page="/WEB-INF/header.jsp"/>

<div class="container">
  <form class="form" method="post" action="${pageContext.request.contextPath}/products">

    <h2>${empty product ? "Thêm sản phẩm" : "Cập nhật sản phẩm"}</h2>

    <c:if test="${not empty error}">
      <div style="color:red;margin-bottom:10px">${error}</div>
    </c:if>

    <input type="hidden" name="id" value="${product.id}">

    <label>Tên</label>
    <input type="text" name="name" value="${product.name}" required>

    <label>Giá (VND)</label>
    <input type="number" name="price" value="${product.price}" required step="100">

    <label>Ảnh (URL)</label>
    <input type="text" name="image" value="${product.image}">

    <label>Mô tả</label>
    <textarea name="description">${product.description}</textarea>

    <button class="btn primary block">Lưu</button>

    <div style="margin-top:8px">
      <a href="${pageContext.request.contextPath}/products?action=admin">Quay lại</a>
    </div>

  </form>
</div>

<jsp:include page="/WEB-INF/footer.jsp"/>

</body>
</html>
