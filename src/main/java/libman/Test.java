package libman;

import com.google.gson.Gson;
import libman.model.BanDoc764;

public class Test {
    public static void main(String[] args) {
        BanDoc764 banDoc = new BanDoc764(1, "taiKhoan", "matKhau", "hoTen", "email", "sdt", "diaChi", "ghiChu", "vaiTro", 10, "ghichu");
        Gson gson = new Gson();
        String json = gson.toJson(banDoc);
        gson.fromJson(json, BanDoc764.class);
        System.out.println(json);
        System.out.println(banDoc.getHoTen());
    }
}
