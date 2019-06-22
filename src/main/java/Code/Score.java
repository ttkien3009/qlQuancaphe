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
import Code.Score;

public class Score {
	private String MaSV; 
	private String MaMon;
	private String MaLop;
	private float Diem;
	
	public String getMaSV() {
		return MaSV;
	}
	public void setMaSV(String maSV) {
		MaSV = maSV;
	}
	
	public String getMaMon() {
		return MaMon;
	}
	public void setMaMon(String maMon) {
		MaMon = maMon;
	}
	public String getMaLop() {
		return MaLop;
	}
	public void setMaLop(String maLop) {
		MaLop = maLop;
	}
	public float getDiem() {
		return Diem;
	}
	public void setDiem(float diem) {
		Diem = diem;
	}
	
	
	
	public boolean Save() throws SQLException, ClassNotFoundException {
		Connection con = (Connection) DBConnection.createConnection();
		Statement st = (Statement) con.createStatement();
		//this.MaSV = getCount();
		String query = "";
		if (this.MaSV.equals("") == true) {
			return false;
		}
		if (this.MaMon.equals("") == true) {
			return false;
		}
		if (this.MaLop.equals("") == true) {
			return false;
		}
		
		query = "INSERT INTO `DiemSV` VALUES ('" + this.MaSV + "','" + this.MaMon + "','" + this.MaLop + "','"
				+ this.Diem + "')";
		System.out.println(query);
		st.executeUpdate(query);
		con.close();
		return true;
	}

	public Vector getListScore() {
		try {
			Connection con = (Connection) DBConnection.createConnection();
			Statement st = (Statement) con.createStatement();
			String query = "select * from DiemSV ORDER BY MaSV DESC";

			ResultSet rs = st.executeQuery(query);
			Vector tmp = new Vector();
			while (rs.next()) {
				Score sc = new Score();
				sc.setMaSV(rs.getString("MaSV"));
				sc.setMaMon(rs.getString("MaMon"));
				sc.setMaLop(rs.getString("MaLop"));
				sc.setDiem(rs.getFloat("Diem"));
				tmp.addElement(sc);
			}
			return tmp;
		} catch (SQLException ex) {
			Logger.getLogger(Student.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public ArrayList<Score> getListSv_Array(int a, int b) throws SQLException, ClassNotFoundException {
		Connection con = (Connection) Code.DBConnection.createConnection();
		ArrayList<Score> list = new ArrayList<Score>();
		String sql = "SELECT * FROM DiemSV ORDER BY MaSV DESC Limit ?,? ";
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, a);
			stmt.setInt(2, b);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Score sc = new Score();
				sc.setMaSV(rs.getString("MaSV"));
				sc.setMaMon(rs.getString("MaMon"));
				sc.setMaLop(rs.getString("MaLop"));
				sc.setDiem(rs.getFloat("Diem"));
				list.add(sc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			con.close();
		}
		return list;
	}

	public int getCountScore() throws SQLException, ClassNotFoundException {
		Connection con = (Connection) DBConnection.createConnection();
		ArrayList<Student> list = new ArrayList<Student>();
		String sql = "SELECT count(*) FROM DiemSV";
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
	
	public Vector getScoreList(){
        try{
            Connection con = (Connection) DBConnection.createConnection();
            Statement st = (Statement)con.createStatement();
            String query = "select * from DiemSV";
            ResultSet rs = st.executeQuery(query);
            Vector tmp = new Vector();
            while(rs.next()){
            	Score sc = new Score();
				sc.setMaSV(rs.getString("MaSV"));
				sc.setMaMon(rs.getString("MaMon"));
				sc.setMaLop(rs.getString("MaLop"));
				sc.setDiem(rs.getFloat("Diem"));
                tmp.addElement(sc);
            }
            return tmp;
        }
        catch (SQLException ex){
            Logger.getLogger(ManagerAccount.class.getName()).log(Level.SEVERE,null,ex);
        }
        return null;
    }
	
	
	
}
