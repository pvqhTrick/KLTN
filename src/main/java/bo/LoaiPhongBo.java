package bo;

import java.util.ArrayList;

import bean.LoaiPhong;
import dao.LoaiPhongDao;

public class LoaiPhongBo {
	LoaiPhongDao ldao=new LoaiPhongDao();
	public ArrayList<LoaiPhong> getLoai() throws Exception{
		ArrayList<LoaiPhong> dsloai=new ArrayList<LoaiPhong>();
		ArrayList<Integer> dsID= ldao.getIdLoai();
		for(Integer i : dsID) {
			dsloai.add(ldao.getDetail(i));
		}
		return dsloai;
	}
	public ArrayList<Integer> getIdLoai() throws Exception{
		return ldao.getIdLoai();
	}
	public LoaiPhong getDetail(int IdLoai) throws Exception{
		return ldao.getDetail(IdLoai);
	}
	
}
