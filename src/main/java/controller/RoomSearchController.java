package controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class RoomSearchController
 */
@WebServlet("/RoomSearch")
public class RoomSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomSearchController() {
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
			ArrayList<LoaiPhong> dsLoai= lbo.getLoai();

			HttpSession ss=request.getSession();
			String DateCheckIn = request.getParameter("DateCheckIn");
			String DateCheckOut = request.getParameter("DateCheckOut");
			String SoluongNguoiLon = request.getParameter("SoLuongNguoiLon");
			String SoluongTreEm = request.getParameter("SoLuongTreEm");
			
			ArrayList<Phong> dsp= pbo.TimPhong(Integer.parseInt(SoluongNguoiLon),Integer.parseInt(SoluongTreEm));
			ss.setAttribute("dsPhong", dsp);
			ss.setAttribute("dsloai", dsLoai);
			RequestDispatcher rd = request.getRequestDispatcher("RoomList.jsp");
			rd.forward(request, response);
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
