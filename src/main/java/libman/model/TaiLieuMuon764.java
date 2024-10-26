package libman.model;

import java.util.Date;

public class TaiLieuMuon764 {
    private int id;
    private Date ngayhentra;
    private int tinhtrangbandau;
    private int tinhtrangsau;
    private boolean trangthai;
    private TaiLieu764 tailieu;
    private PhieuPhat764 phieuphat;

    public TaiLieuMuon764() {
    }

    public TaiLieuMuon764(int id, Date ngayhentra, int tinhtrangbandau, int tinhtrangsau, boolean trangthai, TaiLieu764 tailieu, PhieuPhat764 phieuphat) {
        this.id = id;
        this.ngayhentra = ngayhentra;
        this.tinhtrangbandau = tinhtrangbandau;
        this.tinhtrangsau = tinhtrangsau;
        this.trangthai = trangthai;
        this.tailieu = tailieu;
        this.phieuphat = phieuphat;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getNgayhentra() {
        return ngayhentra;
    }

    public void setNgayhentra(Date ngayhentra) {
        this.ngayhentra = ngayhentra;
    }

    public int getTinhtrangbandau() {
        return tinhtrangbandau;
    }

    public void setTinhtrangbandau(int tinhtrangbandau) {
        this.tinhtrangbandau = tinhtrangbandau;
    }

    public int getTinhtrangsau() {
        return tinhtrangsau;
    }

    public void setTinhtrangsau(int tinhtrangsau) {
        this.tinhtrangsau = tinhtrangsau;
    }

    public boolean isTrangthai() {
        return trangthai;
    }

    public void setTrangthai(boolean trangthai) {
        this.trangthai = trangthai;
    }

    public TaiLieu764 getTailieu() {
        return tailieu;
    }

    public void setTailieu(TaiLieu764 tailieu) {
        this.tailieu = tailieu;
    }

    public PhieuPhat764 getPhieuphat() {
        return phieuphat;
    }

    public void setPhieuphat(PhieuPhat764 phieuphat) {
        this.phieuphat = phieuphat;
    }
}
