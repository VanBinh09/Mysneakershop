<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 11/1/2025
  Time: 8:40 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản trị sản phẩm</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>

<jsp:include page="/WEB-INF/header.jsp"/>

<div class="container page">

    <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:16px">
        <h2>Danh sách sản phẩm</h2>
        <a href="${pageContext.request.contextPath}/product_form.jsp" class="btn primary">
            Thêm sản phẩm
        </a>
    </div>

    <table class="table">
        <thead>
        <tr>
            <th>ID</th><th>Tên</th><th>Giá</th><th>Ảnh</th><th>Mô tả</th><th>Thao tác</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="p" items="${products}">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td><fmt:formatNumber value="${p.price}"/> VND</td>
                <td><small>${p.image}</small></td>
                <td><small>${p.description}</small></td>

                <td>
                    <a class="btn" href="products?action=edit&id=${p.id}">Sửa</a>
                    <a class="btn" onclick="return confirm('Xóa sản phẩm này?')"
                       href="products?action=delete&id=${p.id}">
                        Xóa
                    </a>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>

</div>

<jsp:include page="/WEB-INF/footer.jsp"/>

</body>
</html>
