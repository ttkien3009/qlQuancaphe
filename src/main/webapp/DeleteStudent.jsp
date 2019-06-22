<%@ page pageEncoding="utf-8" contentType="text/html;charset= utf-8"%>
<%
	response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.util.Vector"%>
<%@ page import="Code.Student"%>
<%@ page import="Code.LoginBean"%>
<%@ page import="Code.DBConnection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>

<%
	String tmp = request.getParameter("MaSV");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset= utf-8" />
<title>HCMUNRE - Xóa Sinh Viên</title>
<link rel="stylesheet" type="text/css" href="CSS/Delete.css">
<link rel="shortcut icon" type="Image/jpg"
	href="Image/Main_Page/favicon.jpg">

</head>
<body>
	<div class="login-box">
		<h1>XÓA SINH VIÊN</h1>
		<form name="form" method="post" action="DeleteStudentServlet">
			<p>Nhập mã sinh viên cần xóa:</p>
			<div class="textbox">
				<input type="text" name="MaSV" value="<%=tmp%>">
			</div>
			<p>Xác nhận xóa sinh viên này?</p>
			<%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%>
			<br> &emsp;&emsp;&emsp;&emsp;
			<div class="bottom">
				<input type="submit" value="Xác Nhận">
				&emsp;&emsp;&emsp;&emsp; &emsp;&emsp;&emsp;&emsp; <input
					type="reset" value="Hủy">
			</div>
			<br>
		</form>

		<br> <br> <a
			href="<%=request.getContextPath()%>/LogoutServlet"><button
				name="Logout" value="Logout">Logout</button></a>&emsp;&emsp;&emsp;&emsp;
		&emsp;&emsp;&emsp;&emsp; &emsp;&emsp;&emsp;&emsp;
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		&emsp;&emsp;&emsp;&emsp; &emsp;&emsp;&emsp;&emsp;
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		&emsp;&emsp;&emsp;&emsp; &emsp;&emsp;&emsp;&emsp;
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a href="Admin.jsp?tmp=ListStudent"><button
				name="Exit" value="Exit">Exit</button></a>

	</div>
</body>
</html>

