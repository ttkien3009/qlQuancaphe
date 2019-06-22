	package Code;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

import Code.DBConnection;
import Code.Subject;

public class Subject {
	private String MaLop;
	private String MaMon;
	private String TenMon;
	private int SoTinChi;
	private String GiangVien;
	private int Ca;
	private int Thu;
	private String Phong;
	private String ThoiGianBatDau;
	private String ThoiGianKetThuc;

	public String getMaLop() {
		return MaLop;
	}

	public void setMaLop(String maLop) {
		MaLop = maLop;
	}
	
	public String getMaMon() {
		return MaMon;
	}

	public void setMaMon(String maMon) {
		MaMon = maMon;
	}
	
	public String getTenMon() {
		return TenMon;
	}

	public void setTenMon(String tenMon) {
		TenMon = tenMon;
	}

	public int getSoTinChi() {
		return SoTinChi;
	}

	public void setSoTinChi(int soTinChi) {
		SoTinChi = soTinChi;
	}

	public String getGiangVien() {
		return GiangVien;
	}

	public void setGiangVien(String giangVien) {
		GiangVien = giangVien;
	}

	public int getCa() {
		return Ca;
	}

	public void setCa(int ca) {
		Ca = ca;
	}

	public int getThu() {
		return Thu;
	}

	public void setThu(int thu) {
		Thu = thu;
	}
	
	public String getPhong() {
		return Phong;
	}

	public void setPhong(String phong) {
		Phong = phong;
	}
	
	public String getThoiGianBatDau() {
		return ThoiGianBatDau;
	}

	public void setThoiGianBatDau(String thoiGianBatDau) {
		ThoiGianBatDau = thoiGianBatDau;
	}

	public String getThoiGianKetThuc() {
		return ThoiGianKetThuc;
	}

	public void setThoiGianKetThuc(String thoiGianKetThuc) {
		ThoiGianKetThuc = thoiGianKetThuc;
	}

	public boolean Save() throws SQLException, ClassNotFoundException {
		Connection con = (Connection) DBConnection.createConnection();
		Statement st = (Statement) con.createStatement();
		// this.MaSV = getCount();
		String query = "";
		if (this.MaLop.equals("") == true) {
			return false;
		}
		if (this.MaMon.equals("") == true) {
			return false;
		}
		if (this.TenMon.equals("") == true) {
			return false;
		}
		if (this.GiangVien.equals("") == true) {
			return false;
		}
		if (this.Phong.equals("") == true) {
			return false;
		}
		if (this.ThoiGianBatDau.equals("") == true) {
			return false;
		}
		if (this.ThoiGianKetThuc.equals("") == true) {
			return false;
		}
		query = "INSERT INTO `Mon` VALUES ('" + this.MaLop + "','" + this.MaMon + "','" + this.TenMon + "','" + this.SoTinChi + "','"
				+ this.GiangVien + "','" + this.Ca + "','" + this.Thu + "','" + this.Phong + "','" + this.ThoiGianBatDau + "','"
				+ this.ThoiGianKetThuc + "')";
		System.out.println(query);
		st.executeUpdate(query);
		con.close();
		return true;
	}

	public Vector getListSubject() {
		try {
			Connection con = (Connection) DBConnection.createConnection();
			Statement st = (Statement) con.createStatement();
			String query = "select * from Mon ORDER BY MaLop DESC";

			ResultSet rs = st.executeQuery(query);
			Vector tmp = new Vector();
			while (rs.next()) {
				Subject subj = new Subject();
				subj.setMaLop(rs.getString("MaLop"));
				subj.setMaMon(rs.getString("MaMon"));
				subj.setTenMon(rs.getString("TenMon"));
				subj.setSoTinChi(rs.getInt("SoTinChi"));
				subj.setGiangVien(rs.getString("GiangVien"));
				subj.setCa(rs.getInt("Ca"));
				subj.setThu(rs.getInt("Thu"));
				subj.setPhong(rs.getString("Phong"));
				subj.setThoiGianBatDau(rs.getString("ThoiGianBatDau"));
				subj.setThoiGianKetThuc(rs.getString("ThoiGianKetThuc"));
				tmp.addElement(subj);
			}
			return tmp;
		} catch (SQLException ex) {
			Logger.getLogger(Student.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public ArrayList<Subject> getListSubject_Array(int a, int b) throws SQLException, ClassNotFoundException {
		Connection con = (Connection) Code.DBConnection.createConnection();
		ArrayList<Subject> list = new ArrayList<Subject>();
		String sql = "SELECT * FROM Mon ORDER BY MaLop DESC Limit ?,? ";
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, a);
			stmt.setInt(2, b);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Subject subj = new Subject();
				subj.setMaLop(rs.getString("MaLop"));
				subj.setMaMon(rs.getString("MaMon"));
				subj.setTenMon(rs.getString("TenMon"));
				subj.setSoTinChi(rs.getInt("SoTinChi"));
				subj.setGiangVien(rs.getString("GiangVien"));
				subj.setCa(rs.getInt("Ca"));
				subj.setThu(rs.getInt("Thu"));
				subj.setPhong(rs.getString("Phong"));
				subj.setThoiGianBatDau(rs.getString("ThoiGianBatDau"));
				subj.setThoiGianKetThuc(rs.getString("ThoiGianKetThuc"));
				list.add(subj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			con.close();
		}
		return list;
	}

	public int getCountSubject() throws SQLException, ClassNotFoundException {
		Connection con = (Connection) DBConnection.createConnection();
		ArrayList<Subject> list = new ArrayList<Subject>();
		String sql = "SELECT count(*) FROM Mon";
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

	public Vector getSubjectList() {
		try {
			Connection con = (Connection) DBConnection.createConnection();
			Statement st = (Statement) con.createStatement();
			String query = "select * from Mon";
			ResultSet rs = st.executeQuery(query);
			Vector tmp = new Vector();
			while (rs.next()) {
				Subject subj = new Subject();
				subj.setMaLop(rs.getString("MaLop"));
				subj.setMaMon(rs.getString("MaMon"));
				subj.setTenMon(rs.getString("TenMon"));
				subj.setSoTinChi(rs.getInt("SoTinChi"));
				subj.setGiangVien(rs.getString("GiangVien"));
				subj.setCa(rs.getInt("Ca"));
				subj.setThu(rs.getInt("Thu"));
				subj.setPhong(rs.getString("Phong"));
				subj.setThoiGianBatDau(rs.getString("ThoiGianBatDau"));
				subj.setThoiGianKetThuc(rs.getString("ThoiGianKetThuc"));
				tmp.addElement(subj);
			}
			return tmp;
		} catch (SQLException ex) {
			Logger.getLogger(ManagerAccount.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	

	

	

	

}
