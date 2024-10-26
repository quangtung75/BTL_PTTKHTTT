package libman.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TheBanDoc764 {
    private int id;
    private byte[] anhthe;
    private Date ngaydangky;
    private String mathe;
    private String trangthai;
    private BanDoc764 banDoc;

    public TheBanDoc764() {
    }

    public TheBanDoc764(int id, byte[] anhthe, Date ngaydangky, String mathe, String trangthai, BanDoc764 banDoc) {
        this.id = id;
        this.anhthe = anhthe;
        this.ngaydangky = ngaydangky;
        this.mathe = mathe;
        this.trangthai = trangthai;
        this.banDoc = banDoc;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public byte[] getAnhthe() {
        return anhthe;
    }

    public void setAnhthe(byte[] anhthe) {
        this.anhthe = anhthe;
    }

    public Date getNgaydangky() {
        return ngaydangky;
    }

    public void setNgaydangky(Date ngaydangky) {
        this.ngaydangky = ngaydangky;
    }

    public String getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(String trangthai) {
        this.trangthai = trangthai;
    }

    public BanDoc764 getBanDoc() {
        return banDoc;
    }

    public void setBanDoc(BanDoc764 banDoc) {
        this.banDoc = banDoc;
    }

    public String getMathe() {
        return mathe;
    }

    public void setMathe(String mathe) {
        this.mathe = mathe;
    }

    public String taoMaThe() {
        String[] parts = this.banDoc.getHoTen().split(" ");
        StringBuilder maTheBuilder = new StringBuilder("BD_");
        for(String part:parts) {
            if(!part.isEmpty()) {
                maTheBuilder.append(part.charAt(0));
            }
        }
        String sdt = this.banDoc.getSdt();
        String soCuoiSdt = sdt.substring(sdt.length() - 4);
        maTheBuilder.append(soCuoiSdt);
        return maTheBuilder.toString();
    }
}
