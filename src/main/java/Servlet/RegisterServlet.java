package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Code.RegisterBean;
import Code.RegisterDao;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Copying all the input parameters in to local variables
		String TaiKhoan = request.getParameter("TaiKhoan");
		String MatKhau = request.getParameter("MatKhau");
		String PhanQuyen = request.getParameter("PhanQuyen");
		

		RegisterBean registerBean = new RegisterBean();
		// Using Java Beans - An easiest way to play with group of related data
		registerBean.setTaiKhoan(TaiKhoan);
		registerBean.setMatKhau(MatKhau);
		registerBean.setPhanQuyen(PhanQuyen);
		

		RegisterDao registerDao = new RegisterDao();

		// The core Logic of the Registration application is present here. We are going
		// to insert user data in to the database.
		String userRegistered = null;
		try {
			userRegistered = registerDao.registerUser(registerBean);
			if (userRegistered.equals("SUCCESS")) // On success, you can display a message to user on Home page
			{
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			} else // On Failure, display a meaningful message to the User.
			{
				request.setAttribute("errMessage", userRegistered);
				request.getRequestDispatcher("/Register.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
