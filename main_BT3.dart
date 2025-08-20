/*
Viết một chương trình quản lý hóa đơn bán hàng sử dụng hàm trong Dart. Chương trình cần thực hiện các chức năng sau:
Thêm sản phẩm vào giỏ hàng - Bao gồm tên sản phẩm, số lượng và giá tiền.
Sửa và xóa sản phẩm ở giỏ hàng
Hiển thị giỏ hàng - Danh sách sản phẩm kèm theo thông tin chi tiết.
Tính tổng tiền hóa đơn - Tổng số tiền phải thanh toán.
Yêu cầu:
Sử dụng hàm riêng cho từng chức năng.
Dữ liệu sản phẩm được lưu trong danh sách (List) sử dụng Map.
Hiển thị kết quả ra màn hình bằng print().
 */
import 'dart:io';

void main() {
  List<Map<String, dynamic>> gioHang = [];

  while (true) {
    print('Menu quản lý hóa đơn bán hàng');

    print('1. Thêm sản phẩm vào giỏ hàng');

    print('2. Sửa và xóa sản phẩm ở giỏ hàng');

    print('3. Hiển thị giỏ hàng');

    print('4. Tính tổng tiền hóa đơn');

    print('5. Thoát');

    stdout.write('Mời bạn chọn: ');

    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        themSanPham(gioHang);
        break;

      case '2':
        hienThiSanPham(gioHang);

        print('Bạn muốn (1) Sửa hay (2) Xóa sản phẩm?');
        stdout.write('Chọn 1 hoặc 2: ');
        var luaChon = stdin.readLineSync();
        if (luaChon == '1') {
          suaSanPham(gioHang);
        } else if (luaChon == '2') {
          xoaSanPham(gioHang);
        }
        break;

      case '3':
        hienThiSanPham(gioHang);
        break;

      case '4':
        print('-----------------------');
        print('Tổng số tiền phải thanh toán là: ${tongHoaDon(gioHang)}');
        print('-----------------------');
        break;

      case '5':
        return;

      default:
        print('Lựa chọn không hợp lệ!');
    }
  }
}

void themSanPham(List<Map<String, dynamic>> gioHang) {
  stdout.write('Nhập tên sản phẩm: ');
  String tenSP = stdin.readLineSync() ?? '';

  stdout.write('Nhập số lượng sản phẩm: ');
  int soLuong = int.parse(stdin.readLineSync() ?? '0');

  stdout.write('Nhập giá tiền sản phẩm: ');
  double giaTien = double.parse(stdin.readLineSync() ?? '0');

  Map<String, dynamic> sanPhamMoi = {
    'tenSanPham': tenSP,
    'soLuong': soLuong,
    'giaTien': giaTien,
  };

  gioHang.add(sanPhamMoi);
  print('-----------------------');
  print('Đã thêm sản phẩm ${tenSP} vào giỏ hàng');
  print('-----------------------');
}

void hienThiSanPham(List<Map<String, dynamic>> gioHang) {
  if (gioHang.isEmpty) {
    print('Giỏ hàng đang trống');
    return;
  }

  for (int i = 0; i < gioHang.length; i++) {
    String ten = gioHang[i]['tenSanPham'];
    int soLuong = gioHang[i]['soLuong'];
    double giaTien = gioHang[i]['giaTien'];
    print('-----------------------');
    print(
      '${i + 1}. Tên sản phẩm: ${ten} - Số lượng: ${soLuong} - Giá tiền ${giaTien}',
    );
    print('-----------------------');
  }
}

void xoaSanPham(List<Map<String, dynamic>> gioHang) {
  hienThiSanPham(gioHang);
  stdout.write('Bạn muốn xóa sản phẩm số mấy? ');
  int input = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  int index = input - 1;
  if (index >= 0 && index < gioHang.length) {
    gioHang.removeAt(index);
    print('Xóa sản phẩm thành công');
  } else {
    print('Số đã nhập không hợp lệ!');
  }
}

double tongHoaDon(List<Map<String, dynamic>> gioHang) {
  double tongCong = 0.0;
  for (var sanPham in gioHang) {
    double thanhTien = sanPham['soLuong'] * sanPham['giaTien'];
    tongCong = tongCong + thanhTien;
  }
  return tongCong;
}

void suaSanPham(List<Map<String, dynamic>> gioHang) {
  hienThiSanPham(gioHang);
  stdout.write('Bạn muốn sửa sản phẩm số mấy? ');
  int input = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  int index = input - 1;
  if (index >= 0 && index < gioHang.length) {
    // Thay đổi số lượng mới
    stdout.write('Hãy nhập số lượng mới: ');
    int soLuongMoi = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    gioHang[index]['soLuong'] = soLuongMoi;
    //Thay đổi giá tiền mới
    stdout.write('Hãy nhập giá tiền mới: ');
    double giaTienMoi = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
    gioHang[index]['giaTien'] = giaTienMoi;
    print(
      'Thay đổi thông tin sản phẩm thành công: ${gioHang[index]['tenSanPham']} -  ${gioHang[index]['soLuong']} - ${gioHang[index]['giaTien']}',
    );
  } else {
    print('Số đã nhập không hợp lệ!');
  }
}
