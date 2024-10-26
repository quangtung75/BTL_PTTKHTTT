<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng Nhập</title>
    <link rel="stylesheet" type="text/css" href="style/gdDangnhapStyle.css">
</head>

<body>
<div class="container">
    <h1>Hệ thống quản lý thư viện LibMan</h1>
    <h2>Đăng nhập</h2>
    <form name="dangnhap" action="doDangnhap.jsp" method="post">
        <table border="0">
            <tr>
                <td>Tên đăng nhập:</td>
                <td><input type="text" name="username" id="username" required /></td>
            </tr>
            <tr>
                <td>Mật khẩu:</td>
                <td><input type="password" name="password" id="password" required /></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Đăng nhập" /></td>
            </tr>
        </table>
    </form>
    <%
        if(request.getParameter("err") != null &&
                request.getParameter("err").equalsIgnoreCase("timeout")) {
    %>
    <div class="error">Hết phiên làm việc. Làm ơn đăng nhập lại!</div>
    <%
    } else if(request.getParameter("err") != null &&
            request.getParameter("err").equalsIgnoreCase("fail")) {
    %>
    <div class="error">Sai tên đăng nhập/mật khẩu!</div>
    <%
        }
    %>
</div>
</body>
</html>
