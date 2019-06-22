package Code;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

import Code.User;

public class ManagerAccount {
	User user = new User();
	boolean isLogin = false;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean isIsLogin() {
		return isLogin;
	}

	public void setIsLogin(boolean isLogin) {
		this.isLogin = isLogin;
	}

	public boolean create_user(User user) throws SQLException {
		if (user.save()) {
			return true;
		}
		return false;
	}

	public String getCurrentUserType() {
		if (this.isLogin == true) {
			return this.user.getPhanQuyen();
		}
		return null;
	}

	public boolean login(User user) throws SQLException {
		try {
			if (user.check()) {
				this.user = user;
				this.isLogin = true;
				return true;
			}
			return false;
		} catch (ClassNotFoundException ex) {
			Logger.getLogger(ManagerAccount.class.getName()).log(Level.SEVERE, null, ex);
			return false;
		} catch (SQLException ex) {
			Logger.getLogger(ManagerAccount.class.getName()).log(Level.SEVERE, null, ex);
			return false;
		}
	}

	public Vector getUserList() {
		try {
			Connection con = (Connection) DBConnection.createConnection();
			Statement st = (Statement) con.createStatement();
			String query = "select * from NguoiDung where PhanQuyen  = Student";
			ResultSet rs = st.executeQuery(query);
			Vector tmp = new Vector();
			while (rs.next()) {
				User usr = new User();
				usr.setTaiKhoan(rs.getString("TaiKhoan"));
				usr.setMatKhau(rs.getString("MatKhau"));
				usr.setPhanQuyen(rs.getString("PhanQuyen"));
				tmp.addElement(usr);
			}
			return tmp;
		} catch (SQLException ex) {
			Logger.getLogger(ManagerAccount.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}
}
