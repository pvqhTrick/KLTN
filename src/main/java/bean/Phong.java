package bean;

public class Phong {
	public int IdPhong;
	public String TenPhong;
	public int IdLoaiPhong;
	public Double Gia;
	public Boolean TrangThai;
	public int SoLanDuocDat;
	public int RatingId;
	public String MoTa;
	public int IdKhuyenMai;
	public String Anh;
	
	public int SoPhongConLai;
	public int maxNguoiLon;
	public int maxTreEm;
	
	public Phong() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Phong(int idPhong, String tenPhong, int idLoaiPhong, Double gia, Boolean trangThai, int soLanDuocDat,
			int ratingId, String moTa, int idKhuyenMai, String anh) {
		super();
		IdPhong = idPhong;
		TenPhong = tenPhong;
		IdLoaiPhong = idLoaiPhong;
		Gia = gia;
		TrangThai = trangThai;
		SoLanDuocDat = soLanDuocDat;
		RatingId = ratingId;
		MoTa = moTa;
		IdKhuyenMai = idKhuyenMai;
		Anh = anh;
	}
	
	public Phong(int idPhong, String tenPhong, int idLoaiPhong, Double gia, Boolean trangThai, int soLanDuocDat,
			int ratingId, String moTa, int idKhuyenMai, String anh, int soPhongConLai) {
		super();
		IdPhong = idPhong;
		TenPhong = tenPhong;
		IdLoaiPhong = idLoaiPhong;
		Gia = gia;
		TrangThai = trangThai;
		SoLanDuocDat = soLanDuocDat;
		RatingId = ratingId;
		MoTa = moTa;
		IdKhuyenMai = idKhuyenMai;
		Anh = anh;
		SoPhongConLai = soPhongConLai;
	}
	
	public Phong(int idPhong, String tenPhong, int idLoaiPhong, Double gia, Boolean trangThai, int soLanDuocDat,
			int ratingId, String moTa, int idKhuyenMai, String anh, int soPhongConLai, int maxNguoiLon, int maxTreEm) {
		super();
		IdPhong = idPhong;
		TenPhong = tenPhong;
		IdLoaiPhong = idLoaiPhong;
		Gia = gia;
		TrangThai = trangThai;
		SoLanDuocDat = soLanDuocDat;
		RatingId = ratingId;
		MoTa = moTa;
		IdKhuyenMai = idKhuyenMai;
		Anh = anh;
		SoPhongConLai = soPhongConLai;
		this.maxNguoiLon = maxNguoiLon;
		this.maxTreEm = maxTreEm;
	}

	public int getMaxNguoiLon() {
		return maxNguoiLon;
	}

	public void setMaxNguoiLon(int maxNguoiLon) {
		this.maxNguoiLon = maxNguoiLon;
	}

	public int getMaxTreEm() {
		return maxTreEm;
	}

	public void setMaxTreEm(int maxTreEm) {
		this.maxTreEm = maxTreEm;
	}

	public int getSoPhongConLai() {
		return SoPhongConLai;
	}

	public void setSoPhongConLai(int soPhongConLai) {
		SoPhongConLai = soPhongConLai;
	}

	public int getIdPhong() {
		return IdPhong;
	}

	public void setIdPhong(int idPhong) {
		IdPhong = idPhong;
	}

	public int getIdLoaiPhong() {
		return IdLoaiPhong;
	}

	public void setIdLoaiPhong(int idLoaiPhong) {
		IdLoaiPhong = idLoaiPhong;
	}

	public int getRatingId() {
		return RatingId;
	}

	public void setRatingId(int ratingId) {
		RatingId = ratingId;
	}

	public String getTenPhong() {
		return TenPhong;
	}
	public void setTenPhong(String tenPhong) {
		TenPhong = tenPhong;
	}
	
	public Double getGia() {
		return Gia;
	}
	public void setGia(Double gia) {
		Gia = gia;
	}
	public Boolean getTrangThai() {
		return TrangThai;
	}
	public void setTrangThai(Boolean trangThai) {
		TrangThai = trangThai;
	}
	public int getSoLanDuocDat() {
		return SoLanDuocDat;
	}
	public void setSoLanDuocDat(int soLanDuocDat) {
		SoLanDuocDat = soLanDuocDat;
	}
	
	public String getMoTa() {
		return MoTa;
	}
	public void setMoTa(String moTa) {
		MoTa = moTa;
	}
	public int getIdKhuyenMai() {
		return IdKhuyenMai;
	}
	public void setIdKhuyenMai(int idKhuyenMai) {
		IdKhuyenMai = idKhuyenMai;
	}
	public String getAnh() {
		return Anh;
	}
	public void setAnh(String anh) {
		Anh = anh;
	}
	
	
}
