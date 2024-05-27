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
import bo.KhuyenMaiBo;
import bo.LoaiPhongBo;
import bo.PhongBo;

/**
 * Servlet implementation class ThemWishlistController
 */
@WebServlet("/ThemWishlist")
public class ThemWishlistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemWishlistController() {
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

			HttpSession ss=request.getSession();
			String IdPhong = request.getParameter("IdPhong");
			KhachHangbean user = (KhachHangbean) ss.getAttribute("dn");
			if(user != null) {
			ArrayList<String> wishlist= (ArrayList<String>)ss.getAttribute("wishlist");
				if(wishlist== null) {
					wishlist = new ArrayList<String>();
				}
				if(wishlist.contains(IdPhong)) {
					wishlist.remove(IdPhong);
				}
				else {
					wishlist.add(IdPhong);
				}
				
			    request.getSession().setAttribute("wishlist", wishlist);
				RequestDispatcher rd = request.getRequestDispatcher("Rooms");
				rd.forward(request, response);
				}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("LoginController");
				rd.forward(request, response);
			}
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
