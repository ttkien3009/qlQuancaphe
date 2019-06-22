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
import Code.Student;

public class Student {
	private String MaSV; 
	private String HoTen;
	private String Phai;
	private String NgaySinh;
	private String QueQuan;
	private String CMND;
	private String SoDienThoai;
	private String Khoa;
	private String Nghanh;
	private String TinhTrang;
	private int TinChiDaHoc;
	private int TinChiDangNo;
	private String Email;
	private String HinhSV;
	
	public String getMaSV() {
		return MaSV;
	}
	public void setMaSV(String maSV) {
		MaSV = maSV;
	}
	public String getHoTen() {
		return HoTen;
	}
	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}
	public String getNgaySinh() {
		return NgaySinh;
	}
	public void setNgaySinh(String ngaySinh) {
		NgaySinh = ngaySinh;
	}
	public String getPhai() {
		return Phai;
	}
	public void setPhai(String phai) {
		Phai = phai;
	}
	public String getCMND() {
		return CMND;
	}
	public void setCMND(String cMND) {
		CMND = cMND;
	}
	public String getQueQuan() {
		return QueQuan;
	}
	public void setQueQuan(String queQuan) {
		QueQuan = queQuan;
	}
	public String getSoDienThoai() {
		return SoDienThoai;
	}
	public void setSoDienThoai(String soDienThoai) {
		SoDienThoai = soDienThoai;
	}
	public String getKhoa() {
		return Khoa;
	}
	public void setKhoa(String khoa) {
		Khoa = khoa;
	}
	public String getNghanh() {
		return Nghanh;
	}
	public void setNghanh(String nghanh) {
		Nghanh = nghanh;
	}
	public String getTinhTrang() {
		return TinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		TinhTrang = tinhTrang;
	}
	public int getTinChiDaHoc() {
		return TinChiDaHoc;
	}
	public void setTinChiDaHoc(int tinChiDaHoc) {
		TinChiDaHoc = tinChiDaHoc;
	}
	public int getTinChiDangNo() {
		return TinChiDangNo;
	}
	public void setTinChiDangNo(int tinChiDangNo) {
		TinChiDangNo = tinChiDangNo;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getHinhSV() {
		return HinhSV;
	}
	public void setHinhSV(String hinhSV) {
		HinhSV = hinhSV;
	}
	
	public boolean Save() throws SQLException, ClassNotFoundException {
		Connection con = (Connection) DBConnection.createConnection();
		Statement st = (Statement) con.createStatement();
		//this.MaSV = getCount();
		String query = "";
		if (this.MaSV.equals("") == true) {
			return false;
		}
		if (this.HoTen.equals("") == true) {
			return false;
		}
		if (this.Phai.equals("") == true) {
			return false;
		}
		if (this.NgaySinh.equals("") == true) {
			return false;
		}
		if (this.QueQuan.equals("") == true) {
			return false;
		}
		if (this.CMND.equals("") == true) {
			return false;
		}
		if (this.SoDienThoai.equals("") == true) {
			return false;
		}
		if (this.Khoa.equals("") == true) {
			return false;
		}
		if (this.Nghanh.equals("") == true) {
			return false;
		}
		if (this.TinhTrang.equals("") == true) {
			return false;
		}
		if (this.Email.equals("") == true) {
			return false;
		}
		if (this.HinhSV.equals("") == true) {
			return false;
		}
		
		query = "INSERT INTO `SinhVien` VALUES ('" + this.MaSV + "','" + this.HoTen + "','" + this.Phai + "','"
				+ this.NgaySinh + "','" + this.QueQuan + "','" + this.CMND + "','" + this.SoDienThoai + "','"
				+ this.Khoa + "','" + this.Nghanh + "', '" + this.TinhTrang + "' ,'" + this.TinChiDaHoc + "', '" 
				+ this.TinChiDangNo + "','" + this.Email + "', '" + this.HinhSV + "')";
		System.out.println(query);
		st.executeUpdate(query);
		query = "INSERT INTO `NguoiDung` VALUES ('" + this.MaSV + "','12345678','Student')";
		System.out.println(query);
		st.executeUpdate(query);
		con.close();
		return true;
	}

	public Vector getListSV() {
		try {
			Connection con = (Connection) DBConnection.createConnection();
			Statement st = (Statement) con.createStatement();
			String query = "select * from SinhVien ORDER BY MaSV DESC";

			ResultSet rs = st.executeQuery(query);
			Vector tmp = new Vector();
			while (rs.next()) {
				Student sv = new Student();
				sv.setMaSV(rs.getString("MaSV"));
				sv.setHoTen(rs.getString("HoTen"));
				sv.setPhai(rs.getString("Phai"));
				sv.setNgaySinh(rs.getString("NgaySinh"));
				sv.setQueQuan(rs.getString("QueQuan"));
				sv.setCMND(rs.getString("CMND"));
				sv.setSoDienThoai(rs.getString("SoDienThoai"));
				sv.setKhoa(rs.getString("Khoa"));
				sv.setNghanh(rs.getString("Nghanh"));
				sv.setTinhTrang(rs.getString("TinhTrang"));
				sv.setTinChiDaHoc(rs.getInt("TinChiDaHoc"));
				sv.setTinChiDangNo(rs.getInt("TinChiDangNo"));
				sv.setEmail(rs.getString("Email"));
				sv.setHinhSV(rs.getString("HinhSV"));
				tmp.addElement(sv);
			}
			return tmp;
		} catch (SQLException ex) {
			Logger.getLogger(Student.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public ArrayList<Student> getListSv_Array(int a, int b) throws SQLException, ClassNotFoundException {
		Connection con = (Connection) Code.DBConnection.createConnection();
		ArrayList<Student> list = new ArrayList<Student>();
		String sql = "SELECT * FROM SinhVien ORDER BY MaSV DESC Limit ?,? ";
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, a);
			stmt.setInt(2, b);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Student std = new Student();
				std.setMaSV(rs.getString("MaSV"));
				std.setHoTen(rs.getString("HoTen"));
				std.setPhai(rs.getString("Phai"));
				std.setNgaySinh(rs.getString("NgaySinh"));
				std.setQueQuan(rs.getString("QueQuan"));
				std.setCMND(rs.getString("CMND"));
				std.setSoDienThoai(rs.getString("SoDienThoai"));
				std.setKhoa(rs.getString("Khoa"));
				std.setNghanh(rs.getString("Nghanh"));
				std.setTinhTrang(rs.getString("TinhTrang"));
				std.setTinChiDaHoc(rs.getInt("TinChiDaHoc"));
				std.setTinChiDangNo(rs.getInt("TinChiDangNo"));
				std.setEmail(rs.getString("Email"));
				std.setHinhSV(rs.getString("HinhSV"));
				list.add(std);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			con.close();
		}
		return list;
	}

	public int getCountStudent() throws SQLException, ClassNotFoundException {
		Connection con = (Connection) DBConnection.createConnection();
		ArrayList<Student> list = new ArrayList<Student>();
		String sql = "SELECT count(*) FROM SinhVien";
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
	
	public Vector getStudentList(){
        try{
            Connection con = (Connection) DBConnection.createConnection();
            Statement st = (Statement)con.createStatement();
            String query = "select * from SinhVien";
            ResultSet rs = st.executeQuery(query);
            Vector tmp = new Vector();
            while(rs.next()){
                Student usr=new Student();  
                usr.setMaSV(rs.getString("MaSV"));
                usr.setHoTen(rs.getString("HoTen"));
                usr.setPhai(rs.getString("Phai"));
                usr.setNgaySinh(rs.getString("NgaySinh"));
                usr.setQueQuan(rs.getString("QueQuan"));
                usr.setCMND(rs.getString("CMND"));
                usr.setSoDienThoai(rs.getString("SoDienThoai"));
                usr.setKhoa(rs.getString("Khoa"));
                usr.setNghanh(rs.getString("Nghanh"));
                usr.setTinhTrang(rs.getString("TinhTrang"));
                usr.setTinChiDaHoc(rs.getInt("TinChiDaHoc"));
                usr.setTinChiDangNo(rs.getInt("TinChiDangNo"));
                usr.setEmail(rs.getString("Email"));
                usr.setHinhSV(rs.getString("HinhSV"));
                tmp.addElement(usr);
            }
            return tmp;
        }
        catch (SQLException ex){
            Logger.getLogger(ManagerAccount.class.getName()).log(Level.SEVERE,null,ex);
        }
        return null;
    }
	
	
}
