package bo;

import java.util.ArrayList;

import bean.KhuyenMaibean;
import dao.KhuyenMaidao;

public class KhuyenMaiBo {
	KhuyenMaidao KMdao = new KhuyenMaidao();
	public ArrayList<KhuyenMaibean> getKhuyenMai(){
		return KMdao.getKhuyenMai();
	}
	public KhuyenMaibean getDetailKhuyenMai(int id) {
		return KMdao.getDetailKhuyenMai(id);
	}
}
