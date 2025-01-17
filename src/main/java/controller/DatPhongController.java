package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.KhachHangbean;
import bo.PhongBo;

/**
 * Servlet implementation class DatPhongController
 */
@WebServlet("/DatPhong")
public class DatPhongController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DatPhongController() {
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
			HttpSession ss = request.getSession();
			KhachHangbean user = (KhachHangbean)ss.getAttribute("dn");
			String p = request.getParameter("IdPhong");
			if(user == null) {
				RequestDispatcher rd = request.getRequestDispatcher("Login");
				rd.forward(request, response);
			}
			else {
				pbo.DatPhong(Integer.parseInt(p), user.getIdKhachHang());
				RequestDispatcher rd = request.getRequestDispatcher("Rooms");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
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
