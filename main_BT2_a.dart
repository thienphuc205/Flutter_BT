/*
Đề bài:
Viết chương trình quản lý danh sách sinh viên gồm các chức năng sau:
Thêm sinh viên vào danh sách. Mỗi sinh viên có:
Họ tên.
Điểm toán.
Điểm lý.
Điểm hóa.
Hiển thị danh sách sinh viên kèm theo:
Điểm trung bình (ĐTB).
Xếp loại học lực dựa trên ĐTB: 
Dưới 5: Kém, 5 - 7: Khá, 7 - 9: Giỏi, lớn hơn 9: Xuất sắc
Tìm sinh viên có ĐTB cao nhất trong danh sách.
Thoát chương trình.
*/

import 'dart:io';

void main() {
  var quanLy = QuanLySinhVien();
  while (true) {
    print('Menu quản lý sinh viên');
    print('1. Thêm sinh viên');
    print('2. Hiển thị danh sách');
    print('3. Tìm sinh viên ĐTB cao nhất');
    print('4. Thoát');
    stdout.write('Mời bạn chọn: ');

    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        quanLy.themSinhVien();
        break;
      case '2':
        quanLy.hienThiDanhSachSV();
        break;
      case '3':
        quanLy.timDiemCaoNhat();
        break;
      case '4':
        return;
      default:
        print('Lựa chọn không hợp lệ!');
    }
  }
}

class SinhVien {
  String hoTen;
  double diemToan;
  double diemLy;
  double diemHoa;

  SinhVien({
    required this.hoTen,
    required this.diemToan,
    required this.diemLy,
    required this.diemHoa,
  });
  double diemTB() {
    double diemTrungBinh = (this.diemToan + this.diemHoa + this.diemLy) / 3;
    return diemTrungBinh;
  }

  String xepLoai() {
    double dtb = diemTB();
    return (dtb > 9
        ? "Xuất sắc"
        : dtb > 7 && dtb <= 9
        ? "Giỏi"
        : dtb <= 7 && dtb >= 5
        ? "Khá"
        : "Kém");
  }
}

class QuanLySinhVien {
  List<SinhVien> danhSach = [];

  // Thêm sinh viên
  void themSinhVien() {
    stdout.write('Nhập họ tên: ');
    String ten = stdin.readLineSync() ?? 'Sinh viên chưa nhập họ tên';

    stdout.write('Nhập điểm toán: ');
    double toan = double.parse(stdin.readLineSync() ?? "0");

    stdout.write('Nhập điểm lý: ');
    double ly = double.parse(stdin.readLineSync() ?? "0");

    stdout.write('Nhập điểm hóa: ');
    double hoa = double.parse(stdin.readLineSync() ?? "0");

    var svMoi = SinhVien(hoTen: ten, diemToan: toan, diemLy: ly, diemHoa: hoa);
    danhSach.add(svMoi);
  }

  // Hiển thị danh sách sinh viên
  void hienThiDanhSachSV() {
    print('Danh sách sinh viên');

    for (var sv in danhSach) {
      double dtb = sv.diemTB();
      String xl = sv.xepLoai();
      print('--------------------------------------');
      print(
        'Họ tên: ${sv.hoTen} - Điểm toán: ${sv.diemToan} - Điểm lý: ${sv.diemLy} - Điểm Hóa: ${sv.diemHoa}  - Điểm trung bình: ${dtb.toStringAsFixed(1)} - Xếp loại: ${xl}',
      );
      print('--------------------------------------');
    }
  }

  // Tìm sinh viên có điểm trung bình cao nhất
  void timDiemCaoNhat() {
    if (danhSach.isEmpty) {
      print('--------------------------------------');
      print('Không có sinh viên nào trong danh sách');
      print('--------------------------------------');
      return;
    }
    var svDiemCaoNhat = danhSach[0];
    for (var sv in danhSach) {
      if (sv.diemTB() > svDiemCaoNhat.diemTB()) {
        svDiemCaoNhat = sv;
      }
    }
    print('--------------------------------------');
    print(
      'Họ tên: ${svDiemCaoNhat.hoTen} - Điểm toán: ${svDiemCaoNhat.diemToan} - Điểm lý: ${svDiemCaoNhat.diemLy} - Điểm Hóa: ${svDiemCaoNhat.diemHoa}  - Điểm trung bình: ${svDiemCaoNhat.diemTB().toStringAsFixed(1)} - Xếp loại: ${svDiemCaoNhat.xepLoai()}',
    );
    print('--------------------------------------');
  }
}
