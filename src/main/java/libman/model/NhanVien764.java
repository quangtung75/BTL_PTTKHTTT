package libman.model;

import java.util.Date;

public class NhanVien764 extends ThanhVien764 {
    private String vitri;
    private Date ngaynhanviec;

    public NhanVien764() {
    }

    public NhanVien764(int id, String taiKhoan, String matKhau, String hoTen, String email, String sdt, String diaChi, String ghiChu, String vaiTro) {
        super(id, taiKhoan, matKhau, hoTen, email, sdt, diaChi, ghiChu, vaiTro);
    }

    public NhanVien764(String vitri, Date ngaynhanviec) {
        this.vitri = vitri;
        this.ngaynhanviec = ngaynhanviec;
    }

    public NhanVien764(int id, String taiKhoan, String matKhau, String hoTen, String email, String sdt, String diaChi, String ghiChu, String vaiTro, String vitri, Date ngaynhanviec) {
        super(id, taiKhoan, matKhau, hoTen, email, sdt, diaChi, ghiChu, vaiTro);
        this.vitri = vitri;
        this.ngaynhanviec = ngaynhanviec;
    }

    public String getVitri() {
        return vitri;
    }

    public void setVitri(String vitri) {
        this.vitri = vitri;
    }

    public Date getNgaynhanviec() {
        return ngaynhanviec;
    }

    public void setNgaynhanviec(Date ngaynhanviec) {
        this.ngaynhanviec = ngaynhanviec;
    }
}
