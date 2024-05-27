package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import bean.KhachHangbean;
import bean.KhuyenMaibean;
import bean.Phong;
import bo.BookingBo;
import bo.KhachHangbo;
import bo.KhuyenMaiBo;
import bo.LoaiPhongBo;
import bo.PhongBo;

/**
 * Servlet implementation class BookingController
 */
@WebServlet("/Booking")
public class BookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookingController() {
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

			BookingBo bbo = new BookingBo();
			KhachHangbo kbo = new KhachHangbo();
			HttpSession ss = request.getSession();
			String IdPhong = request.getParameter("Id");

			String hoTen = request.getParameter("HoTen");
			String email = request.getParameter("Email");
			String sdt = request.getParameter("sdt");
			String cccd = request.getParameter("cccd");
			String CheckIn = request.getParameter("DateCheckIn");
			String CheckOut = request.getParameter("DateCheckOut");
			String note = request.getParameter("Note");
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date dateCheckIn = dateFormat.parse(CheckIn);
	        Date dateCheckOut = dateFormat.parse(CheckOut);
	        
	      //thong tin phong va loai phong
			PhongBo P = new PhongBo();
			LoaiPhongBo lbo = new LoaiPhongBo();
			KhuyenMaiBo KMbo = new KhuyenMaiBo();
			Phong Phong = P.XemChiTiet(Integer.parseInt(IdPhong));
			if(Phong.getTrangThai()==true) {
			ss.setAttribute("Phong", Phong);
			ss.setAttribute("LoaiPhong", lbo.getDetail(Phong.getIdLoaiPhong()));
			float total = Phong.getGia().floatValue();
			
			 //Chuyển qua kiểu Date
	        if(CheckIn != null && CheckOut!= null) {
				try {
			        ss.setAttribute("datein", dateCheckIn);
					ss.setAttribute("dateout", dateCheckOut);
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			        LocalDate LocaldateCheckIn = LocalDate.parse(CheckIn, formatter);
			        LocalDate LocaldateCheckOut = LocalDate.parse(CheckOut, formatter);

					long daysBetween = ChronoUnit.DAYS.between(LocaldateCheckIn, LocaldateCheckOut);
					if(daysBetween!=0) {
					total*= daysBetween;
					ss.setAttribute("SoNgay",daysBetween);
					}else {
						ss.setAttribute("SoNgay",daysBetween);
					}
				}catch (Exception e) {
					e.printStackTrace();// TODO: handle exception
				}
	        }  
	        KhuyenMaibean KM = KMbo.getDetailKhuyenMai(P.XemChiTiet(Integer.parseInt(IdPhong)).getIdKhuyenMai());
			if (KM!=null) {
				ss.setAttribute("KM", KM.getChietKhau());
				total = (float) (total* KM.getChietKhau());
			}
			ss.setAttribute("total", total);
	        	//thong tin khach hang
			KhachHangbean KH = (KhachHangbean) ss.getAttribute("dn");
			if (KH != null) {
				ss.setAttribute("KhachHang", KH);
				bbo.setBooking(Integer.parseInt(IdPhong),KH.getIdKhachHang(),dateCheckIn, dateCheckOut, note, total);

			} else {
				int id = kbo.ThemGuest(hoTen, sdt, cccd, email);
				ss.setAttribute("dn", new KhachHangbean(id,hoTen,sdt,cccd,email));
				bbo.setBooking(Integer.parseInt(IdPhong), id, dateCheckIn, dateCheckOut, note, total);
			}
				
			RequestDispatcher rd = request.getRequestDispatcher("Booking.jsp");
			rd.forward(request, response);
			}
			else {
			RequestDispatcher rd = request.getRequestDispatcher("Homepage");
			rd.forward(request, response);
			}
			
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
