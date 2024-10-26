package libman.dao;

import libman.model.TaiLieu764;
import libman.model.TaiLieuMuon764;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TaiLieuMuon764DAO extends DAO{
    public TaiLieuMuon764DAO() {
        super();
    }

    public List<TaiLieuMuon764> getTaiLieuMuonChuaTraTheoId(int id) {
        List<TaiLieuMuon764> taiLieuMuonList = new ArrayList<>();
        String query = """
        SELECT t1.id, t2.ten AS tenTaiLieu, t3.ngayhentra, t1.tinhtrangbandau, t2.id AS idTaiLieu
        FROM tblTaiLieuMuon764 t1
        JOIN tblTaiLieu764 t2 ON t1.tblTaiLieu764id = t2.id
        JOIN tblPhieuMuon764 t3 ON t1.tblPhieuMuon764id = t3.id
        WHERE t1.tblPhieuMuon764id = ? AND t1.trangthai = 0
        """;

        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                TaiLieuMuon764 taiLieuMuon764 = new TaiLieuMuon764();
                taiLieuMuon764.setId(rs.getInt("id"));
                taiLieuMuon764.setNgayhentra(rs.getDate("ngayhentra"));
                taiLieuMuon764.setTinhtrangbandau(rs.getInt("tinhtrangbandau"));
                taiLieuMuon764.setTrangthai(false);

                TaiLieu764 tailieu = new TaiLieu764();
                tailieu.setId(rs.getInt("idTaiLieu"));
                tailieu.setTen(rs.getString("tenTaiLieu"));

                taiLieuMuon764.setTailieu(tailieu);

                taiLieuMuonList.add(taiLieuMuon764);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return taiLieuMuonList;
    }
}
