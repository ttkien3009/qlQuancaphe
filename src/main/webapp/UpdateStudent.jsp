<%@ page pageEncoding="utf-8" contentType="text/html;charset= utf-8"%>
<%
	response.setContentType("text/html;charset=UTF-8");
%>
<%@ page import="java.util.Vector"%>
<%@ page import="Code.Student"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="Code.DBConnection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>


<!DOCTYPE html>
<%
	String tmp = request.getParameter("MaSV");
	String tmp2 = null;
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset= utf-8" />
<link rel=stylesheet type="text/css"
	href="<%=request.getContextPath()%>/CSS/AddStudent.css">
<link rel="shortcut icon" type="Image/jpg"
	href="Image/Main_Page/favicon.jpg">
<title>Chỉnh sửa thông tin sinh viên</title>
<script language=javascript>
	function validateform() {
		var isChecked = false;
		upload = document.upload;
		if (formObj.HoTen.value == "") {
			alert("Vui lòng nhập tên sinh viên");
			return false;
		} else if (formObj.Phai.value == "") {
			alert("Vui lòng nhập giới tính sinh viên");
			return false;
		} else if (formObj.NgaySinh.value == "") {
			alert("Vui lòng nhập ngày sinh của sinh viên");
			return false;
		} else if (formObj.QueQuan.value == "") {
			alert("Vui lòng nhập quên quán của sinh viên");
			return false;
		} else if (formObj.CMND.value == "") {
			alert("Vui lòng nhập số CMND của sinh viên");
			return false;
		} else if (formObj.SoDienThoai.value == "") {
			alert("Vui lòng nhập số điện thoại của sinh viên");
			return false;
		} else if (formObj.Khoa.value == "") {
			alert("Vui lòng nhập khoa của sinh viên");
			return false;
		} else if (formObj.Nghanh.value == "") {
			alert("Vui lòng nhập nghành của sinh viên");
			return false;
		} else if (formObj.TinhTrang.value == "") {
			alert("Vui lòng nhập tình trạng của sinh viên");
			return false;
		} else if (formObj.TinChiDaHoc.value == "") {
			alert("Vui lòng nhập tín chỉ đã học của sinh viên");
			return false;
		} else if (formObj.TinChiDangNo.value == "") {
			alert("Vui lòng nhập tín chỉ đang nợ của sinh viên");
			return false;
		} else if (formObj.Email.value == "") {
			alert("Vui lòng nhập Email của sinh viên");
			return false;
		} else if (formObj.HinhSV.value == "") {
			alert("Vui lòng nhập hình của sinh viên");
			return false;
		} else
			return true;
	}

</script>
</head>
<body>
	<jsp:useBean id="std" class="Code.Student"></jsp:useBean>

	<%
		Vector DSStudent = std.getListSV();
		int m = DSStudent.size();
	%>

	<%
		for (int i = 0; i < m; i++) {
			Student stud = (Student) DSStudent.get(i);
			if (stud.getMaSV().equals(tmp)) {
	%>

	<div class="AddStd">
		<a href = "Admin.jsp?tmp=ListStudent"><img src="Image/Admin/back.png" class="avatar"></a>
		<h1>SỬA THÔNG TIN SINH VIÊN</h1>
		<form name="upload"
			action="<%=request.getContextPath()%>/UpdateStudentServlet"
			method="post" enctype='multipart/form-data'
			onsubmit="return validateform()">
			<div class="textbox-main">
				<div class="login-box-left">
					<p>Mã Sinh Viên:</p>
					<div class="textbox">
						<input type="text" name="MaSV" value="<%=stud.getMaSV()%>"
							readonly>
					</div>
					<br>
					<p>Họ và Tên:</p>
					<div class="textbox">
						<input type="text" name="HoTen" value="<%=stud.getHoTen()%>">
					</div>
					<br> <strong>Giới Tính:</strong>
					<p>
						<%
							if (stud.getPhai().equals("Nam")) {
						%>
						&emsp;&emsp;&emsp;&emsp;&emsp;<input type="radio" name="gender"
							value="Nam" checked> Nam
						&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <input type="radio"
							name="gender" value="Nữ"> Nữ <br>
						<%
							} else {
						%>
						&emsp;&emsp;&emsp;&emsp;&emsp;<input type="radio" name="gender"
							value="Nam"> Nam &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <input
							type="radio" name="gender" value="Nữ" checked> Nữ <br>
						<%
							}
						%>
					</p>
					<br> <br> <br />
					<p>Ngày Sinh:</p>
					<div class="textbox">
						<input type="text" name="NgaySinh" value="<%=stud.getNgaySinh()%>">
					</div>
					<br />
					<p>Quê Quán:</p>
					<div class="textbox">
						<input type="text" name="QueQuan" value="<%=stud.getQueQuan()%>">
					</div>
					<br />
					<p>Chứng Minh Nhân Dân:</p>
					<div class="textbox">
						<input type="text" name="CMND" value="<%=stud.getCMND()%>">
					</div>
					<br />
					<p>Số Điện Thoại:</p>
					<div class="textbox">
						<input type="text" name="SoDienThoai"
							value="<%=stud.getSoDienThoai()%>">
					</div>
				</div>
				<div class="login-box-right">
					<p>Khoa:</p>
					<div class="textbox">
						<input type="text" name="Khoa" value="<%=stud.getKhoa()%>">
					</div>
					<br />
					<p>Nghành:</p>
					<div class="textbox">
						<input type="text" name="Nghanh" value="<%=stud.getNghanh()%>">
					</div>
					<br />
					<p>Tình Trạng:</p>
					<div class="textbox">
						<select name="TinhTrang">
							<option value="<%=stud.getTinhTrang()%>" selected="selected"><%=stud.getTinhTrang()%></option>
							<option value="Đang Học">Đang Học</option>
							<option value="Đã Nghỉ">Đã Nghỉ</option>
							<option value="Đã Tốt Nghiệp">Đã Tốt Nghiệp</option>
							<option value="Bị Thôi Học">Bị Thôi Học</option>
							<option value="Cảnh Cáo Mức 1">Cảnh Cáo Mức 1</option>
							<option value="Cảnh Cáo Mức 2">Cảnh Cáo Mức 2</option>
						</select>
					</div>
					<br />
					<p>Tín Chỉ Đã Học:</p>
					<div class="textbox">
						<input type="text" name="TinChiDaHoc"
							value="<%=stud.getTinChiDaHoc()%>">
					</div>
					<br />
					<p>Tín Chỉ Đang Nợ:</p>
					<div class="textbox">
						<input type="text" name="TinChiDangNo"
							value="<%=stud.getTinChiDangNo()%>">
					</div>
					<br>
					<p>Email:</p>
					<div class="textbox">
						<input type="text" name="Email"
							value="<%=stud.getEmail()%>">
					</div>
					<br>
					<div class="textbox">
					<p>Hình ảnh sinh viên:</p>
					<input type="file" name="HinhSV" size="50"
						value="<%=stud.getHinhSV()%>">
						</div>
				</div>
			</div>
			<br> <br>
			<div class = "bottom">
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="submit" value="Sửa"> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			 <input type="reset" value="Nhập lại"></div>
			<br>
		</form>
		<%
			}
			}
		%>
	</div>
</body>
</html>