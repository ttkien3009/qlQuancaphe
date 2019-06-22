package Code;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DeleteScoreDAO {
	public String authenticateDel(Score sc) throws SQLException {
		
		String masv = sc.getMaSV();
		Connection con = null;
		PreparedStatement preparedStatement = null;

		int check = 0;

		Statement statement = null;
		ResultSet resultSet = null;
		String MaSVDB = "";

		con = DBConnection.createConnection();
		statement = con.createStatement();
		resultSet = statement.executeQuery("select MaSV from DiemSV");

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
				preparedStatement = con.prepareStatement("delete from DiemSV where MaSV=?");

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
