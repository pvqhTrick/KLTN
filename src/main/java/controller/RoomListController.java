package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.LoaiPhong;
import bean.Phong;
import bo.LoaiPhongBo;
import bo.PhongBo;

/**
 * Servlet implementation class RoomListController
 */
@WebServlet("/Rooms")
public class RoomListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			PhongBo pbo = new PhongBo();
			LoaiPhongBo lbo = new LoaiPhongBo();
			HttpSession ss=request.getSession();
			String txtTimKiem = request.getParameter("txtTimKiem");
			String DateCheckIn = request.getParameter("DateCheckIn");
			String DateCheckOut = request.getParameter("DateCheckOut");
			String SoluongNguoiLon = request.getParameter("SoLuongNguoiLon");
			String SoluongTreEm = request.getParameter("SoLuongTreEm");
			ArrayList<Phong> ds= pbo.getPhong();
			ArrayList<Phong> dsTrong= new ArrayList<Phong>();
			ArrayList<LoaiPhong> dsLoai= lbo.getLoai();
			String selectedOrder = request.getParameter("selectOption");
//			if(DateCheckIn != null && DateCheckOut != null) {
//				for(Phong item : ds ) {
//					if (item.getTrangThai()) {
//						
//						ds.add(item);
//						ss.setAttribute("dsPhong", ds);
//					}
//					
//				}
//			}
			
			
			String[] selectedLoaiPhong = request.getParameterValues("LoaiPhong");
			if(selectedLoaiPhong !=null  && selectedLoaiPhong.length > 0) {
				 Arrays.toString(selectedLoaiPhong);
				 String.join(",", selectedLoaiPhong);
				 
			}else {
				if(txtTimKiem != null) {
//					ss.setAttribute("dsPhong", pbo.TimPhong(txtTimKiem));
					ss.setAttribute("dsPhong", pbo.Tim(txtTimKiem));
				}else {
					ss.setAttribute("dsPhong", ds);
				}
			}
			ss.setAttribute("dsloai", dsLoai);
			
			
				if(selectedOrder == "1") {
					for(Phong item :ds) {
						if(item.getTrangThai()) {
							dsTrong.add(item);
						}
					}
					ss.setAttribute("dsPhong",dsTrong);
				}
			RequestDispatcher rd = request.getRequestDispatcher("RoomList.jsp");
			rd.forward(request, response);
			}catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
