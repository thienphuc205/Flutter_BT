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
// void main() {
//   print("--- Chương trình tính lương ---");

//   // Tạo một đối tượng nhân viên
//   var nhanVien1 = NhanVien("Nguyen Hoang Thien Phuc", 45, 180000);
//   nhanVien1.tinhTongLuong();

//   // Tạo thêm một nhân viên khác để kiểm tra
//   var nhanVien2 = NhanVien("Pham Van Vu", 35, 250000);
//   nhanVien2.tinhTongLuong();
// }

// class NhanVien {
//   //Nhap thong tin
//   String hoTen;
//   double gioLamViec;
//   double luongMoiGio;

//   NhanVien(this.hoTen, this.gioLamViec, this.luongMoiGio);

//   //Tinh tong luong nhan duoc
//   void tinhTongLuong() {
//     //Luong truoc thue
//     double luongTruocThue = this.gioLamViec * this.luongMoiGio;

//     // Them phu cap
//     if (this.gioLamViec > 40) {
//       luongTruocThue = luongTruocThue + (luongTruocThue * 0.2);
//     }

//     //Thue thu nhap
//     double thueThuNhap = luongTruocThue > 10000000
//         ? luongTruocThue * 0.1
//         : luongTruocThue >= 7000000 && luongTruocThue <= 10000000
//         ? luongTruocThue * 0.05
//         : 0;

//     //Luong cuoi cung nhan duoc
//     double luongThucLanh = luongTruocThue - thueThuNhap;

//     //In ket qua
//     print("Bảng lương của nhân viên ${this.hoTen} ---");
//     print("Tổng lương trước thuế: ${luongTruocThue.toStringAsFixed(0)} VND");
//     print("Thuế thu nhập: ${thueThuNhap.toStringAsFixed(0)} VND");
//     print("Lương thực lãnh: ${luongThucLanh.toStringAsFixed(0)} VND");
//   }
// }

/*
Đề bài:
Viết chương trình nhập vào thông tin của một hóa đơn bán hàng:
● Tên sản phẩm.
● Số lượng mua.
● Đơn giá.
Chương trình sẽ:
1. Tính thành tiền = số lượng × đơn giá.
2. Áp dụng giảm giá:
○ Nếu thành tiền >= 1,000,000, giảm giá 10%.
○ Nếu thành tiền từ 500,000 đến dưới 1,000,000, giảm giá 5%.
○ Nếu dưới 500,000, không giảm giá.
3. Tính thuế VAT 8% trên tổng số tiền sau giảm giá.
4. In hóa đơn bao gồm:
○ Tên sản phẩm, số lượng, đơn giá.
○ Thành tiền, giảm giá, thuế VAT, và tổng thanh toán cuối cùng.
*/
void main() {
  print("--- Hóa Đơn Thanh Toán ---");

  // Tạo hóa đơn 1
  var hoadon1 = HoaDon("My Ly Cung Dinh", 5, 16000);
  hoadon1.tongTien();

  // Tạo hóa đơn 2
  var hoadon2 = HoaDon("Bánh mì trứng", 1, 12000);
  hoadon2.tongTien();
}

class HoaDon {
  //Nhap thong tin hoa don
  String tenSanPham;
  int soLuongMua;
  double donGia;

  HoaDon(this.tenSanPham, this.soLuongMua, this.donGia);

  // Tong tien can tra
  void tongTien() {
    //So tien truoc khi giam gia
    double tienTruocGiamGia = this.soLuongMua * this.donGia;
    double tienSauGiamGia;

    //So tien khi ap dung giam gia
    if (tienTruocGiamGia >= 1000000) {
      tienSauGiamGia = tienTruocGiamGia - tienTruocGiamGia * 0.1;
    } else if (tienTruocGiamGia >= 500000 && tienTruocGiamGia < 1000000) {
      tienSauGiamGia = tienTruocGiamGia - tienTruocGiamGia * 0.05;
    } else {
      tienSauGiamGia = tienTruocGiamGia;
    }

    //Tinh thue VAT
    double thueVAT = tienSauGiamGia * 0.08;

    //Tinh tong thanh toan cuoi cung
    double tongTienThanhToan = tienSauGiamGia + thueVAT;

    //In ket qua
    print("Tên sản phẩm: ${this.tenSanPham} ");
    print("Số lượng: ${this.soLuongMua}");
    print("Đơn giá ${this.donGia.toStringAsFixed(0)} VND");
    print(
      "Tổng tiền trước giảm giá: ${tienTruocGiamGia.toStringAsFixed(0)} VND",
    );
    print(
      "Giảm giá ${(tienTruocGiamGia - tienSauGiamGia).toStringAsFixed(0)} VND",
    );
    print("Tổng tiền sau giảm giá: ${tienSauGiamGia.toStringAsFixed(0)} VND");
    print("Thuế VAT ${thueVAT.toStringAsFixed(0)} VND");
    print(
      "Tổng thanh toán cuối cùng ${tongTienThanhToan.toStringAsFixed(0)} VND ---",
    );
  }
}
