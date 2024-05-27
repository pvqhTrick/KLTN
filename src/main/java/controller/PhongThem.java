package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Phong;
import bo.KhachHangbo;

/**
 * Servlet implementation class PhongThem
 */
@WebServlet("/PhongThem")
public class PhongThem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PhongThem() {
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
			Phong PBo = new Phong();
			String ten = request.getParameter("txtHoTen");
			String IdLoaiPhong = request.getParameter("txtSDT");
			String TrangThai = request.getParameter("cbbGioiTinh");
			String SoLan = request.getParameter("txtCCCD");
			String IdDanhGia = request.getParameter("txtEmail");
			String MoTa = request.getParameter("txtDiaChi");
			String Khuyenmai= request.getParameter("txtTenDN");
			String Anh = request.getParameter("txtPassword");
			
//			if(ten !=null && IdLoaiPhong!=null &&TrangThai != null && SoLan != null &&IdDanhGia!=null&&MoTa!=null&&Khuyenmai!=null ) {
//				Boolean GT;
//				if ("true".equals(GioiTinh)) {
//			            GT=true;
//			        } else if ("false".equals(GioiTinh)) {
//			            // Xử lý khi giới tính là Nữ
//			        	GT=false;
//			        } else {
//			            // Xử lý khi giá trị không hợp lệ
//			        	GT=null;
//			        }
//				KHBo.handleDangKy(hoten, Sdt, GT, cccd, Email,  DiaChi, TenDN, Pass);
//			}
			
			RequestDispatcher rd = request.getRequestDispatcher("AdminQLPController");
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
