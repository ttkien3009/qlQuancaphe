<%@ page pageEncoding="utf-8" contentType="text/html;charset= utf-8"%>
<%
	response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.util.Vector"%>
<%@ page import="Code.Score"%>
<%@ page import="Code.LoginBean"%>
<%@ page import="Code.DBConnection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>

<%
	String tmp = request.getParameter("MaSV");
	String tmp1 = request.getParameter("MaMon");
	String tmp2 = null;
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset= utf-8" />
<title>Nhập Điểm</title>
<link rel="stylesheet" type="text/css" href="CSS/create_account.css">
<link rel="shortcut icon" type="Image/jpg"
	href="Image/Main_Page/favicon.jpg">
<script>
	function validate() {
		var Diem = document.form.Diem.value;
		if (Diem == null || Diem == "") {
			alert("Vui lòng nhập điểm.");
			return false;
		} else
			return true;
	}
</script>
</head>
<body>
	<div class="login-box">
		<jsp:useBean id="info" class="Code.Score"></jsp:useBean>
		<%
			Vector ScoreList = info.getScoreList();
			int n = ScoreList.size();
		%>

		<%
			for (int i = 0; i < n; i++) {
				Score sc = (Score) ScoreList.get(i);

				if (sc.getMaSV().equals(tmp) == true && sc.getMaMon().equals(tmp1) == true) {
		%>
		<a href = "Admin.jsp?tmp=ListScore"><img src="Image/Admin/back.png" class="avatar"></a>
		<h1>NHẬP ĐIỂM</h1>
		<form name="upload"
			action="<%=request.getContextPath()%>/UpdateScoreServlet"
			method="post" enctype='multipart/form-data'
			onsubmit="return validateform()">
			<div class="textbox-main">
					<p>Mã Sinh Viên:</p>
					<div class="textbox">
						<input type="text" name="MaSV" 
							value="<%=sc.getMaSV()%>" readonly>
					</div>
					<p>Mã Môn:</p>
					<div class="textbox">
						<input type="text" name="MaMon"
							 value="<%=sc.getMaMon()%>" readonly>
					</div>
					<p>Mã Lớp:</p>
					<div class="textbox">
						<input type="text" name="MaLop" 
							value="<%=sc.getMaLop()%>" readonly>
					</div>
					<p>Điểm:</p>
					<div class="textbox">
						<input type="text" name="Diem" 
							value="<%=sc.getDiem()%>" >
					</div>
			</div>
			<span> <%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span>
			<br />
			<div class="bottom">
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="submit" value="Nhập">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <input type="reset"
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

