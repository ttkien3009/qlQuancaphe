package Code;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class FindUser {
	public String findType(String id) throws SQLException
	{
		String PhanQuyen=null;
		Connection con = null;
		Statement statement = null;
		ResultSet resultSet = null;
		String TaiKhoanDB = "";

		con = DBConnection.createConnection();
		statement = con.createStatement();
		resultSet = statement.executeQuery("select * from NguoiDung");
		while (resultSet.next()) {
			TaiKhoanDB = resultSet.getString("TaiKhoan");
			if (id.equals(TaiKhoanDB)) {
				PhanQuyen = resultSet.getString("PhanQuyen");
				break;
			}
		}
		System.out.println("Java:" + PhanQuyen);

		return PhanQuyen;
	}
}
