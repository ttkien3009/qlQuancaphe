package Code;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import Code.LoginBean;
import Code.DBConnection;

public class LoginDao {
	public String authenticateUser(LoginBean loginBean) {

		String TaiKhoan = loginBean.getTaiKhoan(); // Keeping user entered values in temporary variables.
		String MatKhau = loginBean.getMatKhau();

		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;

		String TaiKhoanDB = "";
		String MatKhauDB = "";
		String PhanQuyen = "";

		try {
			con = DBConnection.createConnection(); // establishing connection
			statement = con.createStatement(); // Statement is used to write queries. Read more about it.
			resultSet = statement.executeQuery("select TaiKhoan, MatKhau, PhanQuyen from NguoiDung"); // Here table name is users
																								// and userName,password
																								// are columns. fetching
																								// all the records and
																								// storing in a
																								// resultSet.

			while (resultSet.next()) // Until next row is present otherwise it return false
			{
				TaiKhoanDB = resultSet.getString("TaiKhoan"); // fetch the values present in database
				MatKhauDB = resultSet.getString("MatKhau");
				PhanQuyen = resultSet.getString("PhanQuyen");
				System.out.println(TaiKhoanDB);
				System.out.println(MatKhauDB);


				if (TaiKhoan.equals(TaiKhoanDB) && MatKhau.equals(MatKhauDB) && PhanQuyen.equals("Admin")) {
					return "SUCCESS ADMIN"; //// If the user entered values are already present in database, which means
											//// user has already registered so I will return SUCCESS message.
				}
				if (TaiKhoan.equals(TaiKhoanDB) && MatKhau.equals(MatKhauDB) && PhanQuyen.equals("Student")) {
					return "SUCCESS STUDENT"; //// If the user entered values are already present in database, which
												//// means
												//// user has already registered so I will return SUCCESS message.
				}
				if (TaiKhoan.equals(TaiKhoanDB) && MatKhau.equals(MatKhauDB) && PhanQuyen.equals("Teacher")) {
					return "SUCCESS TEACHER"; //// If the user entered values are already present in database, which means
											//// user has already registered so I will return SUCCESS message.
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "Invalid user credentials"; // Just returning appropriate message otherwise
	}
}