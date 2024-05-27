package bo;

import java.util.ArrayList;
import java.util.Date;

import bean.Booking;
import dao.BookingDao;

public class BookingBo {
	BookingDao bdao = new BookingDao();
	public ArrayList<Booking> getBooking(){
		return bdao.getBooking();
	}
	
	public ArrayList<Booking> getLichSu(int idKH){
		return bdao.getLichSu(idKH);
	}
	
	public void setBooking(int IdPhong, int IdKhachHang, Date Datein, Date Dateout, String Note ,float TongTien) {
		bdao.setBooking(IdPhong,IdKhachHang,Datein, Dateout, Note, TongTien);
	}
	public void ThanhToan(int id) {
		bdao.ThanhToan(id);
	}
	public float DoanhThuThang(int m) {
		return bdao.DoanhThuThang(m);
	}
	public void XacNhan(int IdDatPhong) {
		bdao.XacNhan(IdDatPhong);
	}
	public void HuyXacNhan(int IdDatPhong) {
		bdao.HuyXacNhan(IdDatPhong);
	}

}
