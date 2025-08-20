/*
Đề bài:
Viết chương trình quản lý sản phẩm trong cửa hàng gồm các chức năng sau:
Thêm sản phẩm vào danh sách.
Mỗi sản phẩm có:
Tên sản phẩm.
Giá tiền.
Số lượng trong kho.
Hiển thị danh sách sản phẩm với thông tin chi tiết.
Tìm kiếm sản phẩm theo tên.
Bán sản phẩm:
Nhập tên sản phẩm và số lượng cần bán.
Giảm số lượng tồn kho nếu có đủ hàng.
Báo lỗi nếu số lượng hàng không đủ.
Thoát chương trình.
*/

import 'dart:io';

void main() {
  var quanLy = QuanLySanPham();
  while (true) {
    print('Menu quản lý sản phẩm');
    print('1. Thêm sản phẩm vào danh sách');
    print('2. Hiển thị danh sách');
    print('3. Tìm kiếm sản phẩm');
    print('4. Bán sản phẩm');
    print('5. Thoát');
    stdout.write('Mời bạn chọn: ');

    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        quanLy.themSanPham();
        break;
      case '2':
        quanLy.hienThiDanhSachSP();
        break;
      case '3':
        quanLy.timKiemTheoTen();
        break;
      case '4':
        quanLy.thucHienBanSP();
        break;
      case '5':
        return;
      default:
        print('Lựa chọn không hợp lệ!');
    }
  }
}

class SanPham {
  String tenSP;
  double giaTien;
  int soLuongTrongKho;

  SanPham({
    required this.tenSP,
    required this.giaTien,
    required this.soLuongTrongKho,
  });
  bool banSanPham(int soLuongCanBan) {
    if (this.soLuongTrongKho >= soLuongCanBan) {
      this.soLuongTrongKho -= soLuongCanBan;
      return true;
    } else {
      return false;
    }
  }

  void hienThiThongTin() {
    print('--------------------------------------');
    print(
      'Tên sản phẩm: ${this.tenSP} - Giá: ${this.giaTien.toStringAsFixed(0)} VND - Số lượng trong kho: ${this.soLuongTrongKho}',
    );
    print('--------------------------------------');
  }
}

class QuanLySanPham {
  List<SanPham> danhSachSP = [];
  void themSanPham() {
    stdout.write('Nhập tên sản phẩm: ');
    String sp = stdin.readLineSync() ?? 'Chưa nhập tên sản phẩm';

    stdout.write('Nhập giá tiền: ');
    double tien = double.parse(stdin.readLineSync() ?? '0');

    stdout.write('Số lượng trong kho: ');
    int sl = int.parse(stdin.readLineSync() ?? '0');

    var sPhamMoi = SanPham(tenSP: sp, giaTien: tien, soLuongTrongKho: sl);
    danhSachSP.add(sPhamMoi);
  }

  void hienThiDanhSachSP() {
    for (var sp in danhSachSP) {
      sp.hienThiThongTin();
    }
  }

  void timKiemTheoTen() {
    stdout.write('Nhập tên sản phẩm cần tìm: ');
    String tenCanTim = stdin.readLineSync() ?? '';
    bool timThaySP = false;

    for (var sp in danhSachSP) {
      if (sp.tenSP.toLowerCase().contains(tenCanTim.toLowerCase())) {
        timThaySP = true;
        sp.hienThiThongTin();
      }
    }
    if (timThaySP == false) {
      print('--------------------------------------');
      print('Không tìm thấy sản phẩm');
      print('--------------------------------------');
    }
  }

  void thucHienBanSP() {
    stdout.write('Nhập tên sản phẩm cần bán: ');
    String tenSP = stdin.readLineSync() ?? '';

    stdout.write('Nhập số lượng cần bán: ');
    int soLuong = int.parse(stdin.readLineSync() ?? '0');

    SanPham? spTimThay = null;

    // Tìm xem có sản phẩm đó trong danh sách sản phẩm không
    for (var sp in danhSachSP) {
      if (sp.tenSP.toLowerCase() == tenSP.toLowerCase()) {
        spTimThay = sp;
        break;
      }
    }
    if (spTimThay == null) {
      print('--------------------------------------');
      print('Sản phẩm không tồn tại');
      print('--------------------------------------');
    } else {
      bool ketQua = spTimThay.banSanPham(soLuong);
      if (ketQua == true) {
        print('--------------------------------------');
        print('Giao dịch thành công');
        print('Số lượng trong kho: ${spTimThay.soLuongTrongKho}');
        print('--------------------------------------');
      } else {
        print('--------------------------------------');
        print('Giao dịch thất bại: Không đủ hàng trong kho');
        print('--------------------------------------');
      }
    }
  }
}
