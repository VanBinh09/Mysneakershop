<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Sản phẩm</title>
  <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<jsp:include page="/WEB-INF/header.jsp"/>

<div class="container page">
  <div class="banner">FREE SHIPPING</div>

  <!-- Thanh sắp xếp -->
  <div class="sortbar">
    <form method="get" action="${pageContext.request.contextPath}/products" style="display:flex;gap:8px">
      <input type="hidden" name="q" value="${fn:escapeXml(param.q)}"/>
      <label>Sắp xếp:</label>

      <select name="sort">
        <option value="id" ${sort=='id' ? 'selected' : ''}>Mới nhất</option>
        <option value="name" ${sort=='name' ? 'selected' : ''}>Tên</option>
        <option value="price" ${sort=='price' ? 'selected' : ''}>Giá</option>
      </select>

      <select name="order">
        <option value="asc" ${order=='asc' ? 'selected' : ''}>Tăng dần</option>
        <option value="desc" ${order=='desc' ? 'selected' : ''}>Giảm dần</option>
      </select>

      <button class="btn">Áp dụng</button>
    </form>

    <div style="margin-left:auto;color:#6b7280">
      Tổng: <strong>${total}</strong> sản phẩm
    </div>
  </div>

  <div class="grid">

    <!-- Sidebar -->
    <aside class="sidebar">
      <div class="card">
        <h4>TẤT CẢ</h4>
        <div class="badge">Accessories</div>
        <div class="badge">Apparel</div>
        <div class="badge">Footwear</div>
        <div class="badge">Skateboard</div>
      </div>

      <div class="card">
        <h4>TRẠNG THÁI</h4>
        <div class="badge">Limited Edition</div>
        <div class="badge">Online Only</div>
        <div class="badge">Sale off</div>
      </div>

      <div class="card">
        <h4>KIỂU DÁNG</h4>
        <div class="badge">Low Top</div>
        <div class="badge">High Top</div>
        <div class="badge">Slip-on</div>
      </div>
    </aside>

    <!-- PRODUCTS LIST -->
    <section>
      <div class="products">

        <c:forEach var="p" items="${products}">
          <a class="card-p" href="${pageContext.request.contextPath}/product-detail?id=${p.id}">

            <div class="img">
              <!-- FIX: luôn load từ thư mục /images -->
              <img src="${pageContext.request.contextPath}/images/${empty p.image ? 'ao-thun.jpg' : p.image}"
                   alt="${p.name}">
            </div>

            <div class="body">
              <div style="min-height:44px">
                <strong>${p.name}</strong>
              </div>

              <div class="price">
                <fmt:formatNumber value="${p.price}" /> VND
              </div>
            </div>

          </a>
        </c:forEach>

        <c:if test="${empty products}">
          <div>Không có sản phẩm.</div>
        </c:if>

      </div>

      <!-- PAGINATION -->
      <c:if test="${totalPages > 1}">
        <div class="pagination">
          <c:set var="ctx" value="${pageContext.request.contextPath}"/>

          <c:choose>
            <c:when test="${page > 1}">
              <a href="${ctx}/products?page=${page-1}&sort=${sort}&order=${order}&q=${q}">
                « Trước
              </a>
            </c:when>
            <c:otherwise>
              <span>« Trước</span>
            </c:otherwise>
          </c:choose>

          <c:forEach begin="1" end="${totalPages}" var="i">
            <c:choose>
              <c:when test="${i == page}">
                <span class="current">${i}</span>
              </c:when>
              <c:otherwise>
                <a href="${ctx}/products?page=${i}&sort=${sort}&order=${order}&q=${q}">
                    ${i}
                </a>
              </c:otherwise>
            </c:choose>
          </c:forEach>

          <c:choose>
            <c:when test="${page < totalPages}">
              <a href="${ctx}/products?page=${page+1}&sort=${sort}&order=${order}&q=${q}">
                Sau »
              </a>
            </c:when>
            <c:otherwise>
              <span>Sau »</span>
            </c:otherwise>
          </c:choose>

        </div>
      </c:if>

    </section>

  </div>
</div>

<jsp:include page="/WEB-INF/footer.jsp"/>

</body>
</html>
