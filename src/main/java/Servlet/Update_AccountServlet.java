package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Code.RegisterBean;
import Code.UpdateAccount;

/**
 * Servlet implementation class UpdateAccountServlet
 */
public class Update_AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Update_AccountServlet() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String MatKhau = request.getParameter("MatKhau");
		String TaiKhoan = request.getParameter("TaiKhoan");
		String PhanQuyen = request.getParameter("PhanQuyen");
		
	//	String password = request.getParameter("password");

		RegisterBean signupBean = new RegisterBean();

//Using Java Beans - An easiest way to play with group of related data
		
		signupBean.setTaiKhoan(TaiKhoan);
	    signupBean.setMatKhau(MatKhau);
		signupBean.setPhanQuyen(PhanQuyen);
		

		UpdateAccount signupDao = new UpdateAccount();

//The core Logic of the Registration application is present here. We are going to insert user data in to the database.
		String userSignup = null;
		try {
			userSignup = signupDao.authenticateUpdate(signupBean);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (userSignup.equals("SUCCESS")) // On success, you can display a message to user on Home page
		{
			request.getRequestDispatcher("/Admin.jsp").forward(request, response);
		} else // On Failure, display a meaningful message to the User.
		{
			request.setAttribute("errMessage", userSignup);
			request.getRequestDispatcher("/Admin.jsp?message=Loi update thong tin khach hang").forward(request,
					response);
		}
	}

}
