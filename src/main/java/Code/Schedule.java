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
import Code.Schedule;

public class Schedule {
	private String MaSV;
	private String MaMon;
	private String MaLop;
	private int SoTinChi;
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
	

	public int getSoTinChi() {
		return SoTinChi;
	}

	public void setSoTinChi(int soTinChi) {
		SoTinChi = soTinChi;
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
		if (this.MaSV.equals("") == true) {
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
		query = "INSERT INTO `LichHocSV` VALUES ('" + this.MaSV + "','" + this.MaMon + "','" + this.MaLop + "','" + this.SoTinChi + "','" 
		+ this.Ca + "','" + this.Thu + "','" + this.Phong + "','" + this.ThoiGianBatDau + "','"
				+ this.ThoiGianKetThuc + "')";
		System.out.println(query);
		st.executeUpdate(query);
		con.close();
		return true;
	}

	public Vector getListSchedule() {
		try {
			Connection con = (Connection) DBConnection.createConnection();
			Statement st = (Statement) con.createStatement();
			String query = "select * from LichHocSV ORDER BY MaLop DESC";

			ResultSet rs = st.executeQuery(query);
			Vector tmp = new Vector();
			while (rs.next()) {
				Schedule subj = new Schedule();
				subj.setMaLop(rs.getString("MaSV"));
				subj.setMaMon(rs.getString("MaMon"));
				subj.setMaLop(rs.getString("MaLop"));
				subj.setSoTinChi(rs.getInt("SoTinChi"));
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

	public ArrayList<Schedule> getListSchedule_Array(int a, int b) throws SQLException, ClassNotFoundException {
		Connection con = (Connection) Code.DBConnection.createConnection();
		ArrayList<Schedule> list = new ArrayList<Schedule>();
		String sql = "SELECT * FROM LichHocSV ORDER BY MaLop DESC Limit ?,? ";
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, a);
			stmt.setInt(2, b);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Schedule sch = new Schedule();
				sch.setMaLop(rs.getString("MaLop"));
				sch.setMaMon(rs.getString("MaMon"));
				sch.setMaLop(rs.getString("MaLop"));
				sch.setSoTinChi(rs.getInt("SoTinChi"));
				sch.setCa(rs.getInt("Ca"));
				sch.setThu(rs.getInt("Thu"));
				sch.setPhong(rs.getString("Phong"));
				sch.setThoiGianBatDau(rs.getString("ThoiGianBatDau"));
				sch.setThoiGianKetThuc(rs.getString("ThoiGianKetThuc"));
				list.add(sch);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			con.close();
		}
		return list;
	}

	public int getCountSchedule() throws SQLException, ClassNotFoundException {
		Connection con = (Connection) DBConnection.createConnection();
		ArrayList<Subject> list = new ArrayList<Subject>();
		String sql = "SELECT count(*) FROM LichHocSV";
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

	public Vector getScheduleList() {
		try {
			Connection con = (Connection) DBConnection.createConnection();
			Statement st = (Statement) con.createStatement();
			String query = "select * from LichHocSV";
			ResultSet rs = st.executeQuery(query);
			Vector tmp = new Vector();
			while (rs.next()) {
				Schedule subj = new Schedule();
				subj.setMaLop(rs.getString("MaLop"));
				subj.setMaMon(rs.getString("MaMon"));
				subj.setMaLop(rs.getString("MaLop"));
				subj.setSoTinChi(rs.getInt("SoTinChi"));
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

	public String getMaSV() {
		return MaSV;
	}

	public void setMaSV(String maSV) {
		MaSV = maSV;
	}

	

	

	

	

}
