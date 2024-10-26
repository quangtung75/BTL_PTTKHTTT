package libman.model;

public class BanDoc764 extends ThanhVien764{

    private int diemuytin;
    private String ghichu;

    public BanDoc764() {
    }

    public BanDoc764(int id, String taiKhoan, String matKhau, String hoTen, String email, String sdt, String diaChi, String ghiChu, String vaiTro) {
        super(id, taiKhoan, matKhau, hoTen, email, sdt, diaChi, ghiChu, vaiTro);
    }

    public BanDoc764(int diemuytin, String ghichu) {
        this.diemuytin = diemuytin;
        this.ghichu = ghichu;
    }

    public BanDoc764(int id, String taiKhoan, String matKhau, String hoTen, String email, String sdt, String diaChi, String ghiChu, String vaiTro, int diemuytin, String ghichu) {
        super(id, taiKhoan, matKhau, hoTen, email, sdt, diaChi, ghiChu, vaiTro);
        this.diemuytin = diemuytin;
        this.ghichu = ghichu;
    }

    public int getDiemuytin() {
        return diemuytin;
    }

    public void setDiemuytin(int diemuytin) {
        this.diemuytin = diemuytin;
    }

    public String getGhichu() {
        return ghichu;
    }

    public void setGhichu(String ghichu) {
        this.ghichu = ghichu;
    }
}
