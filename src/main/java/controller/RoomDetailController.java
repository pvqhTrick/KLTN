package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Phong;
import bo.KhachHangbo;
import bo.LoaiPhongBo;
import bo.PhongBo;
import bo.Ratingbo;

/**
 * Servlet implementation class RoomDetailController
 */
@WebServlet("/RoomDetail")
public class RoomDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomDetailController() {
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
		HttpSession ss = request.getSession();
		
		String Id = request.getParameter("IdPhong");
		
		PhongBo pbo = new PhongBo();
		LoaiPhongBo lbo = new LoaiPhongBo();
		KhachHangbo khbo = new KhachHangbo();
		Ratingbo blbo = new Ratingbo();
		if(Id!=null) {
			ss.setAttribute("RoomBook", pbo.XemChiTiet(Integer.parseInt(Id)));
			ss.setAttribute("dsLoai", lbo.getLoai());
			ss.setAttribute("dsPhongLQ", pbo.getPhongLienQuan(pbo.XemChiTiet(Integer.parseInt(Id)).getIdLoaiPhong()));
			
			ss.setAttribute("dsBL", blbo.getRating(Integer.parseInt(Id)));
			ss.setAttribute("khbl",khbo.xemChiTiet(Integer.parseInt(Id)));
			RequestDispatcher rd = request.getRequestDispatcher("RoomDetail.jsp");
			
			rd.forward(request, response);
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("HomepageController");
			rd.forward(request, response);
		}
		
	} catch (Exception e) {
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
