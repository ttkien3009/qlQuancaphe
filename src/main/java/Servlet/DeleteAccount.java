package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Code.DeleteAccountDao;
import Code.LoginBean;

public class DeleteAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteAccount() {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String taikhoan = request.getParameter("TaiKhoan");
		LoginBean loginBean = new LoginBean();
		loginBean.setTaiKhoan(taikhoan);
		DeleteAccountDao delDao = new DeleteAccountDao();
		String userDel = null;
		try {
			userDel = delDao.authenticateDel(loginBean);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (userDel.equals("SUCCESS")) // On success, you can display a message to user on Home page
		{
			request.setAttribute("errMessage", "Xoa thanh cong");
			request.getRequestDispatcher("/Admin.jsp?tmp = Infor_User").forward(request, response);
		} else // On Failure, display a meaningful message to the User.
		{
			request.setAttribute("errMessage", userDel);
			request.getRequestDispatcher("/Admin.jsp").forward(request, response);
		}

	}

}
