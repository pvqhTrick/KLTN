package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class uploadAnh
 */
@WebServlet("/uploadAnh")
public class uploadAnh extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "images";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uploadAnh() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Đảm bảo thư mục upload tồn tại
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Lấy file từ request
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        String filePath = uploadPath + File.separator + fileName;

        // Lưu file vào thư mục upload
        try (InputStream fileContent = filePart.getInputStream()) {
            Files.copy(fileContent, new File(filePath).toPath(), StandardCopyOption.REPLACE_EXISTING);
        }

        // Đáp trả lại người dùng
        response.getWriter().println("File " + fileName + " đã được upload thành công!");
    
	}

}
