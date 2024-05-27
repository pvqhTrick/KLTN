package bo;

import java.util.ArrayList;

import bean.KhachHangbean;
import dao.KhachHangdao;

public class KhachHangbo {
	KhachHangdao KHDao = new KhachHangdao();
	public KhachHangbean checkDangNhap(String tendn, String pass) throws Exception{
		return KHDao.checkDangNhap(tendn, pass);
	}
	public ArrayList<KhachHangbean> getKH(){
		return KHDao.getKH();
	}
	public void handleDangKy(String hoten, String sodt,Boolean GioiTinh,String CCCD, String email,  String diachi,String tendn, String pass) throws Exception{
		KHDao.handleDangKy(hoten,  sodt, GioiTinh, CCCD, email,  diachi,tendn, pass);
	}
	public void Sua(int Id,String hoten, String sodt,Boolean GioiTinh,String CCCD, String email,  String diachi,String tendn, String pass)
	{
		KHDao.Sua(Id, hoten, sodt,GioiTinh, CCCD,  email,  diachi, tendn, pass);
	}
	public void Xoa(int Id) {
		KHDao.Xoa(Id);
	}
	public ArrayList<KhachHangbean> TimKiem(String txtTimKiem){
		return KHDao.TimKiem(txtTimKiem);
	}
	public KhachHangbean xemChiTiet(int id) {
		return KHDao.xemChiTiet(id);
	}
	public int ThemGuest(String hoten, String SDT, String CCCD, String Email) {
		return KHDao.ThemGuest(hoten, SDT, CCCD, Email);
	}
}
