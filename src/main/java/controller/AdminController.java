package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class AdminController
 */
@WebServlet("/ADMIN")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String un = request.getParameter("txtun");
			String pass = request.getParameter("txtpass");
			if (un != null && pass != null) {
				HttpSession s = request.getSession();
				if (true) {
					s.setAttribute("ADMIN", true);
					System.out.println("dang nhap t"+un +pass);	
					s.removeAttribute("error");
					RequestDispatcher rd = request.getRequestDispatcher("AdminQLP");
					rd.forward(request, response);
				} 
			}
			System.out.println("dang nhap s"+un +pass);	
			RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
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
