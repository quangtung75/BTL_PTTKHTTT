<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.logging.Logger" %>
<%@ page import="java.util.List" %>
<%@ page import="libman.dao.TaiLieuMuon764DAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.Date" %>
<%@ page import="libman.model.*" %>
<%@ page import="com.google.gson.GsonBuilder" %>
<%@ page import="libman.dao.PhieuTra764DAO" %><%--
  Created by IntelliJ IDEA.
  User: vongn
  Date: 10/25/2024
  Time: 4:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Nhận trả tài liệu</title>
    <link rel="stylesheet" type="text/css" href="../style/gdTratailieu764.css">
</head>

<body>
<%
    PhieuTra764 phieuTra = new PhieuTra764();
    phieuTra.setNgaytra(new Date());
    Boolean resultSave = null;

    ThanhVien764 nvtv = (ThanhVien764) session.getAttribute("nvtv");
    NhanVienThuVien764 nguoitiepnhan = new NhanVienThuVien764();
    nguoitiepnhan.setId(nvtv.getId());
    nguoitiepnhan.setHoTen(nvtv.getHoTen());
    phieuTra.setNguoitiepnhan(nguoitiepnhan);

    List<TaiLieuMuon764> taiLieuChuaTra = null;
    BanDoc764 nguoitra = null;
    String mathe = "";
    Gson gson = new Gson();

    String action = request.getParameter("action");
    if((action == null)||(action.trim().length() ==0)) // goi tu trang Chon ban doc
    {
        mathe = request.getParameter("mathe");
        session.setAttribute("mathe", mathe);
        String banDocJsonEncoded = request.getParameter("banDocJson");
        String banDocJson = java.net.URLDecoder.decode(banDocJsonEncoded, "UTF-8");
        nguoitra = gson.fromJson(banDocJson, BanDoc764.class);
        phieuTra.setNguoitra(nguoitra);
        TaiLieuMuon764DAO taiLieuMuonDAO = new TaiLieuMuon764DAO();
        taiLieuChuaTra = taiLieuMuonDAO.getTaiLieuMuonChuaTraTheoId(nguoitra.getId());
        session.setAttribute("tailieuchuatra", taiLieuChuaTra);

        phieuTra.setDsTra(new ArrayList<TaiLieuMuon764>());
        session.setAttribute("phieutra", phieuTra);
    }
    else if(action.equalsIgnoreCase("xoa")) // goi tu trang nay
    {
        mathe = (String) session.getAttribute("mathe");
        phieuTra = (PhieuTra764) session.getAttribute("phieutra");
        nguoitra = phieuTra.getNguoitra();
        taiLieuChuaTra = (List<TaiLieuMuon764>) session.getAttribute("tailieuchuatra");
        String id = request.getParameter("id");
        for(TaiLieuMuon764 taiLieuMuon : phieuTra.getDsTra()) {
            if(taiLieuMuon.getId() == Integer.parseInt(id)) {
                phieuTra.getDsTra().remove(taiLieuMuon);
                taiLieuMuon.setPhieuphat(null);
                taiLieuMuon.setTrangthai(false);
                taiLieuMuon.setTinhtrangsau(-1);
                taiLieuChuaTra.add(taiLieuMuon);
                break;
            }
        }
        session.setAttribute("phieutra", phieuTra);
        session.setAttribute("tailieuchuatra", taiLieuChuaTra);
    } else if(action.equalsIgnoreCase("them")) {
        mathe = (String) session.getAttribute("mathe");
        phieuTra = (PhieuTra764) session.getAttribute("phieutra");
        nguoitra = phieuTra.getNguoitra();
        taiLieuChuaTra = (List<TaiLieuMuon764>) session.getAttribute("tailieuchuatra");
        String tailieuMuonJson = request.getParameter("tailieumuon");
        gson = new GsonBuilder()
                .setDateFormat("MMM dd, yyyy")
                .create();
        TaiLieuMuon764 taiLieuMuon = gson.fromJson(java.net.URLDecoder.decode(tailieuMuonJson, "UTF-8"), TaiLieuMuon764.class);

        for(TaiLieuMuon764 tlm: taiLieuChuaTra) {
            if(tlm.getId() == taiLieuMuon.getId()) {
                taiLieuChuaTra.remove(tlm);
                break;
            }
        }

        int mucDoHuHai = Integer.parseInt(request.getParameter("mucdohuhai"));
        float phiPhat = Float.parseFloat(request.getParameter("phiphat"));
        int soNgayQuaHan = Integer.parseInt(request.getParameter("songayquahan"));

        PhieuPhat764 phieuphat = new PhieuPhat764();
        phieuphat.setTienphat(phiPhat);
        phieuphat.setSongayquahan(soNgayQuaHan);

        taiLieuMuon.setTinhtrangsau(taiLieuMuon.getTinhtrangbandau() - mucDoHuHai);
        taiLieuMuon.setPhieuphat(phieuphat);
        taiLieuMuon.setTrangthai(true);
        phieuTra.getDsTra().add(taiLieuMuon);
        phieuTra.setTongtienphat(phieuTra.getTongtienphat() + phiPhat);

        session.setAttribute("phieutra", phieuTra);
        session.setAttribute("tailieuchuatra", taiLieuChuaTra);
    } else if("paymentComplete".equals(request.getParameter("action"))) {
        mathe = (String) session.getAttribute("mathe");
        phieuTra = (PhieuTra764) session.getAttribute("phieutra");
        nguoitra = phieuTra.getNguoitra();
        taiLieuChuaTra = (List<TaiLieuMuon764>) session.getAttribute("tailieuchuatra");
        // Gọi DAO để lưu phiếu trả
        PhieuTra764DAO phieuTraDAO = new PhieuTra764DAO();
        boolean result = phieuTraDAO.luuPhieuTra(phieuTra);

        resultSave = result;
    }


    //String banDocJson = "{\"diemuytin\":10,\"id\":1,\"taiKhoan\":\"taiKhoan\",\"matKhau\":\"matKhau\",\"hoTen\":\"hoTen\",\"email\":\"email\",\"sdt\":\"sdt\",\"diaChi\":\"diaChi\",\"ghiChu\":\"ghiChu\",\"vaiTro\":\"vaiTro\"}";
    if(nguoitra != null && !mathe.isEmpty()) {


%>
<div class="info-bar">
    <p><strong>Thông tin người trả:</strong></p>
    <p><strong>Họ tên:</strong> <%= nguoitra.getHoTen() %></p>
    <p><strong>Mã thẻ:</strong> <%= mathe %></p>
</div>

<div class="content">
    <!-- Bảng tài liệu chưa trả -->
    <div class="table-container">
        <h4>Tài liệu đang mượn chưa trả</h4>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Tên tài liệu</th>
                <th>Ngày hẹn trả</th>
                <th>Tình trạng ban đầu</th>
                <th>Thao tác</th>
            </tr>
            <%
                for (TaiLieuMuon764 taiLieuMuon : taiLieuChuaTra) {
            %>
            <tr>
                <td><%=taiLieuMuon.getId()%></td>
                <td><%=taiLieuMuon.getTailieu().getTen()%></td>
                <td><%=taiLieuMuon.getNgayhentra()%></td>
                <td><%=taiLieuMuon.getTinhtrangbandau()%></td>
                <%
                    String taiLieuMuonJson = gson.toJson(taiLieuMuon);
                %>
                <td>
                    <form action="gdXulytienphat764.jsp" method="post">
                        <input type="hidden" name="tailieumuon" value="<%= URLEncoder.encode(taiLieuMuonJson, "UTF-8") %>">
                        <input type="submit" value="Trả">
                    </form>
                </td>
            </tr>
            <%} %>
        </table>
    </div>

    <!-- Bảng tài liệu dự kiến trả -->
    <div class="table-container">
        <h4>Tài liệu dự kiến trả</h4>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Tên tài liệu</th>
                <th>Số ngày quá hạn</th>
                <th>Mức độ hư hỏng</th>
                <th>Tiền phạt</th>
                <th>X</th>
            </tr>
            <%
                for(TaiLieuMuon764 taiLieuMuon : phieuTra.getDsTra()) {
                    int songayquahan = 0;
                    if(taiLieuMuon.getNgayhentra().before(phieuTra.getNgaytra())) {
                        songayquahan = (int) ((phieuTra.getNgaytra().getTime() - taiLieuMuon.getNgayhentra().getTime()) / (1000 * 60 * 60 * 24));
                    }
            %>
            <tr>
                <td><%=taiLieuMuon.getId()%></td>
                <td><%=taiLieuMuon.getTailieu().getTen()%></td>
                <td><%=songayquahan%></td>
                <td><%=taiLieuMuon.getTinhtrangbandau()-taiLieuMuon.getTinhtrangsau()%></td>
                <td><%=taiLieuMuon.getPhieuphat().getTienphat()%></td>
                <td>
                    <form action="gdTratailieu764.jsp" method="post">
                        <input type="hidden" name="action" value="xoa">
                        <input type="hidden" name="id" value="<%=taiLieuMuon.getId()%>">
                        <button type="submit">X</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </table>

        <div class="total">
            <strong>Tổng tiền phạt:</strong><%= phieuTra.getTongtienphat()%>  VNĐ
        </div>
        <button onclick="showModal()" style="margin-top: 8px">Xác nhận</button>
        <!-- Modal xác nhận thanh toán -->
        <div id="paymentModal" style="display:none;">
            <div class="modal-content">
                <h3>Xác nhận thanh toán</h3>
                <p>Tổng tiền phạt: <%= phieuTra.getTongtienphat() %> VNĐ</p>
                <p>Yêu cầu bạn đọc thanh toán để tiếp tục.</p>
                <button onclick="submitPayment()">Hoàn tất thanh toán</button>
                <button onclick="closeModal()">Hủy</button>
            </div>
        </div>
        <!-- Hiển thị kết quả lưu phiếu trả -->
        <% if (resultSave!= null && resultSave) { %>
        <div class="resultSave">
            <p>Lưu thông tin trả thành công!</p>
            <%

            %>
            <form action="gdXemphieutra764.jsp" method="post">
                <input type="hidden" name="phieutra" value="<%= URLEncoder.encode(gson.toJson(phieuTra), "UTF-8") %>">
                <button type="submit">OK</button>
            </form>
        </div>
        <% } else if(resultSave!= null) {%>
        <div class="resultSave">
            <p>Lưu thông tin thất bại, vui lòng thử lại!</p>
            <form action="gdChonbandoc764.jsp">
                <button type="submit">OK</button>
            </form>
        </div>
        <%}%>
        <!-- Form thanh toán gửi lại JSP -->
        <form id="paymentForm" action="gdTratailieu764.jsp" method="post">
            <input type="hidden" name="action" value="paymentComplete">
        </form>
    </div>
</div>
<%
    } else {
%>
    }
    <div class="result no-result">
        <p>Opps. Vui lòng thử lại sau.</p>
</div>
<%
    }
    %>
<script>
    function showModal() {
        document.getElementById("paymentModal").style.display = "block";
    }
    function closeModal() {
        document.getElementById("paymentModal").style.display = "none";
    }
    function submitPayment() {
        document.getElementById("paymentForm").submit();
    }
</script>
</body>
</html>
