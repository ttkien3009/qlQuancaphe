package Code;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DeleteAccountDao {
	public String authenticateDel(LoginBean loginBean) throws SQLException {
		
		String taikhoan = loginBean.getTaiKhoan();
		Connection con = null;
		PreparedStatement preparedStatement = null;

		int check = 0;

		Statement statement = null;
		ResultSet resultSet = null;
		String TaiKhoanDB = "";

		con = DBConnection.createConnection();
		statement = con.createStatement();
		resultSet = statement.executeQuery("select TaiKhoan from NguoiDung");

		while (resultSet.next()) {
			TaiKhoanDB = resultSet.getString("TaiKhoan");
			if (taikhoan.equals(TaiKhoanDB)) {
				check = 1;
				break;
			}
		}

		if (check == 1) {
			try {
				con = DBConnection.createConnection();
				preparedStatement = con.prepareStatement("delete from NguoiDung where TaiKhoan=?");

				preparedStatement.setString(1, taikhoan);

				int i = preparedStatement.executeUpdate();

				if (i != 0) // Just to ensure data has been inserted into the database
					return "SUCCESS";
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return "Oops.. Something went wrong there..!";
	}
}
