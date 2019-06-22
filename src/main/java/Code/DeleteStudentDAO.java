package Code;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DeleteStudentDAO {
	public String authenticateDel(Student std) throws SQLException {
		
		String masv = std.getMaSV();
		Connection con = null;
		PreparedStatement preparedStatement = null;

		int check = 0;

		Statement statement = null;
		ResultSet resultSet = null;
		String MaSVDB = "";

		con = DBConnection.createConnection();
		statement = con.createStatement();
		resultSet = statement.executeQuery("select MaSV from SinhVien");

		while (resultSet.next()) {
			MaSVDB = resultSet.getString("MaSV");
			if (masv.equals(MaSVDB)) {
				check = 1;
				break;
			}
		}

		if (check == 1) {
			try {
				con = DBConnection.createConnection();
				preparedStatement = con.prepareStatement("delete from SinhVien where MaSV=?");
				
				preparedStatement.setString(1, masv);
				preparedStatement.executeUpdate();
				
				preparedStatement = con.prepareStatement("delete from NguoiDung where TaiKhoan=?");

				preparedStatement.setString(1, masv);

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
