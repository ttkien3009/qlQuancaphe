package Code;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class User {

	private String TaiKhoan;
	private String MatKhau;
	private String PhanQuyen;
	
	public String getTaiKhoan() {
		return TaiKhoan;
	}

	public void setTaiKhoan(String taiKhoan) {
		TaiKhoan = taiKhoan;
	}

	public String getMatKhau() {
		return MatKhau;
	}

	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}

	public String getPhanQuyen() {
		return PhanQuyen;
	}

	public void setPhanQuyen(String phanQuyen) {
		PhanQuyen = phanQuyen;
	}
	
	public User() {
		super();
	}

	public boolean save() throws SQLException {
		Connection con = (Connection) DBConnection.createConnection();
		Statement st = (Statement) con.createStatement();
		String query = "";
		if (this.TaiKhoan.equals("") == true) {
			return false;
		}
		
		if (this.MatKhau.equals("") == true) {
			return false;
		}
		
		if (this.PhanQuyen.equals("") == true) {
			return false;
		}
		query = "INSERT INTO `NguoiDung`" + "VALUES ('" + this.TaiKhoan + "'"
				+ ",'" + this.MatKhau + "'" + ",'" + this.PhanQuyen + "'" + ")";
		st.executeUpdate(query);
	//	String ngay = (this.birthday.getYear() + 1900) + "/" + (this.birthday.getMonth() + 1) + "/"
	//			+ this.birthday.getDate();
		//query = "INSERT INTO `khachhang`" + "VALUES ('" + this.MSSV + "'" + ",'" + this.Type + "'" + ")"; //
		System.out.println(query);
		st.executeUpdate(query);
		con.close();
		return true;
	}

	public boolean check() throws SQLException, ClassNotFoundException {
		Connection con = DBConnection.createConnection();
		Statement st = con.createStatement();
		String query = "select * from NguoiDung where TaiKhoan ='" + this.TaiKhoan + "' and MatKhau='" + this.MatKhau
				+ "'";
		ResultSet rs = st.executeQuery(query);
		while (rs.next()) {
			this.TaiKhoan = rs.getString("TaiKhoan");
			this.PhanQuyen = rs.getString("PhanQuyen");
			return true;
		}
		return false;
	}
	
	public int getCountUser() throws SQLException, ClassNotFoundException {
		Connection con = (Connection) DBConnection.createConnection();
		ArrayList<User> list = new ArrayList<User>();
		String sql = "SELECT count(*) FROM NguoiDung";
		int count = 0;
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public ArrayList<User> getListUs_Array(int a, int b) throws SQLException, ClassNotFoundException {
		Connection con = (Connection) DBConnection.createConnection();
		ArrayList<User> list = new ArrayList<User>();
		String sql = "SELECT * FROM NguoiDung ORDER BY TaiKhoan DESC Limit ?,? ";
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, a);
			stmt.setInt(2, b);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				User usr = new User();
				usr.setTaiKhoan(rs.getString("TaiKhoan"));
				usr.setMatKhau(rs.getString("MatKhau"));
				usr.setPhanQuyen(rs.getString("PhanQuyen"));
				list.add(usr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			con.close();
		}
		return list;
	}


	
}
