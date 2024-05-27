package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.Ratingbean;

public class Ratingdao {
	public void setRating(int IdKH,int IdPhong,int SoDiem, String BinhLuan) {
		try {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			//Tạo cau lenh Sql

			String sql = "Insert into ChiTietDanhGia(IdKhachHang,IdPhong,SoSao,BinhLuan) values =(?,?,?,?)";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, IdKH);
			cmd.setInt(2, IdPhong);
			cmd.setInt(3, SoDiem);
			cmd.setString(4, BinhLuan);
			cmd.executeUpdate();
			kn.cn.close();
			cmd.close();
		} catch (Exception e) {
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
}
