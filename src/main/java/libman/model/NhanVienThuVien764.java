package libman.model;

import java.util.Date;

public class NhanVienThuVien764 extends NhanVien764 {
    private String calamviec;

    public NhanVienThuVien764() {
    }

    public NhanVienThuVien764(int id, String taiKhoan, String matKhau, String hoTen, String email, String sdt, String diaChi, String ghiChu, String vaiTro) {
        super(id, taiKhoan, matKhau, hoTen, email, sdt, diaChi, ghiChu, vaiTro);
    }

    public NhanVienThuVien764(String vitri, Date ngaynhanviec) {
        super(vitri, ngaynhanviec);
    }

    public NhanVienThuVien764(int id, String taiKhoan, String matKhau, String hoTen, String email, String sdt, String diaChi, String ghiChu, String vaiTro, String vitri, Date ngaynhanviec) {
        super(id, taiKhoan, matKhau, hoTen, email, sdt, diaChi, ghiChu, vaiTro, vitri, ngaynhanviec);
    }

    public NhanVienThuVien764(String calamviec) {
        this.calamviec = calamviec;
    }

    public NhanVienThuVien764(int id, String taiKhoan, String matKhau, String hoTen, String email, String sdt, String diaChi, String ghiChu, String vaiTro, String calamviec) {
        super(id, taiKhoan, matKhau, hoTen, email, sdt, diaChi, ghiChu, vaiTro);
        this.calamviec = calamviec;
    }

    public NhanVienThuVien764(String vitri, Date ngaynhanviec, String calamviec) {
        super(vitri, ngaynhanviec);
        this.calamviec = calamviec;
    }

    public NhanVienThuVien764(int id, String taiKhoan, String matKhau, String hoTen, String email, String sdt, String diaChi, String ghiChu, String vaiTro, String vitri, Date ngaynhanviec, String calamviec) {
        super(id, taiKhoan, matKhau, hoTen, email, sdt, diaChi, ghiChu, vaiTro, vitri, ngaynhanviec);
        this.calamviec = calamviec;
    }

    public String getCalamviec() {
        return calamviec;
    }

    public void setCalamviec(String calamviec) {
        this.calamviec = calamviec;
    }
}
