package dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import bean.KhachHangbean;
public class KhachHangdao {
	public KhachHangbean checkDangNhap(String tendn,String pass)throws Exception{
		try {
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		//Tạo cau lenh Sql

		String sql = "select * from KhachHang where Tendn=? and Password=?";
		//tao cau lenh
		PreparedStatement cmd = kn.cn.prepareStatement(sql);
		cmd.setString(1,tendn);
		cmd.setString(2, pass);
		//Truyen tham so vao cau lenh neu co
		//Thuc hien cau lenh
		ResultSet rs = cmd.executeQuery();
		if(rs.next()) {
			KhachHangbean moi = new KhachHangbean(
					rs.getInt("IdKhachHang"),
					rs.getString("HoTen"), 
					rs.getString("SDT"),
					rs.getBoolean("GioiTinh"),
					rs.getString("CCCD"),
					rs.getString("Email"),
					rs.getString("DiaChi"),
					rs.getString("Tendn"),
					rs.getString("Password")
					);
			kn.cn.close();
			rs.close();
			return moi;		
		}
		kn.cn.close();
		rs.close();
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		
		return null;
		
	}
	public ArrayList<KhachHangbean> getKH(){
		try {
			ArrayList<KhachHangbean> dsKH = new ArrayList<KhachHangbean>()	;
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			String Sql= "Select * From KhachHang";
			PreparedStatement cmd = kn.cn.prepareStatement(Sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String hoten = rs.getString("HoTen");
				String sdt = rs.getString("SDT");
				Boolean gt = rs.getBoolean("GioiTinh");
				String cccd = rs.getString("CCCD");
				String email = rs.getString("Email");
				String diachi = rs.getString("DiaChi");
				String ten= rs.getString("TenDN");
				String pass=rs.getString("Password");
				int id = rs.getInt("IdKhachHang");
				dsKH.add(new KhachHangbean(id,hoten,sdt,gt,cccd,email,diachi,ten,pass));
			}
			return dsKH;
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return null;
	}
	public void handleDangKy(String hoten, String sodt,Boolean GioiTinh,String CCCD, String email,  String diachi,String tendn, String pass) throws Exception{
		if(hoten == "" || sodt == "" || GioiTinh == null ||CCCD == "" || email == "" || diachi =="" || tendn == ""|| pass == "") {
			return;
		}else {
			
		try {
		KetNoi kn = new KetNoi();
		kn.ketnoi();
		String Sql= "insert into KhachHang(HoTen, SDT, GioiTinh, CCCD,Email,DiaChi, tendn, password) values(?,?,?,?,?,?,?,?)";
		PreparedStatement cmd = kn.cn.prepareStatement(Sql);
		cmd.setString(1,hoten);
		cmd.setString(2,sodt);
		cmd.setBoolean(3,GioiTinh);
		cmd.setString(4,CCCD);
		cmd.setString(5,email);
		cmd.setString(6,diachi);
		cmd.setString(7,tendn);
		cmd.setString(8,pass);
		
		cmd.executeUpdate();
		kn.cn.close();
		cmd.close();
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		}
	}
	public void Sua(int Id,String hoten, String sodt,Boolean GioiTinh,String CCCD, String email,  String diachi,String tendn, String pass) {
		try {	
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			String sql = "update KhachHang set HoTen = ?, SDT = ?, GioiTinh = ?, CCCD = ?, Email = ?, DiaChi=? ,Tendn=?,password=? where IdKhachHang = ? ";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setString(1,hoten);
			cmd.setString(2,sodt);
			cmd.setBoolean(3,GioiTinh);
			cmd.setString(4,CCCD);
			cmd.setString(5,email);
			cmd.setString(6,diachi);
			cmd.setString(7,tendn);
			cmd.setString(8,pass);
			cmd.setInt(9,Id);
			
			cmd.executeUpdate();
			kn.cn.close();
			cmd.close();
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
	}
	public void Xoa(int Id) {
		try {	
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			String sql = "Delete From KhachHang Where IdKhachHang = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			
			cmd.setInt(1,Id);
			cmd.execute();
			kn.cn.close();
			cmd.close();
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
	}
	public ArrayList<KhachHangbean> TimKiem(String txtTimKiem){
		try {
			ArrayList<KhachHangbean> ds =new ArrayList<KhachHangbean>();
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			String sql = "Select * From KhachHang Where HoTen like '%?%'";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			
			cmd.setString(1,txtTimKiem);
			ResultSet rs= cmd.executeQuery();
			while (rs.next()) {
				String hoten = rs.getString("HoTen");
				String sdt = rs.getString("SDT");
				Boolean gt = rs.getBoolean("GioiTinh");
				String cccd = rs.getString("CCCD");
				String email = rs.getString("Email");
				String diachi = rs.getString("DiaChi");
				String ten= rs.getString("TenDN");
				String pass=rs.getString("Password");
				int id = rs.getInt("IdKhachHang");
				ds.add(new KhachHangbean(id,hoten,sdt,gt,cccd,email,diachi,ten,pass));
			}
			kn.cn.close();
			cmd.close();
			return ds;
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return null;
	}
	public KhachHangbean xemChiTiet(int id) {
		try {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			String sql = "Select * From KhachHang Where IdKhachHang=?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			
			cmd.setInt(1,id);
			ResultSet rs= cmd.executeQuery();
			while(rs.next()) {
				String hoten = rs.getString("HoTen");
				String sdt = rs.getString("SDT");
				Boolean gt = rs.getBoolean("GioiTinh");
				String cccd = rs.getString("CCCD");
				String email = rs.getString("Email");
				String diachi = rs.getString("DiaChi");
				String ten= rs.getString("TenDN");
				String pass=rs.getString("Password");
				int idkh = rs.getInt("IdKhachHang");
				return new KhachHangbean(idkh,hoten,sdt,gt,cccd,email,diachi,ten,pass);
			}
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return null;
	}
	public int ThemGuest(String hoten, String SDT, String CCCD, String Email) {

		try {
			if(hoten!= null && SDT!= null&& CCCD != null&& Email !=null) {
				KetNoi kn = new KetNoi();
				kn.ketnoi();
				int idKhachHang =-1;
				String Sql= "insert into KhachHang(HoTen, SDT, CCCD,Email) values(?,?,?,?);	SELECT SCOPE_IDENTITY()";
				PreparedStatement cmd = kn.cn.prepareStatement(Sql);
				cmd.setString(1,hoten);
				cmd.setString(2,SDT);
				cmd.setString(3,CCCD);
				cmd.setString(4,Email);
				ResultSet rs = cmd.executeQuery();
				rs = cmd.executeQuery();

		        if (rs.next()) {
		            idKhachHang = rs.getInt(1);
		        }
		        System.out.println(idKhachHang);
				kn.cn.close();
				cmd.close();
				return idKhachHang;
			}
	
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
		return 1;
	}
}
