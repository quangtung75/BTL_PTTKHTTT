package libman.model;

import java.util.Date;

public class NhanVienQuanLy764 extends NhanVien764 {
    private String capbac;

    public NhanVienQuanLy764() {
    }

    public NhanVienQuanLy764(int id, String taiKhoan, String matKhau, String hoTen, String email, String sdt, String diaChi, String ghiChu, String vaiTro) {
        super(id, taiKhoan, matKhau, hoTen, email, sdt, diaChi, ghiChu, vaiTro);
    }

    public NhanVienQuanLy764(String vitri, Date ngaynhanviec) {
        super(vitri, ngaynhanviec);
    }

    public NhanVienQuanLy764(int id, String taiKhoan, String matKhau, String hoTen, String email, String sdt, String diaChi, String ghiChu, String vaiTro, String vitri, Date ngaynhanviec) {
        super(id, taiKhoan, matKhau, hoTen, email, sdt, diaChi, ghiChu, vaiTro, vitri, ngaynhanviec);
    }

    public NhanVienQuanLy764(String capbac) {
        this.capbac = capbac;
    }

    public NhanVienQuanLy764(int id, String taiKhoan, String matKhau, String hoTen, String email, String sdt, String diaChi, String ghiChu, String vaiTro, String capbac) {
        super(id, taiKhoan, matKhau, hoTen, email, sdt, diaChi, ghiChu, vaiTro);
        this.capbac = capbac;
    }

    public NhanVienQuanLy764(String vitri, Date ngaynhanviec, String capbac) {
        super(vitri, ngaynhanviec);
        this.capbac = capbac;
    }

    public NhanVienQuanLy764(int id, String taiKhoan, String matKhau, String hoTen, String email, String sdt, String diaChi, String ghiChu, String vaiTro, String vitri, Date ngaynhanviec, String capbac) {
        super(id, taiKhoan, matKhau, hoTen, email, sdt, diaChi, ghiChu, vaiTro, vitri, ngaynhanviec);
        this.capbac = capbac;
    }

    public String getCapbac() {
        return capbac;
    }

    public void setCapbac(String capbac) {
        this.capbac = capbac;
    }
}
