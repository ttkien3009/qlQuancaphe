package Code;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DeleteSubjectDAO {
	public String authenticateDel(Subject subj) throws SQLException {
		
		String mamon = subj.getMaMon();
		Connection con = null;
		PreparedStatement preparedStatement = null;

		int check = 0;

		Statement statement = null;
		ResultSet resultSet = null;
		String MaMonDB = "";

		con = DBConnection.createConnection();
		statement = con.createStatement();
		resultSet = statement.executeQuery("select MaMon from Mon");

		while (resultSet.next()) {
			MaMonDB = resultSet.getString("MaMon");
			if (mamon.equals(MaMonDB)) {
				check = 1;
				break;
			}
		}

		if (check == 1) {
			try {
				con = DBConnection.createConnection();
				preparedStatement = con.prepareStatement("delete from Mon where MaMon=?");

				preparedStatement.setString(1, mamon);

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
