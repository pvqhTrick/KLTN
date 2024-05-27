package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.KhuyenMaiBo;
import bo.LoaiPhongBo;
import bo.PhongBo;

/**
 * Servlet implementation class HomepageController
 */
@WebServlet("/Homepage")
public class HomepageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomepageController() {
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
		KhuyenMaiBo kmbo = new KhuyenMaiBo(); 
		LoaiPhongBo lbo = new LoaiPhongBo();
		HttpSession ss=request.getSession();

		ss.setAttribute("dsPhong", pbo.getPhong());
		ss.setAttribute("dsLoai", lbo.getLoai());
		ss.setAttribute("dsKhuyenMai", kmbo.getKhuyenMai());
		ss.setAttribute("dsTienNghi", ss);
		
		RequestDispatcher rd = request.getRequestDispatcher("Homepage.jsp");
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
