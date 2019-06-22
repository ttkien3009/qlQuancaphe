<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>THÊM MÔN HỌC</title>
<link rel="stylesheet" type="text/css" href="CSS/AddStudent.css">
<link rel="shortcut icon" type="Image/jpg"
	href="Image/Main_Page/favicon.jpg">
<script language=javascript>
	function validateform() {
		var isChecked = false;
		add = document.AddSubject;
		if (add.MaLop.value == "") {
			alert("Vui lòng nhập mã lớp");
			return false;
		} else if (add.MaMon.value == "") {
			alert("Vui lòng nhập mã môn");
			return false;
		}else if (add.TenMon.value == "") {
			alert("Vui lòng nhập tên môn");
			return false;
		} else if (add.SoTinChi.value == "") {
			alert("Vui lòng nhập số tín chỉ");
			return false;
		} else if (add.GiangVien.value == "") {
			alert("Vui lòng nhập giảng viên");
			return false;
		} else if (add.Ca.value == "") {
			alert("Vui lòng nhập ca");
			return false;
		} else if (add.Thu.value == "") {
			alert("Vui lòng nhập thứ");
			return false;
		} else if (add.Phong.value == "") {
			alert("Vui lòng nhập phòng");
			return false;
		} else if (add.ThoiGianBatDau.value == "") {
			alert("Vui lòng nhập thời gian bắt đầu");
			return false;
		} else if (add.ThoiGianKetThuc.value == "") {
			alert("Vui lòng nhập thời gian kết thúc");
			return false;
		} else
			return true;
	}
</script>
</head>
<body>
	<div class="AddStd">
		<a href="Admin.jsp?tmp=ListSubject"><img
			src="Image/Admin/back.png" class="avatar"></a>
		<h1>THÊM MÔN HỌC</h1>
		<form name="AddSubject" action="AddSubjectServlet" method="post"
			enctype='multipart/form-data' onsubmit="return validateform()">
			<div class="textbox-main">
				<div class="login-box-left">
					<p>Mã Lớp:</p>
					<div class="textbox">
						<input type="text" name="MaLop" placeholder="Nhập Mã Lớp">
					</div>
					<br>
					<p>Mã Môn:</p>
					<div class="textbox">
						<input type="text" name="MaMon" placeholder="Nhập Mã Môn">
					</div>
					<br>
					<p>Tên Môn:</p>
					<div class="textbox">
						<input type="text" name="TenMon" placeholder="Nhập Tên Môn">
					</div>
					<p>Số Tín Chỉ:</p>
					<div class="textbox">
						<select name="SoTinChi">
							<option value=2>2</option>
							<option value=3>3</option>
						</select>
					</div>
					<br />
					<p>Giảng Viên:</p>
					<div class="textbox">
						<input type="text" name="GiangVien" placeholder="Nhập Giảng Viên">
					</div>
					
				</div>
				<div class="login-box-right">
					<p>Ca:</p>
					<div class="textbox">
						<select name="Ca">
							<option value=1>1</option>
							<option value=2>2</option>
							<option value=3>3</option>
							<option value=4>4</option>
						</select>
					</div>
					<br>
					<p>Thứ:</p>
					<div class="textbox">
						<select name="Thu">
							<option value=2>2</option>
							<option value=3>3</option>
							<option value=4>4</option>
							<option value=5>5</option>
							<option value=6>6</option>
							<option value=7>7</option>
						</select>
					</div>
					<p>Phòng:</p>
					<div class="textbox">
						<input type="text" name="Phong" placeholder="Nhập Phòng">
					</div>
					<br>
					<p>Thời Gian Bắt Đầu:</p>
					<div class="textbox">
						<input type="text" name="ThoiGianBatDau"
							placeholder="Nhập Thời Gian Bắt Đâu  (ví dụ: 2019-02-20)">
					</div>
					<br />
					<p>Thời Gian Kết Thúc:</p>
					<div class="textbox">
						<input type="text" name="ThoiGianKetThuc"
							placeholder="Nhập Thời Gian Kết Thúc (ví dụ: 2019-02-20)">
					</div>
				</div>
			</div>
			<br> <br><br><br><br><br>
			<div class="bottom">
			<div class = "btn">
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input
					type="submit" value="Thêm">&emsp;&emsp;&emsp;&emsp;
			&emsp;&emsp;&emsp;&emsp; <input type="reset" value="Nhập lại"></div>
			</div>
			<br>
		</form>
	</div>
</body>
</html>