package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.KhachHangbo;

/**
 * Servlet implementation class KhachHangThem
 */
@WebServlet("/KhachHangThem")
public class KhachHangThem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KhachHangThem() {
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
		String hoten = request.getParameter("txtHoTen");
		String Sdt = request.getParameter("txtSDT");
		String GioiTinh = request.getParameter("cbbGioiTinh");
		String cccd = request.getParameter("txtCCCD");
		String Email = request.getParameter("txtEmail");
		String DiaChi = request.getParameter("txtDiaChi");
		String TenDN= request.getParameter("txtTenDN");
		String Pass = request.getParameter("txtPassword");
		
		if(hoten !=null && Sdt!=null &&GioiTinh != null && Email != null&&DiaChi!=null&&TenDN!=null&&Pass!=null ) {
			Boolean GT;
			if ("true".equals(GioiTinh)) {
		            GT=true;
		        } else if ("false".equals(GioiTinh)) {
		            // Xử lý khi giới tính là Nữ
		        	GT=false;
		        } else {
		            // Xử lý khi giá trị không hợp lệ
		        	GT=null;
		        }
			KHBo.handleDangKy(hoten, Sdt, GT, cccd, Email,  DiaChi, TenDN, Pass);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("AdminQLKHController");
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
