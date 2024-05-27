package bean;

public class Ratingbean {
	public int IdRatting;
	public int IdKhachHang;
	public int IdPhong;
	public float Stars;
	public String BinhLuan;
	public int getIdRatting() {
		return IdRatting;
	}
	public void setIdRatting(int idRatting) {
		IdRatting = idRatting;
	}
	public int getIdKhachHang() {
		return IdKhachHang;
	}
	public void setIdKhachHang(int idKhachHang) {
		IdKhachHang = idKhachHang;
	}
	public int getIdPhong() {
		return IdPhong;
	}
	public void setIdPhong(int idPhong) {
		IdPhong = idPhong;
	}
	public float getStars() {
		return Stars;
	}
	public void setStars(float stars) {
		Stars = stars;
	}
	public String getBinhLuan() {
		return BinhLuan;
	}
	public void setBinhLuan(String binhLuan) {
		BinhLuan = binhLuan;
	}
	public Ratingbean(int idRatting, int idKhachHang, int idPhong, float stars, String binhLuan) {
		super();
		IdRatting = idRatting;
		IdKhachHang = idKhachHang;
		IdPhong = idPhong;
		Stars = stars;
		BinhLuan = binhLuan;
	}
	
}
