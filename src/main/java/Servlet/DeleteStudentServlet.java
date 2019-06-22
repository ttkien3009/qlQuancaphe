package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Code.DeleteStudentDAO;
import Code.Student;

public class DeleteStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteStudentServlet() {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String masv = request.getParameter("MaSV");
		Student std = new Student();
		std.setMaSV(masv);
		DeleteStudentDAO delDao = new DeleteStudentDAO();
		String userDel = null;
		try {
			userDel = delDao.authenticateDel(std);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (userDel.equals("SUCCESS")) // On success, you can display a message to user on Home page
		{
			request.setAttribute("errMessage", "Xoa thanh cong");
			request.getRequestDispatcher("/Admin.jsp?tmp=ListStudent").forward(request, response);
		} else // On Failure, display a meaningful message to the User.
		{
			request.setAttribute("errMessage", userDel);
			request.getRequestDispatcher("/Admin.jsp").forward(request, response);
		}

	}

}
