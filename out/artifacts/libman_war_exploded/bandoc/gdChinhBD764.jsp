<%--
  Created by IntelliJ IDEA.
  User: vongn
  Date: 10/23/2024
  Time: 10:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="libman.model.ThanhVien764"%>

<html>
<head>
    <title>Trang chủ Bạn đọc</title>
    <link rel="stylesheet" type="text/css" href="../style/gdChinhBDStyle.css">
</head>
<body>
    <% ThanhVien764 bd = (ThanhVien764) session.getAttribute("bandoc");
        if(bd == null) {
            response.sendRedirect("gdDangnhap764.jsp?err=timeout");
        }
    %>
    <h2>Trang chủ Bạn đọc </h2>
    <h3>Xin chào <%= bd.getHoTen() %></h3>
    <div class="button-container">
        <button class="register-button" onclick="location.href='gdDangkythe764.jsp'">Đăng ký làm thẻ bạn đọc</button>
    </div>
</body>
</html>
