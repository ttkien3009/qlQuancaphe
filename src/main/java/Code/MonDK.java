package Code;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

public class MonDK {
	
	private String MaSV;
	private String MaMon;
	private String MaLop;
	private int SoTinChi;
	private int Ca;
	private int Thu;
	private String Phong;
	private String NgayKTDK;
	private String ThoiGianBatDau;
	private String ThoiGianKetThuc;


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
	
	public String getNgayKTDK() {
		return NgayKTDK;
	}

	public void setNgayKTDK(String ngayKTDK) {
		NgayKTDK = ngayKTDK;
	}

	public String getThoiGianKetThuc() {
		return ThoiGianKetThuc;
	}
	
	public String getThoiGianBatDau() {
		return ThoiGianBatDau;
	}

	public void setThoiGianBatDau(String thoiGianBatDau) {
		ThoiGianBatDau = thoiGianBatDau;
	}

	

	public void setThoiGianKetThuc(String thoiGianKetThuc) {
		ThoiGianKetThuc = thoiGianKetThuc;
	}
	
	public Vector getDKList() {
		Vector tmp = new Vector();

		try {
			Connection con = (Connection) DBConnection.createConnection();
			Statement st = (Statement) con.createStatement();
			String query = "select * from lichocsv";
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				MonDK dk = new MonDK();
				dk.setMaSV(rs.getString("MaSV"));
				dk.setMaMon(rs.getString("MaMon"));
				dk.setMaLop(rs.getString("MaLop"));
				dk.setSoTinChi(rs.getInt("SoTinChi"));
				dk.setCa(rs.getInt("Ca"));
				dk.setThu(rs.getInt("Thu"));
				dk.setPhong(rs.getString("Phong"));
				dk.setNgayKTDK(rs.getString("NgayKTDK"));
				dk.setThoiGianBatDau(rs.getString("ThoiGianBatDau"));
				dk.setThoiGianKetThuc(rs.getString("ThoiGianKetThuc"));
				tmp.addElement(dk);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tmp;

	}

	public ArrayList<MonDK> getListDK_Array(int a, int b) throws SQLException, ClassNotFoundException {
		Connection con = (Connection) DBConnection.createConnection();
		ArrayList<MonDK> list = new ArrayList<MonDK>();
		String sql = "SELECT * FROM lichhocsv ORDER BY MaSV ASC Limit ?,? ";
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, a);
			stmt.setInt(2, b);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				MonDK dk = new MonDK();
				dk.setMaSV(rs.getString("MaSV"));
				dk.setMaMon(rs.getString("MaMon"));
				dk.setMaLop(rs.getString("MaLop"));
				dk.setSoTinChi(rs.getInt("SoTinChi"));
				dk.setCa(rs.getInt("Ca"));
				dk.setThu(rs.getInt("Thu"));
				dk.setPhong(rs.getString("Phong"));
				dk.setNgayKTDK(rs.getString("NgayKTDK"));
				dk.setThoiGianBatDau(rs.getString("ThoiGianBatDau"));
				dk.setThoiGianKetThuc(rs.getString("ThoiGianKetThuc"));
				list.add(dk);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			con.close();
		}
		return list;
	}

	public int getCount() throws SQLException, ClassNotFoundException {
		Connection con = (Connection) DBConnection.createConnection();
		ArrayList<User> list = new ArrayList<User>();
		int count = 0;
		try {
			String sql = "SELECT count(*) FROM lichhocsv";
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

	public boolean updateDK() throws UnsupportedEncodingException, SQLException {
		Connection con = (Connection) DBConnection.createConnection();
		
		PreparedStatement preparedStatement = null;
		int check = 0;
		Statement statement = null;
		ResultSet resultSet = null;
		statement = con.createStatement();
		resultSet = statement.executeQuery("select * from lichhocsv");
		while (resultSet.next()) {
			if (resultSet.getString("MaSV") == this.MaSV && resultSet.getString("MaMon") == this.MaMon) {
				check = 1;
				break;
			}
		}
		if (check == 1) {
			try {
				int i = 0;
				
				preparedStatement = con.prepareStatement("update lichhoc set NgayKTDK=? where MaSV=? AND MaMon = ? ");
				preparedStatement.setString(1, this.NgayKTDK);
				preparedStatement.setString(2, this.MaSV);
				preparedStatement.setString(3, this.MaMon);

				i = preparedStatement.executeUpdate();

				if (i != 0) // Just to ensure data has been inserted into the database
					return true;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;

	}
	public int check_String(String chuoi, String key) {
		String[] output = chuoi.split(";");
		for (int i = 0; i<output.length; i++){
			if(output[i].equals(key)) {
				return i;
			}
		}	
		return -1;
	}
	
	public String CapNhatSL(String chuoi, int key) {
		String[] output = chuoi.split(";");
		chuoi ="";
		for (int i = 0; i<output.length; i++){
			if(i==key) {
				if(i==0) {	
					output[i] = String.valueOf(Integer.parseInt(output[i]) + 1);
					chuoi = output[i];
				}else {
					output[i]= String.valueOf(Integer.parseInt(output[i]) + 1);
					chuoi = chuoi + ";" + output[i];
				}							
			}else {
				if(i==0) {
					chuoi = output[i];
				}else {
					chuoi = chuoi + ";" + output[i];
				}
			}
		}			
		return chuoi;
	}
	
	public String XoaMon(String chuoi, int key) {	
		String[] output = chuoi.split(";");
		System.out.println("\noutput ="+ output.length);
		chuoi ="";
		int i =0;		
		for(i=0; i< output.length; i++) {
			if( i == key) {
				if(output.length ==1){
					chuoi = "";					
				}else if(output.length -1 == key) {					
					chuoi = chuoi;
				}else{
					if(chuoi=="") {
						chuoi = output[i+1];
						i=i+1;
					}else {
						chuoi = chuoi + ";"+ output[i+1];
						i=i+1;
					}
				}			
			}else {
					if(chuoi=="") {
						chuoi = output[i];		
					}else {
					chuoi = chuoi +";"+ output[i];				
				}
			}			
		}
		return chuoi;
	}
	

	
}
