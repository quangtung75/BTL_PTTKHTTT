package libman.dao;

import java.sql.*;

import libman.model.ThanhVien764;

public class ThanhVien764DAO extends DAO{

    public ThanhVien764DAO() {
        super();
    }

    public boolean dangnhap(ThanhVien764 thanhVien) {
        boolean kq = false;
        String sql = "SELECT * FROM tblthanhvien764 WHERE taiKhoan = ? AND matKhau = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, thanhVien.getTaiKhoan());
            ps.setString(2, thanhVien.getMatKhau());
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {

                thanhVien.setId(rs.getInt("id"));
                thanhVien.setHoTen(rs.getString("hoten"));
                thanhVien.setEmail(rs.getString("email"));
                thanhVien.setSdt(rs.getString("sdt"));
                thanhVien.setDiaChi(rs.getString("diachi"));
                thanhVien.setGhiChu(rs.getString("ghichu"));
                thanhVien.setVaiTro(rs.getString("vaitro"));
                kq = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            kq = false;
        }
        return kq;
    }
}

