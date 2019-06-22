package Code;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Code.RegisterBean;
import Code.DBConnection;

public class RegisterDao {
	public String registerUser(RegisterBean registerBean) throws UnsupportedEncodingException, SQLException {

		String TaiKhoan = registerBean.getTaiKhoan();
		String MatKhau = registerBean.getMatKhau();
		String PhanQuyen = URLEncoder.encode(registerBean.getPhanQuyen(), "ISO-8859-1");
		PhanQuyen = URLDecoder.decode(PhanQuyen, "UTF-8");

		Connection con = null;
		PreparedStatement preparedStatement = null;

		int check = 1;

		Statement statement = null;
		ResultSet resultset = null;
		String taikhoan = "";

		con = DBConnection.createConnection();
		statement = con.createStatement();
		resultset = statement.executeQuery("select TaiKhoan from NguoiDung");

		while (resultset.next()) {
			taikhoan = resultset.getString("TaiKhoan");
			if (TaiKhoan.equals(taikhoan)) {
				check = 0;
				break;
			}
		}

		if (check == 1) {
			try {
				con = DBConnection.createConnection(); 
				preparedStatement = con.prepareStatement("insert into NguoiDung values (?,?,?)"); 
				preparedStatement.setString(1, TaiKhoan);
				preparedStatement.setString(2, MatKhau);
				preparedStatement.setString(3, PhanQuyen);
				int i = preparedStatement.executeUpdate();

				if (i != 0) // Just to ensure data has been inserted into the database
					return "SUCCESS";
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return "Oops.. Something went wrong there..!"; // On failure, send a message from here.
	}
}
