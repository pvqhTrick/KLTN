package bean;

import java.util.Date;
import java.util.concurrent.TimeUnit;

public class Booking {	
	public int IDBooking;
	public int IDPhong;
	public int IDKhachHang;
	public Date ThoiGianDat;
	public Date ThoiGianThanhToan;
	public String Note;
	public boolean TinhTrangThanhToan;
	public float TongThanhToan;
	public boolean TinhTrangXacNhan;
	public Date NgayTao;
	   	
	public String getNote() {
		return Note;
	}
	public void setNote(String note) {
		Note = note;
	}
	public int getIDBooking() {
		return IDBooking;
	}
	public void setIDBooking(int iDBooking) {
		IDBooking = iDBooking;
	}
	public int getIDPhong() {
		return IDPhong;
	}
	public void setIDPhong(int iDPhong) {
		IDPhong = iDPhong;
	}
	public int getIDKhachHang() {
		return IDKhachHang;
	}
	public void setIDKhachHang(int iDKhachHang) {
		IDKhachHang = iDKhachHang;
	}
	public Date getThoiGianDat() {
		return ThoiGianDat;
	}
	public void setThoiGianDat(Date thoiGianDat) {
		ThoiGianDat = thoiGianDat;
	}
	public Date getThoiGianThanhToan() {
		return ThoiGianThanhToan;
	}
	public void setThoiGianThanhToan(Date thoiGianThanhToan) {
		ThoiGianThanhToan = thoiGianThanhToan;
	}
	public boolean getTinhTrangThanhToan() {
		return TinhTrangThanhToan;
	}
	public void setTinhTrangThanhToan(boolean tinhTrangThanhToan) {
		TinhTrangThanhToan = tinhTrangThanhToan;
	}
	public float getTongThanhToan() {
		return TongThanhToan;
	}
	public void setTongThanhToan(float tongThanhToan) {
		TongThanhToan = tongThanhToan;
	}
	
	public boolean getTinhTrangXacNhan() {
		return TinhTrangXacNhan;
	}
	public void setTinhTrangXacNhan(boolean tinhTrangXacNhan) {
		TinhTrangXacNhan = tinhTrangXacNhan;
	}
	public Date getNgayTao() {
		return NgayTao;
	}
	public void setNgayTao(Date ngayTao) {
		NgayTao = ngayTao;
	}
	public Booking(int iDBooking, int iDPhong, int iDKhachHang, Date thoiGianDat, Date thoiGianThanhToan, String note,
			boolean tinhTrangThanhToan, float tongThanhToan) {
		super();
		IDBooking = iDBooking;
		IDPhong = iDPhong;
		IDKhachHang = iDKhachHang;
		ThoiGianDat = thoiGianDat;
		ThoiGianThanhToan = thoiGianThanhToan;
		Note = note;
		TinhTrangThanhToan = tinhTrangThanhToan;
		TongThanhToan = tongThanhToan;
	}
	public Booking(int iDBooking, int iDPhong, int iDKhachHang, Date thoiGianDat, Date thoiGianThanhToan, String note, float tongThanhToan)
	{
		super();
		IDBooking = iDBooking;
		IDPhong = iDPhong;
		IDKhachHang = iDKhachHang;
		ThoiGianDat = thoiGianDat;
		ThoiGianThanhToan = thoiGianThanhToan;
		Note = note;
		TinhTrangThanhToan = false;
		TongThanhToan = tongThanhToan;
	}
	
	  public Booking(int iDBooking, int iDPhong, int iDKhachHang, Date thoiGianDat, Date thoiGianThanhToan, String note,
			boolean tinhTrangThanhToan, float tongThanhToan, boolean tinhTrangXacNhan, Date ngayTao) {
		super();
		IDBooking = iDBooking;
		IDPhong = iDPhong;
		IDKhachHang = iDKhachHang;
		ThoiGianDat = thoiGianDat;
		ThoiGianThanhToan = thoiGianThanhToan;
		Note = note;
		TinhTrangThanhToan = tinhTrangThanhToan;
		TongThanhToan = tongThanhToan;
		TinhTrangXacNhan = tinhTrangXacNhan;
		NgayTao = ngayTao;
	}
	public float calculateTotal(double gia,Date ThoiGianDat, Date ThoiGianThanhToan) {
	        if (ThoiGianThanhToan != null && ThoiGianDat != null) {
	            long diffInMillies = Math.abs(ThoiGianThanhToan.getTime() - ThoiGianDat.getTime());
	            long diffInHours = TimeUnit.MILLISECONDS.toHours(diffInMillies);

	            return (float) ((float)diffInHours *gia);
	        }
	        return 0;
	    }
	
}
