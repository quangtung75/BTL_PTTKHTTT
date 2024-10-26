package libman.model;

import java.util.Date;
import java.util.List;

public class PhieuTra764 {
    private int id;
    private Date ngaytra;
    private float tongtienphat;
    private BanDoc764 nguoitra;
    private NhanVienThuVien764 nguoitiepnhan;
    private List<TaiLieuMuon764> dsTra;

    public PhieuTra764() {
    }

    public PhieuTra764(int id, Date ngaytra, float tongtienphat, BanDoc764 nguoitra, NhanVienThuVien764 nguoitiepnhan, List<TaiLieuMuon764> dsTra) {
        this.id = id;
        this.ngaytra = ngaytra;
        this.tongtienphat = tongtienphat;
        this.nguoitra = nguoitra;
        this.nguoitiepnhan = nguoitiepnhan;
        this.dsTra = dsTra;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getNgaytra() {
        return ngaytra;
    }

    public void setNgaytra(Date ngaytra) {
        this.ngaytra = ngaytra;
    }

    public float getTongtienphat() {
        float tongTienPhat = 0.0f;

        if (dsTra != null) {
            for (TaiLieuMuon764 taiLieu : dsTra) {
                if (taiLieu.getPhieuphat() != null) {
                    tongTienPhat += taiLieu.getPhieuphat().getTienphat();
                }
            }
        }

        return tongTienPhat;
    }

    public void setTongtienphat(float tongtienphat) {
        this.tongtienphat = tongtienphat;
    }

    public BanDoc764 getNguoitra() {
        return nguoitra;
    }

    public void setNguoitra(BanDoc764 nguoitra) {
        this.nguoitra = nguoitra;
    }

    public NhanVienThuVien764 getNguoitiepnhan() {
        return nguoitiepnhan;
    }

    public void setNguoitiepnhan(NhanVienThuVien764 nguoitiepnhan) {
        this.nguoitiepnhan = nguoitiepnhan;
    }

    public List<TaiLieuMuon764> getDsTra() {
        return dsTra;
    }

    public void setDsTra(List<TaiLieuMuon764> dsTra) {
        this.dsTra = dsTra;
    }
}
