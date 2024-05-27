package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.KhachHangbo;
import bo.PhongBo;

/**
 * Servlet implementation class SuaPhong
 */
@WebServlet("/SuaPhong")
public class SuaPhong extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuaPhong() {
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
			String IdPhong =  request.getParameter("IdSua");
			String TenPhong = request.getParameter("txtTenPhong");
			String IdLoaiPhong =  request.getParameter("txtTenPhong");
			String Gia = request.getParameter("txtLoaiPhong");
			String TrangThai = request.getParameter("txtTenPhong");
			String SoLanDuocDat  = request.getParameter("txtTenPhong");
			String RatingId = request.getParameter("txtTenPhong");
			String MoTa = request.getParameter("txtTenPhong");
			String IdKhuyenMai = request.getParameter("txtTenPhong");
			String Anh = request.getParameter("txtTenPhong");
			String SoPhongConLai = request.getParameter("txtTenPhong");
			
			KhachHangbo KHBo = new KhachHangbo();
			PhongBo pbo= new PhongBo();


			if(IdPhong != null && TenPhong != null && IdLoaiPhong != null &&Gia != null && TrangThai!=null && SoLanDuocDat != null) {
					
					//pbo.SuaPhong(IdPhong,TenPhong,IdLoaiPhong, Gia,TrangThai, SoLanDuocDat, RatingId,  MoTa, IdKhuyenMai, Anh, SoPhongConLai);
					RequestDispatcher rd = request.getRequestDispatcher("RoomProfile");
					rd.forward(request, response);
			}
			RequestDispatcher rd = request.getRequestDispatcher("RoomProfile.jsp");
			rd.forward(request, response);
			//neu thanh con thi quay ve Admin QLKH
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
