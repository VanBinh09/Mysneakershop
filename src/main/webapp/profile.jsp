<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 11/20/2025
  Time: 10:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Tài khoản của tôi</title>
  <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<jsp:include page="/WEB-INF/header.jsp"/>

<div class="container page">
  <div style="max-width:720px;margin:0 auto;display:grid;grid-template-columns:220px 1fr;gap:24px">

    <!-- Avatar + username -->
    <div style="text-align:center">
      <div style="width:120px;height:120px;border-radius:999px;overflow:hidden;margin:0 auto 12px;
                        border:1px solid #eee;display:flex;align-items:center;justify-content:center;
                        background:#f5f5f5;">
        <c:choose>
          <c:when test="${not empty user.avatar}">
            <!-- SỬA Ở ĐÂY -->
            <img src="${pageContext.request.contextPath}/images/${user.avatar}"
                 alt="avatar" style="max-width:100%;max-height:100%;">
          </c:when>
          <c:otherwise>
                        <span style="font-size:48px;font-weight:700;">
                            ${fn:toUpperCase(fn:substring(user.username,0,1))}
                        </span>
          </c:otherwise>
        </c:choose>
      </div>
      <div style="font-weight:700">${user.username}</div>
      <div style="color:#6b7280;font-size:13px">${user.email}</div>
    </div>

    <!-- Form thông tin -->
    <div>
      <h2>Thông tin tài khoản</h2>

      <c:if test="${not empty success}">
        <div style="color:#16a34a;margin:8px 0">${success}</div>
      </c:if>
      <c:if test="${not empty error}">
        <div style="color:#b91c1c;margin:8px 0">${error}</div>
      </c:if>

      <form method="post" action="profile" class="form" style="margin:16px 0 0 0;border:none;padding:0">
        <label>Họ và tên</label>
        <input type="text" name="fullName" value="${user.fullName}"/>

        <label>Email</label>
        <input type="email" name="email" value="${user.email}"/>

        <label>Số điện thoại</label>
        <input type="text" name="phone" value="${user.phone}"/>

        <label>Ngày sinh</label>
        <input type="date" name="birthDate"
               value="<c:out value='${user.birthDate}'/>"/>

        <label>Địa chỉ</label>
        <input type="text" name="address" value="${user.address}"/>

        <label>Ảnh avatar (đường dẫn)</label>
        <input type="text" name="avatar" value="${user.avatar}" placeholder="vd: images/avatar1.png"/>

        <button type="submit" class="btn primary block" style="margin-top:12px">
          Lưu thay đổi
        </button>
      </form>
    </div>

  </div>
</div>

<jsp:include page="/WEB-INF/footer.jsp"/>

</body>
</html>
