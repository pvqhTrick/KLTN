package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.Booking;
import bean.KhachHangbean;
import bean.Phong;
import bean.Ratingbean;

public class PhongDao {
	public ArrayList<Phong> getPhong()throws Exception{
		ArrayList<Phong> ds = new ArrayList<Phong>();
		try {
		//Ket noi vao csld: QlSach
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		//Tạo cau lenh Sql
		String sql = "select * from Phong Order by TrangThai Desc";
		//tao cau lenh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);

		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			int IdPhong = rs.getInt("IdPhong");
			String TenPhong = rs.getString("TenPhong");
			int LoaiPhong = rs.getInt("IdLoaiPhong");
			Double gia = rs.getDouble("Gia");
			Boolean trangThai = rs.getBoolean("TrangThai");
			int SoLan = rs.getInt("SoLanDuocDat");
			int RatingId = rs.getInt("RatingId");
			String MoTa = rs.getString("MoTa");
			int IdKhuyenMai=rs.getInt("IdKhuyenMai");
			String Anh = rs.getString("Anh");
			int sophong = rs.getInt("SoPhongConLai");
			int slNguoiLon = rs.getInt("maxNguoiLon");
			int slTreEm = rs.getInt("maxTreEm");
			ds.add(new Phong(IdPhong, TenPhong, LoaiPhong,gia,trangThai,SoLan,RatingId,MoTa,IdKhuyenMai,Anh,sophong,slNguoiLon,slTreEm));
		}
		rs.close();
		kn.cn.close();
		}catch (Exception e) {e.printStackTrace();
			// TODO: handle exception
		}
		return ds;
	}
	public ArrayList<Phong> Tim(String txt)throws Exception{
		ArrayList<Phong> ds = new ArrayList<Phong>();
		try {
			
		//Ket noi vao csld: QlSach
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		//Tạo cau lenh Sql
		String sql = "select * from Phong where TenPhong like N'%"+txt+"%'";
		
		//tao cau lenh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
//		cmd.setString(0, txt);
//		System.out.println("SQL Query: " + sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			int IdPhong = rs.getInt("IdPhong");
			String TenPhong = rs.getString("TenPhong");
			int LoaiPhong = rs.getInt("IdLoaiPhong");
			Double gia = rs.getDouble("Gia");
			Boolean trangThai = rs.getBoolean("TrangThai");
			int SoLan = rs.getInt("SoLanDuocDat");
			int RatingId = rs.getInt("RatingId");
			String MoTa = rs.getString("MoTa");
			int IdKhuyenMai=rs.getInt("IdKhuyenMai");
			String Anh = rs.getString("Anh");
			int sophong = rs.getInt("SoPhongConLai");
			ds.add(new Phong(IdPhong, TenPhong, LoaiPhong,gia,trangThai,SoLan,RatingId,MoTa,IdKhuyenMai,Anh,sophong));
		}
		rs.close();
		kn.cn.close();
		}catch (Exception e) {e.printStackTrace();
			// TODO: handle exception
		}
		return ds;
	}
	public Phong XemChiTiet(int id) throws Exception{
		try {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			String sql = "Select * From Phong Where IdPhong = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1,id);
			ResultSet rs= cmd.executeQuery();
			while (rs.next()) {
				String ten = rs.getString("TenPhong");
				int idloaiphong = rs.getInt("IdLoaiPhong");
				Double gia = rs.getDouble("Gia");
				Boolean trangthai = rs.getBoolean("TrangThai");
				int soluongduocdat = rs.getInt("SoLanDuocDat");
				int danhgia = rs.getInt("RatingId");
				String mota= rs.getString("MoTa");
				int idkm=rs.getInt("IdKhuyenMai");
				String anh=rs.getString("Anh");
				int sophong = rs.getInt("SoPhongConLai");

				return new Phong(id, ten, idloaiphong, gia, trangthai, soluongduocdat, danhgia, mota, idkm, anh,sophong);
			}
			kn.cn.close();
			cmd.close();
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return null;
	}
	public void DatPhong(int id, int user) {
		try {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			String sql = "insert into ChiTietDatPhong(IdPhong,IdKhachHang) Values(?,?)";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1,id);
			cmd.setInt(2,user);
			cmd.executeUpdate();
			kn.cn.close();
			cmd.close();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	public void updatephong(int idphong) {
		try {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			String sql = "Update Phong set TrangThai = true where ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1,idphong);
			cmd.executeUpdate();
			kn.cn.close();
			cmd.close();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	
	public ArrayList<Ratingbean> getRating(int idphong) {
		try {
			ArrayList<Ratingbean> dsBL = new ArrayList<Ratingbean>();
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			String sql = "Select * from ChiTietDatPhong Where IdPhong = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1,idphong);
			ResultSet rs = cmd.executeQuery();
			while(rs.next()) {
				int IdRating = rs.getInt("RatingId");
				int IdKH = rs.getInt("IdKhachHang");
				int IdPhong= rs.getInt("IdPhong");
				float Star = rs.getFloat("SoDiem");
				String BL = rs.getString("BinhLuan");
				dsBL.add(new Ratingbean(IdRating, IdKH, IdPhong, Star, BL));
			}
			kn.cn.close();
			cmd.close();
			return dsBL;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	public ArrayList<Phong> getPhongLienQuan(int id)throws Exception{
		ArrayList<Phong> ds = new ArrayList<Phong>();
		try {
		//Ket noi vao csld: QlSach
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		//Tạo cau lenh Sql
		String sql = "select * from Phong ,LoaiPhong where Phong.IdLoaiPhong=LoaiPhong.IdLoaiPhong AND LoaiPhong.IdLoaiPhong=?";
		//tao cau lenh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setInt(1, id);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			int IdPhong = rs.getInt("IdPhong");
			String TenPhong = rs.getString("TenPhong");
			int LoaiPhong = rs.getInt("IdLoaiPhong");
			Double gia = rs.getDouble("Gia");
			Boolean trangThai = rs.getBoolean("TrangThai");
			int SoLan = rs.getInt("SoLanDuocDat");
			int RatingId = rs.getInt("RatingId");
			String MoTa = rs.getString("MoTa");
			int IdKhuyenMai=rs.getInt("IdKhuyenMai");
			String Anh = rs.getString("Anh");
			ds.add(new Phong(IdPhong, TenPhong, LoaiPhong,gia,trangThai,SoLan,RatingId,MoTa,IdKhuyenMai,Anh));
		}
		rs.close();
		kn.cn.close();
		}catch (Exception e) {e.printStackTrace();
			// TODO: handle exception
		}
		return ds;
	}
	public void SuaPhong(int IdPhong, String TenPhong, int IdLoaiPhong, Double Gia, Boolean TrangThai, int SoLanDuocDat, int RatingId, String MoTa, int IdKhuyenMai, String Anh, int SoPhongConLai)
	{
		
	}
	
	public ArrayList<Phong> TimPhong(int slNguoiLon,int slTreEm){
		ArrayList<Phong> ds = new ArrayList<Phong>();
		try {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			//Tạo cau lenh Sql
			String sql = "select * from Phong where TrangThai = 1 and maxNguoiLon>=? and maxTreEm>=?";
			//tao cau lenh
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, slNguoiLon);
			cmd.setInt(2, slTreEm);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				int IdPhong = rs.getInt("IdPhong");
				String TenPhong = rs.getString("TenPhong");
				int LoaiPhong = rs.getInt("IdLoaiPhong");
				Double gia = rs.getDouble("Gia");
				Boolean trangThai = rs.getBoolean("TrangThai");
				int SoLan = rs.getInt("SoLanDuocDat");
				int RatingId = rs.getInt("RatingId");
				String MoTa = rs.getString("MoTa");
				int IdKhuyenMai=rs.getInt("IdKhuyenMai");
				String Anh = rs.getString("Anh");
				int SoPhongConLai = rs.getInt("SoPhongConLai");
				int maxNL = rs.getInt("maxNguoiLon");
				int maxTreEm = rs.getInt("maxTreEm");
				ds.add(new Phong(IdPhong, TenPhong, LoaiPhong,gia,trangThai,SoLan,RatingId,MoTa,IdKhuyenMai,Anh,SoPhongConLai,maxNL,maxTreEm));
			}
			rs.close();
			kn.cn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return ds;
	}
	public ArrayList<Phong> top5Phong (){
		ArrayList<Phong> ds = new ArrayList<Phong>();
		try {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			
			String sql = "select top 5 * from Phong ORDER BY Phong.SoLanDuocDat DESC";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();

				while (rs.next()) {
					int IdPhong = rs.getInt("IdPhong");
					String TenPhong = rs.getString("TenPhong");
					int LoaiPhong = rs.getInt("IdLoaiPhong");
					Double gia = rs.getDouble("Gia");
					Boolean trangThai = rs.getBoolean("TrangThai");
					int SoLan = rs.getInt("SoLanDuocDat");
					int RatingId = rs.getInt("RatingId");
					String MoTa = rs.getString("MoTa");
					int IdKhuyenMai=rs.getInt("IdKhuyenMai");
					String Anh = rs.getString("Anh");
					int sophong = rs.getInt("SoPhongConLai");
					ds.add(new Phong(IdPhong, TenPhong, LoaiPhong,gia,trangThai,SoLan,RatingId,MoTa,IdKhuyenMai,Anh,sophong));
				}

			kn.cn.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();// e: handle exception
		}
		return ds;
	}
}
