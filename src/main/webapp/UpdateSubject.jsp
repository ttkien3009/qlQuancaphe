<%@ page pageEncoding="utf-8" contentType="text/html;charset= utf-8"%>
<%
	response.setContentType("text/html;charset=UTF-8");
%>
<%@ page import="java.util.Vector"%>
<%@ page import="Code.Subject"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="Code.DBConnection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>


<!DOCTYPE html>
<%
	String tmp = request.getParameter("MaMon");
	String tmp2 = null;
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset= utf-8" />
<link rel=stylesheet type="text/css"
	href="<%=request.getContextPath()%>/CSS/AddStudent.css">
<link rel="shortcut icon" type="Image/jpg"
	href="Image/Main_Page/favicon.jpg">
<title>Chỉnh sửa thông tin môn học</title>
<script language=javascript>
	function validateform() {
		var isChecked = false;
		upload = document.upload;
		if (formObj.MaLop.value == "") {
			alert("Vui lòng nhập mã lớp");
			return false;
		} else if (formObj.MaMon.value == "") {
			alert("Vui lòng nhập mã môn học");
			return false;
		}else if (formObj.TenMon.value == "") {
			alert("Vui lòng nhập tên môn học");
			return false;
		} else if (formObj.SoTinChi.value == "") {
			alert("Vui lòng nhập số tín chỉ của môn học");
			return false;
		} else if (formObj.GiangVien.value == "") {
			alert("Vui lòng nhập giảng viên của môn học");
			return false;
		} else if (formObj.Ca.value == "") {
			alert("Vui lòng nhập ca");
			return false;
		} else if (formObj.Thu.value == "") {
			alert("Vui lòng nhập thứ");
			return false;
		} else if (formObj.Phong.value == "") {
			alert("Vui lòng nhập phòng");
			return false;
		}else if (formObj.ThoiGianBatDau.value == "") {
			alert("Vui lòng nhập thời gian bắt đầu của môn học");
			return false;
		} else if (formObj.ThoiGianKetThuc.value == "") {
			alert("Vui lòng nhập thời gian kết thức của môn học");
			return false;
		} else
			return true;
	}

</script>
</head>
<body>
	<jsp:useBean id="subj" class="Code.Subject"></jsp:useBean>

	<%
		Vector DSSubject = subj.getListSubject();
		int m = DSSubject.size();
	%>

	<%
		for (int i = 0; i < m; i++) {
			Subject subject = (Subject) DSSubject.get(i);
			if (subject.getMaMon().equals(tmp)) {
	%>

	<div class="AddStd">
		<a href = "Admin.jsp?tmp=ListSubject"><img src="Image/Admin/back.png" class="avatar"></a>
		<h1>SỬA THÔNG TIN MÔN HỌC</h1>
		<form name="upload"
			action="<%=request.getContextPath()%>/UpdateSubjectServlet"
			method="post" enctype='multipart/form-data'
			onsubmit="return validateform()">
			<div class="textbox-main">
				<div class="login-box-left">
					<p>Mã Lớp:</p>
					<div class="textbox">
						<input type="text" name="MaLop" value="<%=subject.getMaLop()%>">
					</div>
					<br>
					<p>Mã Môn:</p>
					<div class="textbox">
						<input type="text" name="MaMon" value="<%=subject.getMaMon()%>">
					</div>
					<br>
					<p>Tên Môn:</p>
					<div class="textbox">
						<input type="text" name="TenMon" value="<%=subject.getTenMon()%>">
					</div>
					<p>Số Tín Chỉ:</p>
					<div class="textbox">
						<select name="SoTinChi">
							<option value="<%=subject.getSoTinChi()%>" selected="selected"><%=subject.getSoTinChi()%></option>
							<option value=2>2</option>
							<option value=3>3</option>
						</select>
					</div>
					<br />
					<p>Giảng Viên:</p>
					<div class="textbox">
						<input type="text" name="GiangVien"
							value="<%=subject.getGiangVien()%>">
					</div>
					
				</div>
				<div class="login-box-right">
					<p>Ca:</p>
					<div class="textbox">
						<select name="Ca">
							<option value="<%=subject.getCa()%>" selected="selected"><%=subject.getCa()%></option>
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
							<option value="<%=subject.getThu()%>" selected="selected"><%=subject.getThu()%></option>
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
						<input type="text" name="Phong"
							value="<%=subject.getPhong()%>">
					</div>
					<br>
					<p>Thời Gian Bắt Đầu:</p>
					<div class="textbox">
						<input type="text" name="ThoiGianBatDau"
							placeholder="Nhập Thời Gian Bắt Đâu  (ví dụ: 2019-02-20)" value="<%=subject.getThoiGianBatDau()%>">
					</div>
					<br />
					<p>Thời Gian Kết Thúc:</p>
					<div class="textbox">
						<input type="text" name="ThoiGianKetThuc"
							placeholder="Nhập Thời Gian Kết Thúc (ví dụ: 2019-02-20)" value="<%=subject.getThoiGianKetThuc()%>">
					</div>
				</div>
			</div>
			<br> <br><br><br><br><br>
			<div class="bottom">
			<div class = "btn">
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input
					type="submit" value="Sửa">&emsp;&emsp;&emsp;&emsp;
			&emsp;&emsp;&emsp;&emsp; <input type="reset" value="Nhập lại"></div>
			</div>
			<br>
		</form>
		<%
			}
			}
		%>
	</div>
</body>
</html>