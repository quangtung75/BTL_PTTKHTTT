<%@ page import="com.google.gson.Gson" %>
<%@ page import="libman.model.TaiLieuMuon764" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.google.gson.GsonBuilder" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Locale" %>
<%@ page import="libman.model.PhieuPhat764" %><%--
  Created by IntelliJ IDEA.
  User: vongn
  Date: 10/25/2024
  Time: 4:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    // Lấy đối tượng tài liệu mượn đang xử lý từ URL
    String taiLieuMuonJsonEncoded = request.getParameter("tailieumuon");
    String taiLieuMuonJson = java.net.URLDecoder.decode(taiLieuMuonJsonEncoded, "UTF-8");

    Gson gson = new GsonBuilder()
            .setDateFormat("MMM dd, yyyy")
            .create();
    TaiLieuMuon764 taiLieuMuon = gson.fromJson(taiLieuMuonJson, TaiLieuMuon764.class);

    String ngayTraDuKien = String.valueOf(taiLieuMuon.getNgayhentra());
    SimpleDateFormat inputFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
    Date date = inputFormat.parse(ngayTraDuKien);

// Định dạng lại sang yyyy-MM-dd
    SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
    String formattedDate = outputFormat.format(date);

// Chuyển thành LocalDate
    LocalDate ngayTraDuKienDate = LocalDate.parse(formattedDate);
    LocalDate ngayHienTai = LocalDate.now();
    long soNgayQuaHan = ChronoUnit.DAYS.between(ngayTraDuKienDate, ngayHienTai);
    if (soNgayQuaHan < 0) {
        soNgayQuaHan = 0;
    }

    SimpleDateFormat outputFormat2 = new SimpleDateFormat("dd/MM/yyyy");
    String ngayTraDuKienFormatted = outputFormat2.format(date);
%>
<head>
    <title>Xử lý tiền phạt</title>
    <link rel="stylesheet" type="text/css" href="../style/gdXulytienphat764.css">
    <script>
        // Hàm tính toán tiền phạt tự động khi thay đổi dữ liệu
        function tinhTienPhat() {
            let soNgayQuaHan = <%= soNgayQuaHan  %>;
            let tienPhatTrenNgay = parseFloat(document.getElementById("tienPhatTrenNgay").value || 5000);
            let mucDoHuHai = <%= taiLieuMuon.getTinhtrangbandau() %> - parseInt(document.getElementById("tinhTrangLucSau").value);
            let tienPhatHuHong = parseFloat(document.getElementById("tienPhatHuHong").value || 10000);

            // Tính tổng tiền phạt
            let tongTienPhat = (soNgayQuaHan * tienPhatTrenNgay) + (mucDoHuHai * tienPhatHuHong);
            document.getElementById("tongTienPhat").innerText = tongTienPhat.toFixed(2) + " VNĐ";

            document.getElementById("phiphat").value = tongTienPhat.toFixed(2);
            document.getElementById("mucdohuhai").value = mucDoHuHai;
        }
    </script>
</head>

<body>
<div class="container">
    <!-- Bảng thông tin tài liệu mượn -->
    <div class="left-panel">
        <h4>Thông tin tài liệu mượn đang xử lý</h4>
        <table border="1">
            <tr><th>ID mượn</th><td><%= taiLieuMuon.getId() %></td></tr>
            <tr><th>Tên tài liệu</th><td><%= taiLieuMuon.getTailieu().getTen() %></td></tr>
            <tr><th>Ngày hẹn trả</th><td><%= ngayTraDuKienFormatted %></td></tr>
            <tr><th>Tình trạng ban đầu</th><td><%= taiLieuMuon.getTinhtrangbandau() %></td></tr>
            <tr><th>Số ngày quá hạn</th><td><%= soNgayQuaHan %></td></tr>
        </table>
    </div>

    <!-- Trường thông tin xử lý tiền phạt -->
    <div class="right-panel">
        <h4>Xử lý tiền phạt</h4>
        <label for="tinhTrangLucSau">Tình trạng lúc sau:</label>
        <select id="tinhTrangLucSau" onchange="tinhTienPhat()">
            <% for (int i = 0; i <= taiLieuMuon.getTinhtrangbandau(); i++) { %>
            <option value="<%= i %>" <%= i == taiLieuMuon.getTinhtrangbandau() ? "selected" : "" %>><%= i %></option>
            <% } %>
        </select>
        <br><br>

        <label for="tienPhatTrenNgay">Tiền phạt trên ngày nộp muộn:</label>
        <input type="number" id="tienPhatTrenNgay" value="5000" oninput="tinhTienPhat()" step="1000">
        <br><br>

        <label for="tienPhatHuHong">Tiền phạt hỏng hóc (/10%):</label>
        <input type="number" id="tienPhatHuHong" value="10000" oninput="tinhTienPhat()" step="1000">
        <br><br>

        <label><strong>Tiền phạt:</strong></label>
        <span id="tongTienPhat"><%= (soNgayQuaHan * 5000)%> VNĐ</span>
        <br><br>

        <form id="updateForm" action="gdTratailieu764.jsp" method="post">
            <input type="hidden" name="action" value="them">
            <input type="hidden" name="tailieumuon" value="<%= URLEncoder.encode(gson.toJson(taiLieuMuon), "UTF-8") %>">
            <input type="hidden" name="songayquahan" value="<%= soNgayQuaHan %>">
            <input type="hidden" name="mucdohuhai" id="mucdohuhai" value="0">
            <input type="hidden" name="phiphat" id="phiphat" value="<%= (soNgayQuaHan * 5000) %>">
            <button type="submit">Tiếp tục</button>
        </form>
    </div>
</div>
</body>
</html>
