<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="topbar">
  <div class="container inner">
    Tra cứu đơn hàng · Yêu thích
  </div>
</div>

<div class="nav">
  <div class="container row">
    <div class="brand">
      <a href="${pageContext.request.contextPath}/products">MySneakerShop</a>
    </div>

    <div class="menu">
      <a href="${pageContext.request.contextPath}/products">SẢN PHẨM</a>
      <a href="#">NAM</a>
      <a href="#">NỮ</a>
      <a href="#">SALE OFF</a>
    </div>

    <form class="search" action="${pageContext.request.contextPath}/products">
      <input type="text" name="q" placeholder="Tìm kiếm" value="${param.q}">
    </form>

    <!-- Nếu là admin thì mới hiện nút Quản trị -->
    <c:if test="${not empty sessionScope.user && sessionScope.user.role eq 'ADMIN'}">
      <a class="btn" href="${pageContext.request.contextPath}/products?action=admin"
         style="margin-left:8px">Quản trị</a>
    </c:if>

    <!-- Avatar / Đăng nhập -->
    <c:choose>
      <c:when test="${not empty sessionScope.user}">
        <a href="${pageContext.request.contextPath}/profile"
           style="margin-left:12px;display:flex;align-items:center;gap:8px;text-decoration:none;">
          <div style="width:32px;height:32px;border-radius:999px;overflow:hidden;
                                border:1px solid #ddd;display:flex;align-items:center;
                                justify-content:center;background:#f5f5f5;">
            <c:choose>
              <c:when test="${not empty sessionScope.user.avatar}">
            <img src="${pageContext.request.contextPath}/images/${sessionScope.user.avatar}"
                 alt="avatar" style="max-width:100%;max-height:100%;">
              </c:when>
              <c:otherwise>
                                <span style="font-size:16px;font-weight:700;">
                                    ${fn:toUpperCase(fn:substring(sessionScope.user.username,0,1))}
                                </span>
              </c:otherwise>
            </c:choose>
          </div>
          <span style="font-size:13px;">${sessionScope.user.username}</span>
        </a>

        <a class="btn" href="${pageContext.request.contextPath}/logout" style="margin-left:8px">
          Đăng xuất
        </a>
      </c:when>
      <c:otherwise>
        <a class="btn" href="${pageContext.request.contextPath}/login.jsp" style="margin-left:8px">
          Đăng nhập
        </a>
      </c:otherwise>
    </c:choose>
  </div>
</div>
