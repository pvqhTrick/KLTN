package bean;

public class NhanVien {
	public int IdNhanVien;
	public String HoTen;
	public String ChucVu;
	public Double Luong;
	public String MoTa;
	public String TenDangNhap;
	public String Password;
	public String AnhDaiDien;
	public NhanVien() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Double getLuong() {
		return Luong;
	}

	public void setLuong(Double luong) {
		Luong = luong;
	}

	public NhanVien(int idNhanVien, String hoTen, String chucVu, Double luong, String moTa, String tenDangNhap,
			String password) {
		super();
		IdNhanVien = idNhanVien;
		HoTen = hoTen;
		ChucVu = chucVu;
		Luong = luong;
		MoTa = moTa;
		TenDangNhap = tenDangNhap;
		Password = password;
	}

	public NhanVien(int idNhanVien, String hoTen, String chucVu, String moTa, String tenDangNhap, String password,
			String anhDaiDien) {
		super();
		IdNhanVien = idNhanVien;
		HoTen = hoTen;
		ChucVu = chucVu;
		MoTa = moTa;
		TenDangNhap = tenDangNhap;
		Password = password;
		AnhDaiDien = anhDaiDien;
	}

	public String getAnhDaiDien() {
		return AnhDaiDien;
	}

	public void setAnhDaiDien(String anhDaiDien) {
		AnhDaiDien = anhDaiDien;
	}

	public int getIdNhanVien() {
		return IdNhanVien;
	}
	public void setIdNhanVien(int idNhanVien) {
		IdNhanVien = idNhanVien;
	}
	public String getHoTen() {
		return HoTen;
	}
	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}
	public String getChucVu() {
		return ChucVu;
	}
	public void setChucVu(String chucVu) {
		ChucVu = chucVu;
	}
	public String getMoTa() {
		return MoTa;
	}
	public void setMoTa(String moTa) {
		MoTa = moTa;
	}
	public String getTenDangNhap() {
		return TenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		TenDangNhap = tenDangNhap;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	
}
