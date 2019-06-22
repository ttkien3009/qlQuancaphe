package Code;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class RegisterBean {
	private String MatKhau;
	private String TaiKhoan;
	private String PhanQuyen;
	
	public String getMatKhau() {
		return MatKhau;
	}
	
	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}

	public String getTaiKhoan() {
		return TaiKhoan;
	}

	public void setTaiKhoan(String taiKhoan) {
		TaiKhoan = taiKhoan;
	}

	public String getPhanQuyen() {
		return PhanQuyen;
	}

	public void setPhanQuyen(String phanQuyen) {
		PhanQuyen = phanQuyen;
	}

	public Vector getUserList(){
        try{
            Connection con = (Connection) DBConnection.createConnection();
            Statement st = (Statement)con.createStatement();
            String query = "select * from NguoiDung";
            ResultSet rs = st.executeQuery(query);
            Vector tmp = new Vector();
            while(rs.next()){
                User usr=new User();  
                usr.setMatKhau(rs.getString("MatKhau"));
                usr.setTaiKhoan(rs.getString("TaiKhoan"));
                usr.setPhanQuyen(rs.getString("PhanQuyen"));
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
