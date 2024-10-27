package libman.dao;

import libman.model.PhieuTra764;
import libman.model.TaiLieuMuon764;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PhieuTra764DAO extends DAO{
    public PhieuTra764DAO() {
        super();
    }

    public boolean luuPhieuTra(PhieuTra764 phieuTra764) {
        boolean kq = true;
        // Luu thong tin chung phieu tra
        String query1 = """
                INSERT INTO tblPhieuTra764 (ngaytra, tblBanDoc764id, tblNhanVienThuVien764id)
                VALUES (?, ?, ?)
                """;
        try {
            PreparedStatement ps = con.prepareStatement(query1, PreparedStatement.RETURN_GENERATED_KEYS);
            con.setAutoCommit(false);
            ps.setDate(1, new java.sql.Date(phieuTra764.getNgaytra().getTime()));
            ps.setInt(2, phieuTra764.getNguoitra().getId());
            ps.setInt(3, phieuTra764.getNguoitiepnhan().getId());
            ps.executeUpdate();
            int phieuTraID = -1;
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    phieuTraID = rs.getInt(1); // Lấy ID
                } else {
                    return false;
                }
            }

            String query2 = """
                        INSERT INTO tblPhieuPhat764 (sotien, ghichu)
                        VALUES (?, ?)
                        """;

            String updateTaiLieuMuon = """
                        UPDATE tblTaiLieuMuon764
                        SET tblPhieuTra764id = ?, tblPhieuPhat764id = ?, tinhtrangsau = ?, trangthai = ?
                        WHERE id = ?
                        """;

            for (TaiLieuMuon764 taiLieu : phieuTra764.getDsTra()) {
                // Lưu phiếu phạt nếu có
                if (taiLieu.getPhieuphat() != null) {
                    try (PreparedStatement ps2 = con.prepareStatement(query2, PreparedStatement.RETURN_GENERATED_KEYS)) {
                        ps2.setFloat(1, taiLieu.getPhieuphat().getTienphat());
                        ps2.setString(2, taiLieu.getPhieuphat().getGhichu());
                        ps2.executeUpdate();

                        int phieuPhatId = -1;
                        try (ResultSet rs2 = ps2.getGeneratedKeys()) {
                            if (rs2.next()) {
                                phieuPhatId = rs2.getInt(1);
                            } else {
                                return false;
                            }
                        }


                        // Cập nhật tài liệu mượn
                        try (PreparedStatement psUpdate = con.prepareStatement(updateTaiLieuMuon)) {
                            psUpdate.setInt(1, phieuTraID);
                            psUpdate.setInt(2, phieuPhatId);
                            psUpdate.setInt(3, taiLieu.getTinhtrangsau());
                            psUpdate.setInt(4, 1);
                            psUpdate.setInt(5, taiLieu.getId());
                            psUpdate.executeUpdate();
                        }
                    }
                }
            }
            con.commit();
            con.setAutoCommit(true);
        }
        catch (Exception e) {
            if (con != null) {
                try {
                    con.rollback(); // Hủy bỏ các thay đổi nếu có lỗi
                    con.setAutoCommit(true);
                } catch (SQLException rollbackEx) {
                    rollbackEx.printStackTrace();
                }
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                con.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


        return kq;
    }
}
