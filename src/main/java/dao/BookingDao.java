package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

import bean.Booking;

public class BookingDao {
	public ArrayList<Booking> getBooking(){
		ArrayList<Booking> dsLS = new ArrayList<Booking>();
		try {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			String sql = "select * from ChiTietDatPhong Order by NgayTao desc";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);

			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				int IdDatPhong = rs.getInt("IdDatPhong");
				int IdPhong = rs.getInt("IdPhong");
				int IdKhachHang = rs.getInt("IdKhachHang");
				Date Checkin = rs.getDate("ThoiGianDat");
				Date Checkout = rs.getDate("ThoiGIanTra");
				String note = rs.getString("GhiChu");
				boolean tt =  rs.getBoolean("TrangThaiThanhToan");
				float total = rs.getFloat("ThanhTien");
				boolean xn = rs.getBoolean("TrangThaiXacNhan");
				Date Ngaytao = rs.getDate("NgayTao");
				
				Booking moi = new Booking(IdDatPhong, IdPhong, IdKhachHang, Checkin,Checkout, note, tt, total,xn, Ngaytao );
					
				dsLS.add(moi);
			}
			kn.cn.close();
			rs.close();
			return dsLS;
		} catch (Exception e) {
			e.printStackTrace();// e: handle exception
		}
		return null;
	}
	
	
	public ArrayList<Booking> getLichSu(int idKH){
		ArrayList<Booking> dsLS = new ArrayList<Booking>();
		try {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			
			String sql = "select * from ChiTietDatPhong Where IdKhachHang = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1,idKH);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				Booking moi = new Booking(
						rs.getInt("IdDatPhong"),
						rs.getInt("IdPhong"),
						rs.getInt("IdKhachHang"),
						rs.getDate("ThoiGianDat"), 
						rs.getDate("ThoiGIanTra"),
						rs.getString("GhiChu"),
						rs.getBoolean("TrangThaiThanhToan"), 
						rs.getFloat("ThanhTien"));
				dsLS.add(moi);
			}
			kn.cn.close();
			rs.close();
			return dsLS;
		} catch (Exception e) {
			e.printStackTrace();// e: handle exception
		}
		return null;
	}
	
	public void setBooking(int IdPhong, int IdKhachHang, Date Datein, Date Dateout, String Note,float TongTien) {
		try {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			String sql = "Insert into ChiTietDatPhong(IdPhong,IdKhachHang,ThoiGianDat,ThoiGIanTra,ThanhTien,GhiChu) Values(?,?,?,?,?,?)";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String StringDateIn = sdf.format(Datein);
			String StringDateOut = sdf.format(Dateout);
			LocalDate today= LocalDate.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        String formattedDate = today.format(formatter);
			cmd.setInt(1,IdPhong);
			cmd.setInt(2, IdKhachHang);
			cmd.setString(3, StringDateIn);
			cmd.setString(4, StringDateOut);
//			cmd.setDate(4, (java.sql.Date) Dateout);
			cmd.setFloat(5,TongTien);
			cmd.setString(6,Note);

			cmd.execute();
			kn.cn.close();
			
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception	
		}
	}
	public void ThanhToan(int idBooking) {
		try {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			String sql = "Update ChiTietDatPhong Set TrangThaiThanhToan=1 Where IdDatPhong= ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1,idBooking);
			cmd.executeUpdate();
			kn.cn.close();

		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
	}
	public float DoanhThuThang(int m){
		float doanhthu = 0;
		try {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			String sql = "select * from ChiTietDatPhong where MONTH(NgayTao) = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, m);

			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				if(rs.getBoolean("TrangThaiThanhToan")) {
					doanhthu += rs.getFloat("ThanhTien");
				}
			}
			kn.cn.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();// e: handle exception
		}
		return doanhthu;
	}
	public void XacNhan(int IdDatPhong) {
		try {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			String sql = "update ChiTietDatPhong Set TrangThaiXacNhan = 1 where IdDatPhong = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, IdDatPhong);
			cmd.executeUpdate();
			
			kn.cn.close();

		} catch (Exception e) {
			e.printStackTrace();// e: handle exception
		}
	}
	public void HuyXacNhan(int IdDatPhong) {
		try {
			KetNoi kn = new KetNoi();
			kn.ketnoi();
			String sql = "update ChiTietDatPhong Set TrangThaiXacNhan = 0 where IdDatPhong = ?";
			PreparedStatement cmd = kn.cn.prepareStatement(sql);
			cmd.setInt(1, IdDatPhong);
			cmd.executeUpdate();
			
			kn.cn.close();

		} catch (Exception e) {
			e.printStackTrace();// e: handle exception
		}
	}
	
}
