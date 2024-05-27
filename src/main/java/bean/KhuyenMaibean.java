package bean;

import java.util.Date;

public class KhuyenMaibean {
	public int IdKhuyenMai;
	public String TenKhuyenMai;
	public double ChietKhau;
	public Date NgayBatDau;
	public Date ngayKetThuc;
	public String MoTa;
	public String Banner;
//	public KhuyenMaibean(int idKhuyenMai, String tenKhuyenMai, double chietKhau, String moTa) {
//		super();
//		IdKhuyenMai = idKhuyenMai;
//		TenKhuyenMai = tenKhuyenMai;
//		ChietKhau = chietKhau;
//		MoTa = moTa;
//	}
	
	public KhuyenMaibean(int idKhuyenMai, String tenKhuyenMai, double chietKhau, Date ngayBatDau, Date ngayKetThuc,
			String moTa,String banner) {
		super();
		IdKhuyenMai = idKhuyenMai;
		TenKhuyenMai = tenKhuyenMai;
		ChietKhau = chietKhau;
		NgayBatDau = ngayBatDau;
		this.ngayKetThuc = ngayKetThuc;
		MoTa = moTa;
		Banner = banner;
	}
	
	public String getBanner() {
		return Banner;
	}

	public void setBanner(String banner) {
		Banner = banner;
	}

	public Date getNgayBatDau() {
		return NgayBatDau;
	}

	public void setNgayBatDau(Date ngayBatDau) {
		NgayBatDau = ngayBatDau;
	}

	public Date getNgayKetThuc() {
		return ngayKetThuc;
	}

	public void setNgayKetThuc(Date ngayKetThuc) {
		this.ngayKetThuc = ngayKetThuc;
	}

	public KhuyenMaibean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getIdKhuyenMai() {
		return IdKhuyenMai;
	}
	public void setIdKhuyenMai(int idKhuyenMai) {
		IdKhuyenMai = idKhuyenMai;
	}
	public String getTenKhuyenMai() {
		return TenKhuyenMai;
	}
	public void setTenKhuyenMai(String tenKhuyenMai) {
		TenKhuyenMai = tenKhuyenMai;
	}
	public double getChietKhau() {
		return ChietKhau;
	}
	public void setChietKhau(double chietKhau) {
		ChietKhau = chietKhau;
	}
	public String getMoTa() {
		return MoTa;
	}
	public void setMoTa(String moTa) {
		MoTa = moTa;
	}
	
}
