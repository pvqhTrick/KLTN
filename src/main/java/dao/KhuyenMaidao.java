package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.KhuyenMaibean;

public class KhuyenMaidao {
	public ArrayList<KhuyenMaibean> getKhuyenMai() {
		try {
			ArrayList<KhuyenMaibean> dsKM = new  ArrayList<KhuyenMaibean> ();
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			String Sql= "Select * From KhuyenMai";
			PreparedStatement cmd = kn.cn.prepareStatement(Sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String ten = rs.getString("TenKhuyenMai");
				Double ChietKhau = rs.getDouble("ChietKHau");
				String Mota = rs.getString("MoTaKhuyenMai");
				Date NgayBatDau = rs.getDate("NgayBatDau");
				Date NgayKetThuc = rs.getDate("NgayKetThuc");
				int id = rs.getInt("IdKhuyenMai");
				String Banner = rs.getString("Banner");
				dsKM.add(new KhuyenMaibean(id,ten,ChietKhau,NgayBatDau,NgayKetThuc,Mota,Banner));
			}
			return dsKM;
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return null;
	}
	public KhuyenMaibean getDetailKhuyenMai(int id) {
		try {
			
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			String Sql= "Select * From KhuyenMai Where IdKhuyenMai = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(Sql);
			cmd.setInt(1, id);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String ten = rs.getString("TenKhuyenMai");
				Double ChietKhau = rs.getDouble("ChietKHau");
				String Mota = rs.getString("MoTaKhuyenMai");
				Date NgayBatDau = rs.getDate("NgayBatDau");
				Date NgayKetThuc = rs.getDate("NgayKetThuc");
				String Banner = rs.getString("Banner");
				return new KhuyenMaibean(id,ten,ChietKhau,NgayBatDau,NgayKetThuc,Mota,Banner);
			}
			
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		
		}
		return null;
	}
}
