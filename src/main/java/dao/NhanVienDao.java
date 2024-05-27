package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.KhachHangbean;
import bean.NhanVien;

public class NhanVienDao {
	public ArrayList<NhanVien> getNhanVien() throws Exception{
		try {
			ArrayList<NhanVien> dsNV = new ArrayList<NhanVien>()	;
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			String Sql= "Select * From NhanVien";
			PreparedStatement cmd = kn.cn.prepareStatement(Sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String hoten = rs.getString("HoTen");
				String Chucvu = rs.getString("ChucVu");
				Double luong = rs.getDouble("Luong");
				String MoTa = rs.getString("MoTa");
				String ten= rs.getString("TenDN");
				String pass=rs.getString("Password");
				int id = rs.getInt("IdNhanVien");
				dsNV.add(new NhanVien(id, hoten, Chucvu	, luong, MoTa, pass, ten));
			}
			return dsNV;
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return null;
	}
}
