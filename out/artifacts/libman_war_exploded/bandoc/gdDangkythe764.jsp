<%@ page import="libman.model.ThanhVien764" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="libman.model.TheBanDoc764" %>
<%@ page import="java.util.Date" %>
<%@ page import="libman.model.BanDoc764" %>
<%@ page import="libman.dao.TheBanDoc764DAO" %><%--
  Created by IntelliJ IDEA.
  User: vongn
  Date: 10/24/2024
  Time: 4:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trang đăng ký thẻ</title>
    <link rel="stylesheet" type="text/css" href="../style/gdDangkythe764Style.css">
    <script>
        function previewImage(event) {
            const imgPreview = document.getElementById('imgPreview');
            imgPreview.src = URL.createObjectURL(event.target.files[0]);
            imgPreview.style.display = 'block'; // Hiển thị ảnh đã chọn
        }
    </script>
</head>
<%
    ThanhVien764 bd = (ThanhVien764) session.getAttribute("bandoc");
    if (bd == null) {
        response.sendRedirect("../gdDangnhap764.jsp?err=timeout");
    }
    // Xử lý khi form được gửi đi
    if (request.getMethod().equalsIgnoreCase("POST")) {
        // Khai báo biến để lưu ảnh
        byte[] anhthe = null;

        // Lấy thông tin tệp đã tải lên
        Part filePart = request.getPart("anhthe");
        %>
    console.log("filePart: " + <%= filePart %>);
<%

        // Kiểm tra xem tệp có được chọn không
        if (filePart != null && filePart.getSize() > 0) {
            // Tạo InputStream từ filePart
            InputStream inputStream = filePart.getInputStream();
            // Đọc dữ liệu từ InputStream vào mảng byte
            anhthe = new byte[(int) filePart.getSize()];
            inputStream.read(anhthe);
            inputStream.close();
        }

        if(anhthe == null) {
%>
<script type="text/javascript">
    alert("Chưa chọn ảnh thẻ!");
</script>
<%
        } else {
            // Tạo đối tượng TheBanDoc764
            TheBanDoc764 theBanDoc = new TheBanDoc764();
            theBanDoc.setAnhthe(anhthe);
            theBanDoc.setNgaydangky(new Date());
            theBanDoc.setTrangthai("Dang xu ly");
            BanDoc764 chuthe = new BanDoc764();
            chuthe.setId(bd.getId());
            theBanDoc.setBanDoc(chuthe);

            // Gọi DAO để thêm thẻ
            TheBanDoc764DAO dao = new TheBanDoc764DAO();
            boolean isSuccess = dao.themthe(theBanDoc);

            if (isSuccess) {
%>
<script type="text/javascript">
    alert("Đăng kí thành công!");
</script>
<%
    response.sendRedirect("gdChinhBD764.jsp");
} else {
%>
<script type="text/javascript">
    alert("Thêm thẻ thất bại!");
    history.back();
</script>
<%
        }
    }
    }
%>
<body>
<h2>Đăng ký thẻ bạn đọc</h2>

<div class="container">
    <!-- Hiển thị thông tin sinh viên -->
    <table>
        <tr>
            <td>Họ tên:</td>
            <td><%= bd
                .
                getHoTen
                (
                ) %>
            </td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><%= bd
                .
                getEmail
                (
                ) %>
            </td>
        </tr>
        <tr>
            <td>Số điện thoại:</td>
            <td><%= bd
                .
                getSdt
                (
                ) %>
            </td>
        </tr>
        <tr>
            <td>Địa chỉ:</td>
            <td><%= bd
                .
                getDiaChi
                (
                ) %>
            </td>
        </tr>
    </table>

    <form action="" method="post" enctype="multipart/form-data">
        <!-- Ẩn ID thành viên -->
        <input type="hidden" name="tvId" value="<%= bd.getId() %>"/>

        <!-- Chọn ảnh thẻ -->
        <label for="anhthe" style="font-weight: bold;">Chọn ảnh thẻ:</label><br> <!-- In đậm chữ -->
        <input type="file" name="anhthe" id="anhthe" accept="image/*" required onchange="previewImage(event)"/><br><br>

        <!-- Hiển thị ảnh đã chọn -->
        <img id="imgPreview" alt="Ảnh đã chọn"/>

        <!-- Nút thêm thẻ -->
        <button type="submit">Thêm</button>
    </form>
</div>
</body>
</html>
