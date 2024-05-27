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

import bean.Booking;
import bo.BookingBo;

/**
 * Servlet implementation class ThanhToanController
 */
@WebServlet("/ThanhToan")
public class ThanhToanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThanhToanController() {
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
			String IdDatPhong = request.getParameter("IdDatPhong");
			HttpSession ss = request.getSession();
			BookingBo bbo = new BookingBo();
			bbo.ThanhToan(Integer.parseInt(IdDatPhong));
			ArrayList<Booking> dsDatPhong =  bbo.getBooking();
			ss.setAttribute("dsDatPhong", dsDatPhong);
			RequestDispatcher rd = request.getRequestDispatcher("AdminXacNhan.jsp");
			rd.forward(request, response);
		}catch (Exception e) {
			// TODO: handle exception
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
