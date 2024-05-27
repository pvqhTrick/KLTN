package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.Ratingbo;

/**
 * Servlet implementation class AddBinhLuan
 */
@WebServlet("/AddBinhLuan")
public class AddBinhLuan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBinhLuan() {
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

			String IdKH = request.getParameter("Id");
			String Star = request.getParameter("Star");
			String BL = request.getParameter("BinhLuan");
			String IdPhong = request.getParameter("IdPhong");
			
			Ratingbo rbo = new Ratingbo();
			rbo.setRating(Integer.parseInt(IdKH),Integer.parseInt(IdPhong), Integer.parseInt(Star),BL);
			
	        response.sendRedirect("RoomDetail?IdPhong="+IdPhong); // Chuyển hướng đến trang kết quả

		} catch (Exception e) {
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
