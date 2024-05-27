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
 * Servlet implementation class WishListController
 */
@WebServlet("/WishList")
public class WishListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WishListController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			PhongBo pbo = new PhongBo();
			LoaiPhongBo lbo = new LoaiPhongBo();
			HttpSession ss = request.getSession();

			ArrayList<Phong> ds = pbo.getPhong();
			ArrayList<LoaiPhong> dsLoai = lbo.getLoai();
			ArrayList<String> wishlist = (ArrayList<String>) ss.getAttribute("wishlist");

			ArrayList<Phong> dsWithWishlist = new ArrayList<>();
			for (Phong item : ds) {
				String idPhongStr = String.valueOf(item.getIdLoaiPhong());
				if (wishlist != null && wishlist.contains(idPhongStr)) {
					dsWithWishlist.add(item);
				}
			}
			ss.setAttribute("dsPhong", dsWithWishlist);

			ss.setAttribute("dsloai", dsLoai);
			RequestDispatcher rd = request.getRequestDispatcher("RoomList.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
