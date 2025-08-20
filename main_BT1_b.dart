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
    print('-----------');
  }
}
