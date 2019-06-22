<%@ page pageEncoding="utf-8" contentType="text/html;charset= utf-8"%>
<%
	response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.util.Vector"%>
<%@ page import="Code.User"%>
<%@ page import="Code.LoginBean"%>
<%@ page import="Code.DBConnection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>

<%
	String tmp = request.getParameter("TaiKhoan");
	String tmp2 = null;
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset= utf-8" />
<title>HCMUNRE - Sửa Tài Khoản</title>
<link rel="stylesheet" type="text/css" href="CSS/create_account.css">
<link rel="shortcut icon" type="Image/jpg"
	href="Image/Main_Page/favicon.jpg">
<script>
	function validate() {
		var TaiKhoan = document.form.TaiKhoan.value;
		var MatKhau = document.form.MatKhau.value;
		var NhapLaiMatKhau = document.form.NhapLaiMatKhau.value;
		if (TaiKhoan == null || TaiKhoan == "") {
			alert("Tài khoản không được bỏ trống.");
			return false;
		} else if (MatKhau == null || MatKhau == "") {
			alert("Mật khẩu không được bỏ trống.");
			return false;
		} else if (MatKhau.length < 8) {
			alert("Mật khẩu phải từ 8 ký tự trở lên.");
			return false;
		} else if (MatKhau != NhapLaiMatKhau) {
			alert("Hai mật khẩu không giống nhau.");
			return false;
		} else
			return true;
	}
</script>
</head>
<body>
	<div class="login-box">
		<jsp:useBean id="info" class="Code.RegisterBean"></jsp:useBean>
		<%
			Vector UserList = info.getUserList();
			int n = UserList.size();
		%>

		<%
			for (int i = 0; i < n; i++) {
				User usr = (User) UserList.get(i);

				if (usr.getTaiKhoan().equals(tmp) == true) {
		%>
		<a href = "Admin.jsp?tmp=Infor_User"><img src="Image/Admin/back.png" class="avatar"></a>
		<h1>SỬA TÀi KHOẢN</h1>
		<form name="form" action="Update_AccountServlet" method="post"
			onsubmit="return validate()">
			<div class="textbox-main">
					<p>Tài Khoản:</p>
					<div class="textbox">
						<input type="text" name="TaiKhoan" placeholder="Nhập Tài Khoản"
							value="<%=usr.getTaiKhoan()%>" readonly>
					</div>
					<p>Mật Khẩu:</p>
					<div class="textbox">
						<input type="text" name="MatKhau"
							placeholder="Nhập Mật Khẩu Mới" value="<%=usr.getMatKhau()%>">
					</div>
					<p>Phân Quyền:</p>
					<div class="textbox">
						<input type="text" name="PhanQuyen" placeholder="Nhập Phân Quyền"
							value="<%=usr.getPhanQuyen()%>">
					</div>
			</div>
			<span> <%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span>
			<br />
			<div class="bottom">
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="submit" value="Sửa">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <input type="reset"
					value="Hủy">
			</div>
		</form>
		<%
			}
			}
		%>
	</div>
</body>
</html>

