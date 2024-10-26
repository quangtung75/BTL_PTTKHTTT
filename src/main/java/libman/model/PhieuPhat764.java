package libman.model;

public class PhieuPhat764 {
    private int id;
    private float tienphat;
    private int songayquahan;
    private int mucdohonghoc;
    private String ghichu;

    public PhieuPhat764() {
    }

    public PhieuPhat764(int id, float tienphat, int songayquahan, int mucdohonghoc, String ghichu) {
        this.id = id;
        this.tienphat = tienphat;
        this.songayquahan = songayquahan;
        this.mucdohonghoc = mucdohonghoc;
        this.ghichu = ghichu;
    }

    public int getMucdohonghoc() {
        return mucdohonghoc;
    }

    public void setMucdohonghoc(int mucdohonghoc) {
        this.mucdohonghoc = mucdohonghoc;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getTienphat() {
        return tienphat;
    }

    public void setTienphat(float tienphat) {
        this.tienphat = tienphat;
    }

    public int getSongayquahan() {
        return songayquahan;
    }

    public void setSongayquahan(int songayquahan) {
        this.songayquahan = songayquahan;
    }

    public String getGhichu() {
        return ghichu;
    }

    public void setGhichu(String ghichu) {
        this.ghichu = ghichu;
    }
}
