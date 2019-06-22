package Code;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UpdateStudent {
	public String authenticateUpdate(Student stud) throws SQLException, UnsupportedEncodingException {

		String MaSV = stud.getMaSV();
		System.out.println(MaSV);

		String HoTen = URLEncoder.encode(stud.getHoTen(), "ISO-8859-1");
		HoTen = URLDecoder.decode(HoTen, "UTF-8");
		System.out.println(HoTen);
		
		String Phai = URLEncoder.encode(stud.getPhai(), "ISO-8859-1");
		Phai = URLDecoder.decode(Phai, "UTF-8");
		System.out.println(Phai);
		
		String NgaySinh = stud.getNgaySinh();
		System.out.println(NgaySinh);
		
		String QueQuan = URLEncoder.encode(stud.getQueQuan(), "ISO-8859-1");
		QueQuan = URLDecoder.decode(QueQuan, "UTF-8");
		System.out.println(QueQuan);
		
		String CMND = stud.getCMND();
		System.out.println(CMND);
		
		String SoDienThoai = stud.getSoDienThoai();
		System.out.println(SoDienThoai);
		
		String Khoa = URLEncoder.encode(stud.getKhoa(), "ISO-8859-1");
		Khoa = URLDecoder.decode(Khoa, "UTF-8");
		System.out.println(Khoa);
		
		String Nghanh = URLEncoder.encode(stud.getNghanh(), "ISO-8859-1");
		Nghanh = URLDecoder.decode(Nghanh, "UTF-8");
		System.out.println(Nghanh);
		
		String TinhTrang = URLEncoder.encode(stud.getTinhTrang(), "ISO-8859-1");
		TinhTrang = URLDecoder.decode(TinhTrang, "UTF-8");
		System.out.println(TinhTrang);
		
		int TinChiDaHoc = stud.getTinChiDaHoc();
		System.out.println(TinChiDaHoc);
		
		int TinChiDangNo = stud.getTinChiDangNo();
		System.out.println(TinChiDangNo);
		
		String Email = stud.getSoDienThoai();
		System.out.println(Email);
		
		String HinhSV = stud.getHinhSV();
		System.out.println(HinhSV);
		
		
		

		Connection con = null;
		PreparedStatement preparedStatement = null;

		int check = 0;

		Statement statement = null;
		ResultSet resultSet = null;
		String masv;

		con = DBConnection.createConnection();
		statement = con.createStatement();
		resultSet = statement.executeQuery("select MaSV from SinhVien");

		while (resultSet.next()) {
			masv = resultSet.getString("MaSV");
			if (MaSV.equals(masv)) {
				check = 1;
				break;
			}
		}

		if (check == 1) {
			try {
				con = DBConnection.createConnection();
				preparedStatement = con.prepareStatement(
						"update SinhVien set HoTen=?,Phai=?,NgaySinh=?,QueQuan=?, CMND=?, SoDienThoai=?, Khoa=?, Nghanh=?,TinhTrang=?, TinChiDaHoc=?, TinChiDangNo=?, Email=?, HinhSV=? where MaSV=? ");
				preparedStatement.setString(1, HoTen);
				preparedStatement.setString(2, Phai);
				preparedStatement.setString(3, NgaySinh);
				preparedStatement.setString(4, QueQuan);
				preparedStatement.setString(5, CMND);
				preparedStatement.setString(6, SoDienThoai);
				preparedStatement.setString(7, Khoa);
				preparedStatement.setString(8, Nghanh);
				preparedStatement.setString(9, TinhTrang);
				preparedStatement.setInt(10, TinChiDaHoc);
				preparedStatement.setInt(11, TinChiDangNo);
				preparedStatement.setString(12, Email);
				preparedStatement.setString(13, HinhSV);
				preparedStatement.setString(14, MaSV);

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
