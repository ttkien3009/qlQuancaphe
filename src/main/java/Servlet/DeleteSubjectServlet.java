package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Code.DeleteSubjectDAO;
import Code.Subject;

public class DeleteSubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteSubjectServlet() {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mamon = request.getParameter("MaMon");
		Subject subj = new Subject();
		subj.setMaMon(mamon);
		DeleteSubjectDAO delDao = new DeleteSubjectDAO();
		String userDel = null;
		try {
			userDel = delDao.authenticateDel(subj);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (userDel.equals("SUCCESS")) // On success, you can display a message to user on Home page
		{
			request.setAttribute("errMessage", "Xoa thanh cong");
			request.getRequestDispatcher("/Admin.jsp?tmp=ListSubject").forward(request, response);
		} else // On Failure, display a meaningful message to the User.
		{
			request.setAttribute("errMessage", userDel);
			request.getRequestDispatcher("/Admin.jsp").forward(request, response);
		}

	}

}
