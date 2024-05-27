package bo;

import java.util.ArrayList;

import bean.NhanVien; 	
import dao.NhanVienDao;

public class NhanVienBo {
	public NhanVienDao nvdao = new NhanVienDao();
	public ArrayList<NhanVien> getNhanVien() throws Exception{
		return nvdao.getNhanVien();
	}
}
