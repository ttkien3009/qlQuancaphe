package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Code.DeleteScoreDAO;
import Code.Score;

public class DeleteScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteScoreServlet() {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String masv = request.getParameter("MaSV");
		Score subj = new Score();
		subj.setMaMon(masv);
		DeleteScoreDAO delDao = new DeleteScoreDAO();
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
			request.getRequestDispatcher("/Admin.jsp?tmp=ListScore").forward(request, response);
		} else // On Failure, display a meaningful message to the User.
		{
			request.setAttribute("errMessage", userDel);
			request.getRequestDispatcher("/Admin.jsp").forward(request, response);
		}

	}

}
