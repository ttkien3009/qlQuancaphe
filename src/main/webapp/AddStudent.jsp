<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>THÊM SINH VIÊN</title>
<link rel="stylesheet" type="text/css" href="CSS/AddStudent.css">
<link rel="shortcut icon" type="Image/jpg"
	href="Image/Main_Page/favicon.jpg">
<script language=javascript>
	function validateform() {
		var isChecked = false;
		add = document.AddStd;
		if (add.MaSV.value == "") {
			alert("Vui lòng nhập mã sinh viên");
			return false;
		} else if (add.HoTen.value == "") {
			alert("Vui lòng nhập họ tên sinh viên");
			return false;
		} else if (add.Phai.value == "") {
			alert("Vui lòng nhập giới tính");
			return false;
		} else if (add.NgaySinh.value == "") {
			alert("Vui lòng nhập ngày sinh");
			return false;
		} else if (add.QueQuan.value == "") {
			alert("Vui lòng nhập quê quán");
			return false;
		} else if (add.CMND.value == "") {
			alert("Vui lòng nhập số chứng minh nhân dân");
			return false;
		} else if (add.SoDienThoai.value == "") {
			alert("Vui lòng nhập số điện thoại");
			return false;
		} else if (add.Khoa.value == "") {
			alert("Vui lòng nhập khoa học");
			return false;
		} else if (add.Nghanh.value == "") {
			alert("Vui lòng nhập nghành học");
			return false;
		} else if (add.TinhTrang.value == "") {
			alert("Vui lòng nhập tình trạng");
			return false;
		} else if (add.TinChiDaHoc.value == "") {
			alert("Vui lòng nhập tín chỉ đã học");
			return false;
		} else if (add.TinChiDangNo.value == "") {
			alert("Vui lòng nhập tín chỉ đang nợ");
			return false;
		} else if (add.Email.value == "") {
			alert("Vui lòng nhập hạnh kiểm");
			return false;
		} else if (add.HinhSV.value == "") {
			alert("Vui lòng nhập hình ảnh");
			return false;
		} else
			return true;
	}
</script>
</head>
<body>
	<div class="AddStd">
		<a href = "Admin.jsp?tmp=ListStudent"><img src="Image/Admin/back.png" class="avatar"></a>
		<h1>THÊM SINH VIÊN</h1>
		<form name="AddStd" action="AddStudentServlet" method="post"
			enctype='multipart/form-data' onsubmit="return validateform()">
			<div class="textbox-main">
				<div class="login-box-left">
					<p>Mã Sinh Viên:</p>
					<div class="textbox">
						<input type="text" name="MaSV" placeholder="Nhập Mã Số Sinh Viên">
					</div>
					<br>
					<p>Họ và Tên:</p>
					<div class="textbox">
						<input type="text" name="HoTen" placeholder="Nhập Họ Tên">
					</div>
					<br> <strong>Giới Tính:</strong>
					&emsp;&emsp;&emsp; <input type="radio" value="Nam"
						name="Phai">Nam
					&emsp;&emsp;&emsp;&emsp; <input
						type="radio" value="Nữ" name="Phai">Nữ <br> <br>
					<br><br><br>
					<p>Ngày Sinh:</p>
					<div class="textbox">
						<input type="text" name="NgaySinh"
							placeholder="Nhập Ngày Sinh  (Ví dụ:1998-09-30)">
					</div>
					<br />
					<p>Quê Quán:</p>
					<div class="textbox">
						<input type="text" name="QueQuan"
							placeholder="Nhập Quê Quán">
					</div>
					<br />
					<p>Chứng Minh Nhân Dân:</p>
					<div class="textbox">
						<input type="text" name="CMND" placeholder="Nhập Số CMND">
					</div>
					<br />
					<p>Số Điện Thoại:</p>
					<div class="textbox">
						<input type="text" name="SoDienThoai"
							placeholder="Nhập Số Điện Thoại">
					</div>
				</div>
				<div class="login-box-right">
					<p>Khoa:</p>
					<div class="textbox">
						<input type="text" name="Khoa" placeholder="Nhập Khoa">
					</div>
					<br />
					<p>Nghành:</p>
					<div class="textbox">
						<input type="text" name="Nghanh" placeholder="Nhập Nghành Học">
					</div>
					<br />
					<p>Tình Trạng:</p>
					<div class = "textbox">
					<select name = "TinhTrang">
						<option value="Đang Học">Đang Học</option>
						<option value="Đã Nghỉ">Đã Nghỉ</option>
						<option value="Đã Tốt Nghiệp">Đã Tốt Nghiệp</option>
						<option value="Bị Thôi Học">Bị Thôi Học</option>
						<option value="Cảnh Cáo Mức 1">Cảnh Cáo Mức 1</option>
						<option value="Cảnh Cáo Mức 2">Cảnh Cáo Mức 2</option>
					</select></div> <br />
					<p>Tín Chỉ Đã Học:</p>
					<div class="textbox">
						<input type="text" name="TinChiDaHoc"
							placeholder="Nhập Tín Chỉ Đã Học">
					</div>
					<br />
					<p>Tín Chỉ Đang Nợ:</p>
					<div class="textbox">
						<input type="text" name="TinChiDangNo"
							placeholder="Nhập Tín Chỉ Đang Nợ">
					</div>
					<br>
					<p>Email:</p>
					<div class="textbox">
						<input type="text" name="Email"
							placeholder="Nhập Email">
					</div>
					<br>
					<p>Hình ảnh sinh viên:</p>
					<div class="textbox">
					<input type="file" name="picture" size="50" />
					</div>
				</div>
			</div>
			<br> <br>
			<div class = "bottom">
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="submit" value="Thêm"> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			 <input type="reset" value="Nhập lại"></div><br>
		</form>
	</div>
</body>
</html>