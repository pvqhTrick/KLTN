package bo;

import java.util.ArrayList;

import bean.Phong;
import bean.Ratingbean;
import dao.PhongDao;

public class PhongBo {
	ArrayList<Phong> dsphong ;
	PhongDao pdao = new PhongDao();
	public ArrayList<Phong> getPhong()throws Exception{
		dsphong= pdao.getPhong();
		return dsphong;
	}
//	public ArrayList<TienNghi> getTienNghi()throws Exception{
//		
//	}
	public ArrayList<Phong> TimPhong(String TenPhong) throws Exception{
		ArrayList<Phong> tam = new ArrayList<Phong>();
		for(Phong item : dsphong) {
			if(TenPhong.toLowerCase().trim().contains(item.getTenPhong().toLowerCase().trim()) && item.getTrangThai()==false){
				tam.add(item);
			}
		}
		return tam;
	}
	public ArrayList<Phong> Tim(String TenPhong) throws Exception{
		return pdao.Tim(TenPhong);
	}
	public Phong XemChiTiet(int id) throws Exception{
		return pdao.XemChiTiet(id);
	}
	public void DatPhong(int idPhong, int User) {
		 pdao.DatPhong(idPhong,User);
		 updatephong(idPhong);
	}
	public void updatephong(int idPhong) {
		pdao.updatephong(idPhong);
	}
	public ArrayList<Ratingbean> getRating(int idPhong) {
		return pdao.getRating(idPhong);
	}
	public ArrayList<Phong> getPhongLienQuan(int id)throws Exception{
		return pdao.getPhongLienQuan(id);
	}
	public void SuaPhong(int IdPhong, String TenPhong, int IdLoaiPhong, Double Gia, Boolean TrangThai, int SoLanDuocDat, int RatingId, String MoTa, int IdKhuyenMai, String Anh, int SoPhongConLai) {
		pdao.SuaPhong(IdPhong,TenPhong,IdLoaiPhong,Gia, TrangThai, SoLanDuocDat, RatingId, MoTa, IdKhuyenMai, Anh,SoPhongConLai);
	}
	public ArrayList<Phong> TimPhong(int slNguoiLon, int slTreEm){
		return pdao.TimPhong(slNguoiLon,slTreEm);
	}
	public ArrayList<Phong> top5phong(){
		return pdao.top5Phong();
	}
}
