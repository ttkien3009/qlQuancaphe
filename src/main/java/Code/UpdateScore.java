package Code;

import java.io.UnsupportedEncodingException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UpdateScore {
	public String authenticateUpdate(Score sc) throws SQLException, UnsupportedEncodingException {
		
		String MaSV = sc.getMaSV();
		System.out.println(MaSV);
		
		String MaMon = sc.getMaMon();
		System.out.println(MaMon);
		
		String MaLop = sc.getMaLop();
		System.out.println(MaLop);
		
		float Diem = sc.getDiem();
		System.out.println(Diem);
		
		Connection con = null;
		PreparedStatement preparedStatement = null;

		int check = 0;

		Statement statement = null;
		ResultSet resultSet = null;
		String masv = "";
		String mamon = "";

		con = DBConnection.createConnection();
		statement = con.createStatement();
		resultSet = statement.executeQuery("select MaSV, MaMon from DiemSV");

		while (resultSet.next()) {
			masv = resultSet.getString("MaSV");
			mamon = resultSet.getString("MaMon");
			if (MaSV.equals(masv) &&  MaMon.equals(mamon)) {
				check = 1;
				break;
			}
		}

		if (check == 1) {
			try {
				con = DBConnection.createConnection();
				preparedStatement = con.prepareStatement(
						"update DiemSV set  Diem = ? where MaSV = ? AND MaMon = ?");
			
				preparedStatement.setFloat(1, Diem);
				preparedStatement.setString(2, MaSV);
				preparedStatement.setString(3, MaMon);
				

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
