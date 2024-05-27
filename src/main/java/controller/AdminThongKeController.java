package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Booking;
import bean.Phong;
import bo.BookingBo;
import bo.PhongBo;

/**
 * Servlet implementation class AdminThongKeController
 */
@WebServlet("/AdminThongKe")
public class AdminThongKeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminThongKeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
				
				PhongBo pbo = new PhongBo();
				BookingBo bbo = new BookingBo();
				ArrayList<Booking> dsDatPhong =  bbo.getBooking();
				ArrayList<Phong> dsTop = pbo.top5phong();
				HashMap<Integer, Float> DoanhThu = new HashMap<Integer, Float>();
				HashMap<Integer, Phong> Top = new HashMap<Integer, Phong>();
				int index = 1;
				for(Phong item : dsTop) {
					Top.put(index, item);
					index++;
				}
				for(int i = 1;i <=12 ; i++) {
					DoanhThu.put(i, bbo.DoanhThuThang(i));
				}
				
				HttpSession ss = request.getSession();
				ss.setAttribute("DoanhThuThang", DoanhThu);
				ss.setAttribute("dsTop", Top);
				RequestDispatcher rd = request.getRequestDispatcher("AdminThongKe.jsp");
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
