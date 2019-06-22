package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Code.LoginBean;
import Code.LoginDao;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public LoginServlet() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//Here username and password are the names which I have given in the input box in Login.jsp page. Here I am retrieving the values entered by the user and keeping in instance variables for further use.

		String TaiKhoan = request.getParameter("TaiKhoan");
		String MatKhau = request.getParameter("MatKhau");

		LoginBean loginBean = new LoginBean(); // creating object for LoginBean class, which is a normal java class,
												// contains just setters and getters. Bean classes are efficiently used
												// in java to access user information wherever required in the
												// application.

		loginBean.setTaiKhoan(TaiKhoan); // setting the username and password through the loginBean object then only you
		// can get it in future.
		loginBean.setMatKhau(MatKhau);

		LoginDao loginDao = new LoginDao(); // creating object for LoginDao. This class contains main logic of the
											// application.

		String userValidate = loginDao.authenticateUser(loginBean); // Calling authenticateUser function

		try {
			if (userValidate.equals("SUCCESS ADMIN")) {
				HttpSession session = request.getSession(); // Creating a session
				session.setAttribute("Admin", TaiKhoan); // setting session attribute
				request.setAttribute("TaiKhoan", MatKhau);

				String exUser = null;
				Cookie[] listCookie = request.getCookies();
				for (Cookie cookie : listCookie) {
					if (cookie.getName().equals("exUser")) {
						exUser = cookie.getValue();
						cookie = new Cookie("exUser", TaiKhoan);
						break;
					}
				}

				if (exUser == null) {
					Cookie ck = new Cookie("exUser", TaiKhoan);
					ck.setMaxAge(60 * 60);
					response.addCookie(ck);

				}
				request.getRequestDispatcher("/Admin.jsp").forward(request, response);
			} else if (userValidate.equals("SUCCESS STUDENT")) {
				HttpSession session = request.getSession();
				session.setAttribute("Student", TaiKhoan);
				request.setAttribute("TaiKhoan", TaiKhoan);
				// request.getRequestDispatcher("Manager.jsp").forward(request, response);

				String exUser = null;
				Cookie[] listCookie = request.getCookies();
				for (Cookie cookie : listCookie) {
					if (cookie.getName().equals("exUser")) {
						exUser = cookie.getValue();
						cookie = new Cookie("exUser", TaiKhoan);
						break;
					}
				}
				if (exUser == null) {
					Cookie ck = new Cookie("exUser", TaiKhoan);
					ck.setMaxAge(60 * 60);
					response.addCookie(ck);
				}

				request.getRequestDispatcher("/index.jsp").forward(request, response);
			} 

		} catch (

		IOException e1) {
			e1.printStackTrace();
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}

}
