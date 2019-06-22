package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false); // Fetch session object

		if (session != null) // If session is not null
		{
			session.invalidate(); // removes all session attributes bound to the session
			request.setAttribute("errMessage", "You have logged out successfully");
			Cookie[] listCookie = request.getCookies();
        	for (Cookie cookie : listCookie) {
            if (cookie.getName().equals("exUser")) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
                break;
                }
        	}	
			System.out.println("Logged out");
			response.sendRedirect("index.jsp");
		}
	}
}