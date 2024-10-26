package libman.dao;

import libman.model.BanDoc764;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BanDoc764DAO extends DAO {
    public BanDoc764DAO() {
        super();
    }

    public BanDoc764 getBanDocTheoMaThe(String mathe) {
        BanDoc764 banDoc = null;
        String sql = "SELECT b.diemuytin, b.ghichu, b.tblThanhVien764id, v.hoten, v.diachi, v.email, v.sdt "
                + "FROM tblBanDoc764 b "
                + "JOIN tblTheBanDoc764 t ON b.tblThanhVien764id = t.tblBanDoc764id "
                + "JOIN tblThanhVien764 v ON b.tblThanhVien764id = v.id "
                + "WHERE t.mathe = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, mathe);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                banDoc = new BanDoc764();
                banDoc.setDiemuytin(rs.getInt("diemuytin"));
                banDoc.setGhiChu(rs.getString("ghichu"));
                banDoc.setId(rs.getInt("tblThanhVien764id"));
                banDoc.setHoTen(rs.getString("hoten"));
                banDoc.setDiaChi(rs.getString("diachi"));
                banDoc.setEmail(rs.getString("email"));
                banDoc.setSdt(rs.getString("sdt"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return banDoc;
    }
}
