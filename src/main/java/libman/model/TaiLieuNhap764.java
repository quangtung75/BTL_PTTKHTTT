package libman.model;

public class TaiLieuNhap764 {
    private int id;
    private float giathanh;
    private TaiLieu764 tailieu;

    public TaiLieuNhap764() {
    }

    public TaiLieuNhap764(int id, float giathanh, TaiLieu764 tailieu) {
        this.id = id;
        this.giathanh = giathanh;
        this.tailieu = tailieu;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getGiathanh() {
        return giathanh;
    }

    public void setGiathanh(float giathanh) {
        this.giathanh = giathanh;
    }

    public TaiLieu764 getTailieu() {
        return tailieu;
    }

    public void setTailieu(TaiLieu764 tailieu) {
        this.tailieu = tailieu;
    }
}
