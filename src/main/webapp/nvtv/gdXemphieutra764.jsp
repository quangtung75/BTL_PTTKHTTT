<%@ page import="com.google.gson.Gson" %>
<%@ page import="libman.model.PhieuTra764" %>
<%@ page import="libman.model.ThanhVien764" %>
<%@ page import="libman.model.NhanVienThuVien764" %>
<%@ page import="libman.model.TaiLieuMuon764" %><%--
  Created by IntelliJ IDEA.
  User: vongn
  Date: 10/25/2024
  Time: 4:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Xem thông tin phiếu trả</title>
    <link rel="stylesheet" type="text/css" href="../style/gdXemPhieuTraStyle.css">
    <script>
        function printAndRedirect() {
            window.print();
            window.location.href = "gdChinhNVTV764.jsp";
        }
    </script>
</head>
<%
    String phieuTraJson = request.getParameter("phieutra");
    Gson gson = new Gson();
    PhieuTra764 phieuTra = gson.fromJson(java.net.URLDecoder.decode(phieuTraJson, "UTF-8"), PhieuTra764.class);
    ThanhVien764 nguoitra = phieuTra.getNguoitra();
    NhanVienThuVien764 nguoitiepnhan = phieuTra.getNguoitiepnhan();
%>
<body>
<h1>Thông tin phiếu trả</h1>

<div class="info-bar">
    <p><strong>Thông tin người trả:</strong></p>
    <p><strong>Họ tên:</strong> <%= nguoitra.getHoTen() %></p>
</div>

<div class="info-bar">
    <p><strong>Thông tin người tiếp nhận:</strong></p>
    <p><strong>Họ tên:</strong> <%= nguoitiepnhan.getHoTen() %></p>
</div>

<div class="table-container">
    <h4>Danh sách tài liệu trả</h4>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Tên tài liệu</th>
            <th>Số ngày quá hạn</th>
            <th>Mức độ hư hỏng</th>
            <th>Tiền phạt</th>
        </tr>
        <%
            for (TaiLieuMuon764 taiLieuMuon : phieuTra.getDsTra()) {
                int songayquahan = 0;
                if (taiLieuMuon.getNgayhentra().before(phieuTra.getNgaytra())) {
                    songayquahan = (int) ((phieuTra.getNgaytra().getTime() - taiLieuMuon.getNgayhentra().getTime()) / (1000 * 60 * 60 * 24));
                }
        %>
        <tr>
            <td><%= taiLieuMuon.getId() %></td>
            <td><%= taiLieuMuon.getTailieu().getTen() %></td>
            <td><%= songayquahan %></td>
            <td><%= taiLieuMuon.getTinhtrangbandau() - taiLieuMuon.getTinhtrangsau() %></td>
            <td><%= taiLieuMuon.getPhieuphat().getTienphat() %></td>
        </tr>
        <% } %>
    </table>

    <div class="total">
        <strong>Tổng tiền phạt:</strong> <%= phieuTra.getTongtienphat() %> VNĐ
    </div>

    <div>
        <button onclick="printAndRedirect()">In phiếu</button>
    </div>
</div>
</body>
</html>
