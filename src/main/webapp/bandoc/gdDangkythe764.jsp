<%@ page import="libman.model.ThanhVien764" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="libman.model.TheBanDoc764" %>
<%@ page import="java.util.Date" %>
<%@ page import="libman.model.BanDoc764" %>
<%@ page import="libman.dao.TheBanDoc764DAO" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.fileupload.RequestContext" %>
<%--
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
        return; // Dừng xử lý sau khi redirect
    }

    // Xử lý khi form được gửi đi
    if (request.getMethod().equalsIgnoreCase("POST")) {
        TheBanDoc764DAO theBanDocDAO = new TheBanDoc764DAO();
        TheBanDoc764 theBanDoc = new TheBanDoc764();

        try {
            // Kiểm tra xem yêu cầu có phải là tải lên tệp hay không
            if (ServletFileUpload.isMultipartContent(request)) {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List<FileItem> items = upload.parseRequest(request);

                InputStream fileContent = null;
                for (FileItem item : items) {
                    if (!item.isFormField()) { // Nếu là tệp hình ảnh
                        fileContent = item.getInputStream(); // Lấy dữ liệu hình ảnh
                    }
                }

                // Lưu hình ảnh vào đối tượng theBanDoc
                if (fileContent != null) {
                    theBanDoc.setAnhthe(fileContent.readAllBytes()); // Đọc dữ liệu vào mảng byte
                }

                // Thiết lập thông tin khác cho theBanDoc
                theBanDoc.setNgaydangky(new Date()); // Ngày đăng ký
                theBanDoc.setTrangthai("Đang xử lý"); // Trạng thái
                BanDoc764 banDoc = new BanDoc764(); // Tạo đối tượng BanDoc764
                banDoc.setId(bd.getId()); // Lấy ID bạn đọc
                banDoc.setHoTen(bd.getHoTen());
                banDoc.setSdt(bd.getSdt());
                theBanDoc.setBanDoc(banDoc); // Gán đối tượng BanDoc764 vào theBanDoc
                String mathe = theBanDoc.taoMaThe();
                %>
<script>
    console.log("Mã thẻ: <%= mathe %>");
</script>
<%
                theBanDoc.setMathe(mathe);

                // Gọi phương thức thêm thẻ
                boolean isSuccess = theBanDocDAO.themthe(theBanDoc);
                if (isSuccess) {
%>
<script type="text/javascript">
    alert("Đăng kí thành công! Mã thẻ: <%= theBanDoc.getMathe() %>");
    window.location.href = "gdChinhBD764.jsp";
</script>
<%
} else {
%>
<script type="text/javascript">
    alert("Đăng kí thất bại! Vui lòng thử lại.");
</script>
<%
    }
} else {
%>
<script type="text/javascript">
    alert("Yêu cầu không hợp lệ.");
</script>
<%
    }
} catch (Exception e) {
    e.printStackTrace();
%>
<script type="text/javascript">
    alert("Đã xảy ra lỗi: <%= e.getMessage() %>");
</script>
<%
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
            <td><%= bd.getHoTen() %>
            </td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><%= bd.getEmail() %>
            </td>
        </tr>
        <tr>
            <td>Số điện thoại:</td>
            <td><%= bd.getSdt() %>
            </td>
        </tr>
        <tr>
            <td>Địa chỉ:</td>
            <td><%= bd.getDiaChi() %>
            </td>
        </tr>
    </table>

    <form action="" method="post" enctype="multipart/form-data">
        <input type="hidden" name="tvId" value="<%= bd.getId() %>"/>
        <label for="anhthe" style="font-weight: bold;">Chọn ảnh thẻ:</label><br> <!-- In đậm chữ -->
        <input type="file" name="anhthe" id="anhthe" accept="image/*" required onchange="previewImage(event)"/><br><br>
        <img id="imgPreview" alt="Ảnh đã chọn"/>
        <button type="submit">Thêm</button>
    </form>
</div>
</body>
</html>
