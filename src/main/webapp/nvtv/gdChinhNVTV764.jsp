<%@ page import="libman.model.ThanhVien764" %><%--
  Created by IntelliJ IDEA.
  User: vongn
  Date: 10/23/2024
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Giao diện chính nhân viên thư viện</title>
    <link rel="stylesheet" type="text/css" href="../style/gdChinhNVTVStyle.css">
</head>
<% ThanhVien764 nvtv = (ThanhVien764) session.getAttribute("nvtv");
    if(nvtv == null) {
        response.sendRedirect("gdDangnhap764.jsp?err=timeout");
    }
%>
<body>

<div class="container">
    <h2>Trang chủ Nhân viên thư viện </h2>
    <div class="menu-container">
        <h3>Xin chào, <%= nvtv.getHoTen() %></h3>
        <button class="register-button" onclick="location.href='gdChonbandoc764.jsp'">Nhận trả tài liệu</button>
    </div>
</div>

</body>
</html>
