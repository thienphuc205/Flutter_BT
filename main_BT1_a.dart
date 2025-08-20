/*
Đề bài:
Viết chương trình nhập vào thông tin của một nhân viên:
● Họ tên.
● Số giờ làm việc.
● Lương mỗi giờ.
Chương trình sẽ:
1. Tính tổng lương = số giờ làm × lương mỗi giờ.
2. Thêm phụ cấp:
○ Nếu làm hơn 40 giờ, nhân viên nhận thêm 20% tổng lương.
3. Trừ thuế thu nhập:
○ Lương trên 10 triệu: trừ 10%.
○ Lương từ 7 đến 10 triệu: trừ 5%.
○ Lương dưới 7 triệu: không trừ.
4. In kết quả:
○ Họ tên, tổng lương trước thuế, thuế thu nhập, và lương thực lãnh
*/
void main() {
  print("--- Chương trình tính lương ---");

  // Tạo một đối tượng nhân viên
  var nhanVien1 = NhanVien("Nguyen Hoang Thien Phuc", 45, 180000);
  nhanVien1.tinhTongLuong();

  // Tạo thêm một nhân viên khác để kiểm tra
  var nhanVien2 = NhanVien("Pham Van Vu", 35, 250000);
  nhanVien2.tinhTongLuong();
}

class NhanVien {
  //Nhap thong tin
  String hoTen;
  double gioLamViec;
  double luongMoiGio;

  NhanVien(this.hoTen, this.gioLamViec, this.luongMoiGio);

  //Tinh tong luong nhan duoc
  void tinhTongLuong() {
    //Luong truoc thue
    double luongTruocThue = this.gioLamViec * this.luongMoiGio;

    // Them phu cap
    if (this.gioLamViec > 40) {
      luongTruocThue = luongTruocThue + (luongTruocThue * 0.2);
    }

    //Thue thu nhap
    double thueThuNhap = luongTruocThue > 10000000
        ? luongTruocThue * 0.1
        : luongTruocThue >= 7000000 && luongTruocThue <= 10000000
        ? luongTruocThue * 0.05
        : 0;

    //Luong cuoi cung nhan duoc
    double luongThucLanh = luongTruocThue - thueThuNhap;

    //In ket qua
    print("Bảng lương của nhân viên ${this.hoTen}");
    print("Tổng lương trước thuế: ${luongTruocThue.toStringAsFixed(0)} VND");
    print("Thuế thu nhập: ${thueThuNhap.toStringAsFixed(0)} VND");
    print("Lương thực lãnh: ${luongThucLanh.toStringAsFixed(0)} VND");
    print('----------------');
  }
}
