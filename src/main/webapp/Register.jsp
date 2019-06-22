<%@ page pageEncoding="utf-8" contentType="text/html;charset= utf-8"%>
<%
	response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset= utf-8" />
<title>Đăng ký</title>
<link rel="stylesheet" type="text/css" href="CSS/create_account.css">
<link rel="shortcut icon" type="Image/jpg"
	href="Image/Main_Page/favicon.jpg">
<script>
	function validate() {
		var TaiKhoan = document.form.TaiKhoan.value;
		var MatKhau = document.form.MatKhau.value;
		var NhapLaiMatKhau = document.form.NhapLaiMatKhau.value;
		var PhanQuyen = document.form.PhanQuyen.value;

		if (TaiKhoan == null || TaiKhoan == "") {
			alert("Tài khoản không được bỏ trống");
			return false;
		} else if (PhanQuyen == null || PhanQuyen == "") {
			alert("Phân quyền không được bỏ trống.");
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
		<a href = "Admin.jsp?tmp=Infor_User"><img src="Image/Admin/back.png" class="avatar"></a>
		<h1>ĐĂNG KÝ</h1>
		<form name="form" action="RegisterServlet" method="post"
			onsubmit="return validate()">
			<div class="textbox-main">
				<p>Tài Khoản:</p>
				<div class="textbox">
					<input type="text" name="TaiKhoan" placeholder="Nhập Tài Khoản">
				</div>
				<br />
				<p>Phân Quyền:</p>
				<div class="textbox">
					<input type="text" name="PhanQuyen" placeholder="Nhập Phân Quyền">
				</div>
				<br />
				<p>Mật Khẩu:</p>
				<div class="textbox">
					<input type="password" name="MatKhau" placeholder="Nhập Mật Khẩu">
				</div>
				<br />
				<p>Nhập Lại Mật Khẩu:</p>
				<div class="textbox">
					<input type="password" name="NhapLaiMatKhau"
						placeholder="Nhập Lại Mật Khẩu">
				</div>
			</div>
			<span> <%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span>
			<br />
			<div class="bottom">
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="submit" value="Đăng Ký">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <input type="reset"
					value="Hủy">
			</div>
		</form>
	</div>
</body>
</html>

