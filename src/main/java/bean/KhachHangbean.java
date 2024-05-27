package bean;

public class KhachHangbean {
	public int IdKhachHang;
	public String HoTen;
	public String SDT;
	public Boolean GioiTinh;
	public String CCCD;
	public String Email;
	public String DiaChi;
	public String Tendn;
	public String Password;
	public KhachHangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
				public KhachHangbean(int idKhachHang, String hoTen, String sDT, Boolean gioiTinh, String cCCD, String email,
						String diaChi, String tendn, String password) {
					super();
					IdKhachHang = idKhachHang;
					HoTen = hoTen;
					SDT = sDT;
					GioiTinh = gioiTinh;
					CCCD = cCCD;
					Email = email;
					DiaChi = diaChi;
					Tendn = tendn;
					Password = password;
				}

	public KhachHangbean(int id, String hoTen, String sDT, String cCCD, String email) {
					super();
					IdKhachHang = id;
					HoTen = hoTen;
					SDT = sDT;
					CCCD = cCCD;
					Email = email;
				}
	
	public int getIdKhachHang() {
		return IdKhachHang;
	}

	public void setIdKhachHang(int idKhachHang) {
		IdKhachHang = idKhachHang;
	}

	public String getHoTen() {
		return HoTen;
	}
	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}
	public String getSDT() {
		return SDT;
	}
	public void setSDT(String sDT) {
		SDT = sDT;
	}
	public Boolean getGioiTinh() {
		return GioiTinh;
	}
	public void setGioiTinh(Boolean gioiTinh) {
		GioiTinh = gioiTinh;
	}
	public String getCCCD() {
		return CCCD;
	}
	public void setCCCD(String cCCD) {
		CCCD = cCCD;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getDiaChi() {
		return DiaChi;
	}
	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}
	public String getTendn() {
		return Tendn;
	}
	public void setTendn(String tendn) {
		Tendn = tendn;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	
} 
