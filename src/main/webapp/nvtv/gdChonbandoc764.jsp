        <%@ page import="libman.dao.BanDoc764DAO" %>
<%@ page import="libman.model.BanDoc764" %>
<%@ page import="com.google.gson.Gson" %>
        <%@ page import="java.util.logging.Logger" %>
        <%@ page import="java.net.URLEncoder" %><%--
  Created by IntelliJ IDEA.
  User: vongn
  Date: 10/25/2024
  Time: 7:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chọn bạn đọc</title>
    <link rel="stylesheet" type="text/css" href="../style/gdChonBanDocStyle.css">
</head>
<body>
<div class="container">
    <h3>Tìm bạn đọc</h3>
    <form name="timbandoc" action="" method="post">
        <table border="0">
            <tr>
                <td>Mã thẻ bạn đọc</td>
                <td><input type="text" name="mathe" id="mathe" required /></td>
                <td><input type="submit" value="Tìm" /></td>
            </tr>
        </table>
    </form>

    <%
        String mathe = request.getParameter("mathe");
        String banDocJson = null;
        if (mathe != null && !mathe.isEmpty()) {
            BanDoc764DAO banDocDAO = new BanDoc764DAO();
            BanDoc764 banDoc = banDocDAO.getBanDocTheoMaThe(mathe);

            if (banDoc != null) {
                Gson gson = new Gson();
                banDocJson = gson.toJson(banDoc);
                Logger logger = Logger.getLogger("gdChonbandoc764.jsp");
                logger.info(banDocJson);
    %>
    <div class="result">
        <h4>Thông tin bạn đọc</h4>
        <p><strong>ID:</strong> <%=banDoc.getId()%></p>
        <p><strong>Họ tên:</strong> <%=banDoc.getHoTen()%></p>
        <p><strong>Email:</strong> <%=banDoc.getEmail()%></p>
        <p><strong>Số điện thoại:</strong> <%=banDoc.getSdt()%></p>
        <p><strong>Địa chỉ:</strong> <%=banDoc.getDiaChi()%></p>
        <p><strong>Điểm uy tín:</strong> <%=banDoc.getDiemuytin()%></p>
        <p><strong>Ghi chú:</strong> <%=banDoc.getGhiChu()%></p>
        <form action="gdTratailieu764.jsp" method="post">
            <input type="hidden" name="banDocJson" value="<%=URLEncoder.encode(banDocJson, "UTF-8")%>" />
            <input type="hidden" name="mathe" value="<%=mathe%>" />
            <input type="submit" value="Tiếp tục" />
        </form>
    </div>
    <%
    } else {
    %>
    <div class="result no-result">
        <p>Không có kết quả cho mã thẻ "<%=mathe%>".</p>
    </div>
    <%
            }
        }
    %>
</div>
<script>
    console.log(<%=banDocJson%>)
</script>
</body>
</html>
