<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>${product.name}</title>
  <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>

<jsp:include page="/WEB-INF/header.jsp"/>

<div class="container page">

  <div style="display:grid;grid-template-columns:1fr 1fr;gap:24px">

    <div class="card-p">
      <div class="img" style="aspect-ratio:1/1.05">
        <!-- FIX: luôn load từ /images -->
        <img src="${pageContext.request.contextPath}/images/${empty product.image ? 'ao-thun.jpg' : product.image}"
             alt="${product.name}">
      </div>
    </div>

    <div>
      <h1>${product.name}</h1>

      <div class="price" style="font-size:24px;margin:10px 0">
        <fmt:formatNumber value="${product.price}"/> VND
      </div>

      <p style="color:#555">${product.description}</p>

      <div style="margin-top:12px;display:flex;gap:12px">
        <button class="btn primary">Thêm vào giỏ</button>
        <a class="btn" href="${pageContext.request.contextPath}/products">Tiếp tục mua sắm</a>
      </div>
    </div>

  </div>

</div>

<jsp:include page="/WEB-INF/footer.jsp"/>

</body>
</html>
