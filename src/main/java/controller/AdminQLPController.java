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
import javax.websocket.Session;

import bean.Booking;
import bean.KhachHangbean;
import bean.LoaiPhong;
import bean.Phong;
import bo.BookingBo;
import bo.KhachHangbo;
import bo.LoaiPhongBo;
import bo.PhongBo;

/**
 * Servlet implementation class AdminQLKHController
 */
@WebServlet("/AdminQLP")
public class AdminQLPController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQLPController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest r	equest, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			PhongBo KHBo = new PhongBo();
			KhachHangbo pbo = new KhachHangbo();
			BookingBo bbo = new BookingBo();
			LoaiPhongBo lbo = new LoaiPhongBo();
			HttpSession ss = request.getSession();

			String txtTimKiem = request.getParameter("txtTimKiem");
			String id = request.getParameter("Id");
			String TrangThai = request.getParameter("TrangThai");
			ArrayList<LoaiPhong> dsloai = lbo.getLoai();
			ArrayList<Phong> dsP = KHBo.getPhong();
			ArrayList<Booking> dsDatPhong =  bbo.getBooking();
			ArrayList<Phong> dsPtrue = new ArrayList<Phong>();
			ArrayList<Phong> dsPfalse = new ArrayList<Phong>();
			ArrayList<KhachHangbean> dsKH = pbo.getKH();
			for(Phong item : dsP) {
				if(item.getTrangThai()) {
					dsPtrue.add(item);
				}
				dsPfalse.add(item);
			}
			double doanhthu=0;
			for(Booking item : dsDatPhong) {
				if(item.TinhTrangThanhToan) {
					doanhthu+=item.getTongThanhToan();
				}
			}
			ss.setAttribute("DoanhThu", doanhthu);
			ss.setAttribute("dsKH", dsKH);
			ss.setAttribute("dsPhong", dsP);
			ss.setAttribute("dsDatPhong", dsDatPhong);
			ss.setAttribute("dsPhongTrong",dsPtrue);
			ss.setAttribute("dsPhongDangSuDung", dsPfalse);
			ss.setAttribute("dsloai", dsloai);
			RequestDispatcher rd = request.getRequestDispatcher("AdminQLPhong.jsp");
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
