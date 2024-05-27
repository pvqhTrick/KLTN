package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import bean.LoaiPhong;

public class LoaiPhongDao {
	public ArrayList<LoaiPhong> getLoaiPhong() throws Exception{
		ArrayList<LoaiPhong> dsloai=new ArrayList<LoaiPhong>();
		try {
			ArrayList<Integer> dsID= this.getIdLoai();
			for(Integer i : dsID) {
				dsloai.add(getDetail(i));
			}
		}catch (Exception e) {
			e.printStackTrace();// e: handle exception
		}
		return dsloai;
		
	}
	public ArrayList<Integer> getIdLoai()throws Exception{
		ArrayList<Integer> dsIDloai=new ArrayList<Integer>();
		try {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			String sql = "SELECT LoaiPhong.IdLoaiPhong FROM LoaiPhong INNER JOIN ChiTietTienNghi ON LoaiPhong.IdLoaiPhong = ChiTietTienNghi.IdLoaiPhong INNER JOIN TienNghi ON ChiTietTienNghi.IdTienNghi = TienNghi.IdTienNghi GROUP BY LoaiPhong.IdLoaiPhong;";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while(rs.next()) {
			    int id = rs.getInt("IdLoaiPhong");
			    dsIDloai.add(id);
			}
			rs.close();
			kn.cn.close();

		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return dsIDloai;
	}
	public LoaiPhong getDetail(int IdPhong)throws Exception{
		try {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			String sql = "SELECT * FROM LoaiPhong INNER JOIN ChiTietTienNghi ON LoaiPhong.IdLoaiPhong = ChiTietTienNghi.IdLoaiPhong INNER JOIN TienNghi ON ChiTietTienNghi.IdTienNghi = TienNghi.IdTienNghi WHERE LoaiPhong.IdLoaiPhong= ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, IdPhong);
			ResultSet rs = cmd.executeQuery();

			ArrayList<String> tienNghiList = new ArrayList<>();
			
		    String ten = null;
		    int soGiuongDoi = 0;
		    int soGiuongDon = 0;
			
			while(rs.next()) {
				ten = rs.getString("LoaiPhong");
				soGiuongDoi = rs.getInt("SoGiuongDoi");
			    soGiuongDon = rs.getInt("SoGiuongDon");
			    String tenTienNghi = rs.getString("TenTienNghi");
			    tienNghiList.add(tenTienNghi);
			}

			rs.close();
			kn.cn.close();
			LoaiPhong LP=new LoaiPhong(IdPhong, ten,soGiuongDoi,soGiuongDon,tienNghiList);
			return LP;
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return null;
	}
}
