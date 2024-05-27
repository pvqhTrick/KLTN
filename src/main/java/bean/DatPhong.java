package bean;

import java.util.Date;

public class DatPhong {
	public int MaDatPhong;
	public int MaPhong;
	public int MaKhachHang;
	public Date NgayCheckIn;
	public Date NgayCheckOut;
	public double ThanhTien;
	public DatPhong() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DatPhong(int maDatPhong, int maPhong, int maKhachHang, Date ngayCheckIn, Date ngayCheckOut,
			double thanhTien) {
		super();
		MaDatPhong = maDatPhong;
		MaPhong = maPhong;
		MaKhachHang = maKhachHang;
		NgayCheckIn = ngayCheckIn;
		NgayCheckOut = ngayCheckOut;
		ThanhTien = thanhTien;
	}
	public int getMaDatPhong() {
		return MaDatPhong;
	}
	public void setMaDatPhong(int maDatPhong) {
		MaDatPhong = maDatPhong;
	}
	public int getMaPhong() {
		return MaPhong;
	}
	public void setMaPhong(int maPhong) {
		MaPhong = maPhong;
	}
	public int getMaKhachHang() {
		return MaKhachHang;
	}
	public void setMaKhachHang(int maKhachHang) {
		MaKhachHang = maKhachHang;
	}
	public Date getNgayCheckIn() {
		return NgayCheckIn;
	}
	public void setNgayCheckIn(Date ngayCheckIn) {
		NgayCheckIn = ngayCheckIn;
	}
	public Date getNgayCheckOut() {
		return NgayCheckOut;
	}
	public void setNgayCheckOut(Date ngayCheckOut) {
		NgayCheckOut = ngayCheckOut;
	}
	public double getThanhTien() {
		return ThanhTien;
	}
	public void setThanhTien(double thanhTien) {
		ThanhTien = thanhTien;
	}
		
}
