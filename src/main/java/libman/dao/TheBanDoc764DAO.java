package libman.dao;

import libman.model.TheBanDoc764;

import java.sql.PreparedStatement;
import java.util.Date;

public class TheBanDoc764DAO extends DAO{
    public TheBanDoc764DAO() {
        super();
    }
    public boolean themthe(TheBanDoc764 theBanDoc) {
        String sql = "INSERT INTO tblTheBanDoc764 (anhthe, mathe, ngaydangky, trangthai, tblBanDoc764id) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setBlob(1, new javax.sql.rowset.serial.SerialBlob(theBanDoc.getAnhthe())); // Ảnh thẻ
            statement.setString(2, theBanDoc.getMathe());
            statement.setDate(3, new java.sql.Date(theBanDoc.getNgaydangky().getTime())); // Ngày đăng ký
            statement.setString(4, "Dang xu ly"); // Trạng thái ban đầu
            statement.setInt(5, theBanDoc.getBanDoc().getId()); // ID bạn đọc

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
