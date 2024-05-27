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


import bean.KhuyenMaibean;

import bo.KhuyenMaiBo;

/**
 * Servlet implementation class AdminQLKMController
 */
@WebServlet("/AdminQLKM")
public class AdminQLKMController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQLKMController() {
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
		KhuyenMaiBo kmbo =new KhuyenMaiBo();
		HttpSession ss = request.getSession();
//		String txtTimKiem = request.getParameter("txtTimKiem");
	
		
		ArrayList<KhuyenMaibean> dsKM = kmbo.getKhuyenMai();
		ss.setAttribute("dsKM", dsKM);
		RequestDispatcher rd = request.getRequestDispatcher("AdminQLKhuyenMai.jsp");
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
