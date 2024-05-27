package bean;

import java.util.ArrayList;

public class LoaiPhong {
	public int IdLoaiPhong;
	public String LoaiPhong;
	public int SoGiuongDoi;
	public int SoGiuongDon;
	public ArrayList<String> TienNghi;
	public LoaiPhong(int idLoaiPhong, String loaiPhong, int soGiuongDoi, int soGiuongDon, ArrayList<String> tienNghi) {
		super();
		IdLoaiPhong = idLoaiPhong;
		LoaiPhong = loaiPhong;
		SoGiuongDoi = soGiuongDoi;
		SoGiuongDon = soGiuongDon;
		TienNghi = tienNghi;
	}
	public LoaiPhong() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getIdLoaiPhong() {
		return IdLoaiPhong;
	}
	public void setIdLoaiPhong(int idLoaiPhong) {
		IdLoaiPhong = idLoaiPhong;
	}
	public String getLoaiPhong() {
		return LoaiPhong;
	}
	public void setLoaiPhong(String loaiPhong) {
		LoaiPhong = loaiPhong;
	}
	public int getSoGiuongDoi() {
		return SoGiuongDoi;
	}
	public void setSoGiuongDoi(int soGiuongDoi) {
		SoGiuongDoi = soGiuongDoi;
	}
	public int getSoGiuongDon() {
		return SoGiuongDon;
	}
	public void setSoGiuongDon(int soGiuongDon) {
		SoGiuongDon = soGiuongDon;
	}
	public ArrayList<String> getTienNghi() {
		return TienNghi;
	}
	public void setTienNghi(ArrayList<String> tienNghi) {
		TienNghi = tienNghi;
	}
	
}
