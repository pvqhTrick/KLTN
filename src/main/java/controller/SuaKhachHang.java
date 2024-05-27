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

/**
 * Servlet implementation class SuaKhachHang
 */
@WebServlet("/SuaKhachHang")
public class SuaKhachHang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuaKhachHang() {
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
		String id =  request.getParameter("IdSua");
		String hoten = request.getParameter("txtHoTen");
		String sdt = request.getParameter("txtSDT");
		String GioiTinh = request.getParameter("cbbGioiTinh");
		String CCCD = request.getParameter("txtCCCD");
		String Email = request.getParameter("txtEmail");
		String DiaChi = request.getParameter("txtDiaChi");
		String tendn = request.getParameter("txtTenDangNhap");
		String password = request.getParameter("txtPasword");
		String password_comfirm = request.getParameter("txtPasswordcomfirm");
		KhachHangbo KHBo = new KhachHangbo();

		if(password != password_comfirm && password != null) {
			RequestDispatcher rd = request.getRequestDispatcher("SuaKhachHang?IdSua="+id);
			rd.forward(request, response);
		}
		else
			if(hoten != null && sdt != null && CCCD != null &&Email != null && DiaChi!=null && tendn != null) {
				
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
				KHBo.Sua(Integer.parseInt(id), hoten, sdt, GT, CCCD, Email, DiaChi, tendn, password);
				ss.setAttribute("dn", KHBo.checkDangNhap(tendn, password));
				
				RequestDispatcher rd = request.getRequestDispatcher("UserProfileController?Id="+id);
				rd.forward(request, response);
			}
		RequestDispatcher rd = request.getRequestDispatcher("SuaKH.jsp");
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
