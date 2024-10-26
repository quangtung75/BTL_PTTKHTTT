package libman.model;

public class NhaCungCap764 {
    private int id;
    private String ten;
    private String email;
    private String sdt;
    private String diachi;
    private String ghichu;

    public NhaCungCap764() {
    }

    public NhaCungCap764(int id, String ten, String email, String sdt, String diachi, String ghichu) {
        this.id = id;
        this.ten = ten;
        this.email = email;
        this.sdt = sdt;
        this.diachi = diachi;
        this.ghichu = ghichu;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getGhichu() {
        return ghichu;
    }

    public void setGhichu(String ghichu) {
        this.ghichu = ghichu;
    }
}
