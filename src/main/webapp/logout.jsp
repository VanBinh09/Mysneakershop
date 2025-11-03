<%--
  Created by IntelliJ IDEA.
  User: Hi
  Date: 10/28/2025
  Time: 8:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%
  session.invalidate();
  response.sendRedirect("index.jsp");
%>

