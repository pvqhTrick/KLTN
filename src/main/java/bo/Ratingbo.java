package bo;


import java.util.ArrayList;

import bean.Ratingbean;
import dao.Ratingdao;

public class Ratingbo {
	Ratingdao rdao = new Ratingdao();
	public void  setRating(int IdKH,int IdPhong,int SoDiem, String BinhLuan) {
		rdao.setRating(IdKH, IdPhong, SoDiem, BinhLuan);
	}
	public ArrayList<Ratingbean> getRating(int idphong) {
		return rdao.getRating(idphong);
	}
}
