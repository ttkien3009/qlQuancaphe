package Code;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UpdateSubject {
	public String authenticateUpdate(Subject subj) throws SQLException, UnsupportedEncodingException {

		String MaLop = subj.getMaLop();
		System.out.println(MaLop);
		
		String MaMon = subj.getMaMon();
		System.out.println(MaMon);

		String TenMon = URLEncoder.encode(subj.getTenMon(), "ISO-8859-1");
		TenMon = URLDecoder.decode(TenMon, "UTF-8");
		System.out.println(TenMon);
		
		int SoTinChi = subj.getSoTinChi();
		System.out.println(SoTinChi);
		
		String GiangVien = URLEncoder.encode(subj.getGiangVien(), "ISO-8859-1");
		GiangVien = URLDecoder.decode(GiangVien, "UTF-8");
		System.out.println(GiangVien);
		
		int Ca = subj.getCa();
		System.out.println(Ca);
		
		int Thu = subj.getThu();
		System.out.println(Thu);
		
		String Phong = subj.getPhong();
		System.out.println(Phong);
		
		String ThoiGianBatDau = subj.getThoiGianBatDau();
		System.out.println(ThoiGianBatDau);
		
		String ThoiGianKetThuc = subj.getThoiGianKetThuc();
		System.out.println(ThoiGianBatDau);
	
		
		Connection con = null;
		PreparedStatement preparedStatement = null;

		int check = 0;

		Statement statement = null;
		ResultSet resultSet = null;
		String mamon = "";

		con = DBConnection.createConnection();
		statement = con.createStatement();
		resultSet = statement.executeQuery("select MaMon from Mon");

		while (resultSet.next()) {
			mamon = resultSet.getString("MaMon");
			if (MaMon.equals(mamon) ) {
				check = 1;
				break;
			}
		}

		if (check == 1) {
			try {
				con = DBConnection.createConnection();
				preparedStatement = con.prepareStatement(
						"update Mon set MaLop = ?, TenMon=?,SoTinChi=?,GiangVien=?,Ca=?, Thu=?, Phong = ?, ThoiGianBatDau=?, ThoiGianKetThuc=? where MaMon=? ");
				preparedStatement.setString(1, MaLop);
				preparedStatement.setString(2, TenMon);
				preparedStatement.setInt(3, SoTinChi);
				preparedStatement.setString(4, GiangVien);
				preparedStatement.setInt(5, Ca);
				preparedStatement.setInt(6, Thu);
				preparedStatement.setString(7, Phong);
				preparedStatement.setString(8, ThoiGianBatDau);
				preparedStatement.setString(9, ThoiGianKetThuc);
				preparedStatement.setString(10, MaMon);

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
