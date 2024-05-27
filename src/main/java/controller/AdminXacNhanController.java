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

import bean.KhachHangbean;
import bean.Phong;
import bo.KhachHangbo;
import bo.PhongBo;

/**
 * Servlet implementation class AdminXacNhanController
 */
@WebServlet("/AdminXacNhan")
public class AdminXacNhanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminXacNhanController() {
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
			KhachHangbo KHBo = new KhachHangbo();
			PhongBo pbo = new PhongBo();
			
			
			HttpSession ss = request.getSession();
			String txtTimKiem = request.getParameter("txtTimKiem");
			ArrayList<KhachHangbean> dsKH = KHBo.getKH();
			
			ArrayList<Phong> dsP = pbo.getPhong();
			ss.setAttribute("dsPhong", dsP);
			
			ss.setAttribute("dsKH", dsKH);
			RequestDispatcher rd = request.getRequestDispatcher("AdminXacNhan.jsp");
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