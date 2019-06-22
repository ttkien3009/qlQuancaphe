<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.util.Vector"%>
<%@ page import="Code.User"%>
<%@ page import="Code.RegisterBean"%>
<%@ page import="Code.FindUser"%>
<%@ page import="Code.DBConnection"%>

<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>

<%
	String tmp = request.getParameter("tmp");
	if (tmp == null) {
		tmp = "Infor_Student";
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet type="text/css"
	href="<%=request.getContextPath()%>/CSS/Student.css">
<link rel="shortcut icon" type="Image/jpg"
	href="Image/Main_Page/favicon.jpg">
<title>SINH VIÊN</title>
</head>
<body>
	<div class="Main">
		<div class="Menu">
			<ul>
				<li><a href="index.jsp">Trang Chủ</a></li>
				<li><a href="Student.jsp?tmp=Infor_Student">Thông Tin Sinh
						Viên</a>
				<li><a href="Student.jsp?tmp=Schedule">Lịch Học</a>
				<li><a href="Student.jsp?tmp=addcart">Môn Đã Chọn</a>
				<li><a href="XacNhanDangKy.jsp">Xác Nhận Đăng Ký Môn</a>
				<li><a href="Student.jsp?tmp=Core">Điểm</a>
			</ul>
		</div>
		<div class="Content">
			<%
				if (tmp.equals("Infor_Student") == true) {
			%>
			<%@ include file="Student/Infor_Student.jsp"%>
			<%
				}
			%>
			<%
				if (tmp.equals("addcart") == true) {
			%>
			<%@ include file="Student/AddCart.jsp"%>
			<%
				}
			%>
			<%
				if (tmp.equals("Schedule") == true) {
			%>
			<%@ include file="Student/Schedule_ST.jsp"%>
			<%
				}
			%>
			<%
				if (tmp.equals("Core") == true) {
			%>
			<%@ include file="Student/Core.jsp"%>
			<%
				}
			%>
			<br> <br> <a
				href="<%=request.getContextPath()%>/LogoutServlet"><button
					name="Logout" value="Logout">Logout</button></a>
		</div>

	</div>
</body>
</html>