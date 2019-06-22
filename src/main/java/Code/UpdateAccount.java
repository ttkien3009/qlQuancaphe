package Code;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UpdateAccount {
	public String authenticateUpdate(RegisterBean registerBean) throws SQLException, UnsupportedEncodingException {

		String MatKhau = URLEncoder.encode(registerBean.getMatKhau(), "ISO-8859-1");
		MatKhau = URLDecoder.decode(MatKhau, "UTF-8");

		String PhanQuyen = URLEncoder.encode(registerBean.getPhanQuyen(), "ISO-8859-1");
		PhanQuyen = URLDecoder.decode(PhanQuyen, "UTF-8");

		String TaiKhoan = URLEncoder.encode(registerBean.getTaiKhoan(), "ISO-8859-1");
		TaiKhoan = URLDecoder.decode(TaiKhoan, "UTF-8");

		

		Connection con = null;
		PreparedStatement preparedStatement = null;

		int check = 0;

		Statement statement = null;
		ResultSet resultSet = null;
		String taikhoan = "";

		con = DBConnection.createConnection();
		statement = con.createStatement();
		resultSet = statement.executeQuery("select TaiKhoan from nguoidung");

		while (resultSet.next()) {
			taikhoan = resultSet.getString("TaiKhoan");
			if (TaiKhoan.equals(taikhoan)) {
				check = 1;
				break;
			}
		}

		if (check == 1) {
			try {
				con = DBConnection.createConnection();
				String query = "update NguoiDung set  MatKhau = ?, PhanQuyen = ? where TaiKhoan = ?";
				preparedStatement = con.prepareStatement(query);
				preparedStatement.setString(1, MatKhau);
				preparedStatement.setString(2, PhanQuyen);
				preparedStatement.setString(3, TaiKhoan);
				
				System.out.println(query);
				int j = preparedStatement.executeUpdate();

				if (j != 0) // Just to ensure data has been inserted into the database
					return "SUCCESS";
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return "Oops.. Something went wrong there..!"; // On failure, send a message from here.
	}
}
