<%@ page pageEncoding="utf-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.util.Vector"%>
<%@ page import="Code.User"%>
<%@ page import="Code.RegisterBean"%>
<!DOCTYPE html>
<%
	String tmp = request.getParameter("tmp");
	if (tmp == null) {
		tmp = "Infor_User";
	}
%>
<html>
<head>
<meta charset="utf-8">
<title>ADMIN</title>
<%
	String exUser = null;
	Cookie[] listCookie = request.getCookies();
	for (Cookie cookie : listCookie) {
		if (cookie.getName().equals("exUser")) {
			exUser = cookie.getValue();
			break;
		}
	}
%>
<jsp:useBean id="check" class="Code.RegisterBean"></jsp:useBean>
<%
	Vector CheckList = check.getUserList();
	int x = CheckList.size();
	for (int i = 0; i < x; i++) {
		User usr = (User) CheckList.get(i);
		if (usr.getTaiKhoan() == exUser) {
			String PhanQuyen = usr.getPhanQuyen();
			System.out.print(PhanQuyen);
			if (PhanQuyen != "Admin") {
%>
<jsp:forward page="Login.jsp"></jsp:forward>
<%
	}
		}
	}
%>
<link rel="stylesheet" type="text/css" href="CSS/Admin.css">
<link rel="shortcut icon" type="Image/jpg"
	href="Image/Main_Page/favicon.jpg">
</head>
<body>
<div class="Main">
	<div class="Menu">
		<ul>
			<li><a href="index.jsp">Trang Chủ</a></li>
			<li><a href="Admin.jsp?tmp=ListSchedule">Quản lý Thời Khóa Biểu</a>
			<li><a href="Admin.jsp?tmp=ListStudent">Quản Lý Sinh Viên</a>
				<ul class="sub-menu">
					<li><a href="Admin.jsp?tmp=ListStudent">Danh Sách Sinh Viên</a>
					<li><a href="AddStudent.jsp">Thêm Sinh Viên</a>
				</ul></li>
			<li><a href="Admin.jsp?tmp=ListSubject">Quản Lý Môn Học</a>
				<ul class="sub-menu">
					<li><a href="Admin.jsp?tmp=ListSubject">Danh Sách Môn Học</a>
					<li><a href="AddSubject.jsp">Thêm Môn Học</a>
				</ul></li>
			<li><a href="Admin.jsp?tmp=ListScore">Quản Lý Điểm</a>
			<li><a href="Admin.jsp?tmp=Infor_User">Quản Lý Người Dùng</a>
				<ul class="sub-menu">
					<li><a href="Admin.jsp?tmp=Infor_User">Danh Sách Người Dùng</a>
					<li><a href="Register.jsp">Thêm Tài Khoản</a>
				</ul></li>
		</ul>
	</div>
		<div class="Content">
			<br> Welcome
			<%=exUser%>
			<br>
			<%
				if (tmp.equals("Infor_User") == true) {
			%>
			<%@ include file="Admin/Infor_User.jsp"%>
			<%
				}
			%>
			<%
				if (tmp.equals("ListScore") == true) {
			%>
			<%@ include file="Admin/ListScore.jsp"%>
			<%
				}
			%>

			<%
				if (tmp.equals("ListStudent") == true) {
			%>
			<%@ include file="Admin/ListStudent.jsp"%>
			<%
				}
			%>
			<%
				if (tmp.equals("ListSubject") == true) {
			%>
			<%@ include file="Admin/ListSubject.jsp"%>
			<%
				}
			%>
			<%
				if (tmp.equals("ListSchedule") == true) {
			%>
			<%@ include file="Admin/ListSchedule.jsp"%>
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