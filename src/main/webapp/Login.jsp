<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>HCMUNRE - Đăng nhập</title>
<link rel="stylesheet" type="text/css" href="CSS/Login.css">
<link rel="shortcut icon" type="Image/jpg" href="Image/Main_Page/favicon.jpg">
<script>
	function validate() {
		var mssv = document.form.mssv.value;
		var password = document.form.password.value;

		if (mssv == null || mssv == "") {
			alert("Mã số sinh viên không được bỏ trống.");
			return false;
		} else if (password == null || password == "") {
			alert("Mật khẩu không được bỏ trống.")
			return false;
		}
		else 
			return true;
	}
</script>
</head>
<body>
	<div class="login-box">
		<img src="Image/Login/avatar.png" class="avatar">
		<h1>ĐĂNG NHẬP</h1>
		<form name="form" action="LoginServlet" method="post"
			onsubmit="return validate()">
			<p>Tài Khoản</p>
			<div class="textbox">
				<input type="text" name="TaiKhoan" placeholder="Nhập Tài Khoản">
			</div>
			<br />
			<p>Mật khẩu</p>
			<div class="textbox">
				<input type="password" name="MatKhau" placeholder="Nhập Mật Khẩu">
			</div>
			<span> <%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span>
			<div class="bottom">
				<input type="submit" value="Login"> 
				<input type="reset" value="Cancel">
			</div>
			<br /> <a href="#">Quên mật khẩu?</a>
			<br /> <a href="index.jsp">Về trang chủ?</a>
		</form>
	</div>
</body>
</html>