<%@ page pageEncoding="utf-8"%>
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

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet type="text/css"
	href="<%=request.getContextPath()%>/CSS/Student.css">
<link rel="shortcut icon" type="Image/jpg"
	href="Image/Main_Page/favicon.jpg">
<title></title>
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
<%
	if (exUser == null) {
%>

<jsp:forward page="Login.jsp"></jsp:forward>
<%
	} else {
		FindUser find = new FindUser();
		String PhanQuyen = find.findType(exUser);
		if (PhanQuyen.equals("Student")) {
%>
</head>
<body>
				<br> Welcome
				<%=exUser%>
				<br>
				<%
					String check = null;
							Connection con = null;
							con = DBConnection.createConnection();
							Statement statement = null;
							ResultSet resultSet = null;
							con = DBConnection.createConnection();
							statement = con.createStatement();
							String query = "select * from LichHocSV where MaSV like '" + exUser + "'";
							System.out.println(query);
							resultSet = statement.executeQuery(query);
				%>

				<table id="Table">
					<tr>
						<th colspan='14' align='center' height="60px"><b><h1>LỊCH HỌC SINH VIÊN</h1></b></th>
					</tr>
					<tr>
						<th>Mã Sinh Viên</th>
						<th>Mã Môn</th>
						<th>Mã Lớp</th>
						<th>Số Tín Chỉ</th>
						<th>Ca</th>
						<th>Thứ</th>
						<th>Phòng</th>
						<th>Thời Gian Bắt Đầu</th>
						<th>Thời Gian Kết Thúc</th>
					</tr>
					<%
						while (resultSet.next()) {
					%>

					<tr>
						<td><%=resultSet.getString("MaSV")%></td>
						<td><%=resultSet.getString("MaMon")%></td>
						<td><%=resultSet.getString("MaLop")%></td>
						<td><%=resultSet.getInt("SoTinChi")%></td>
						<td><%=resultSet.getInt("Ca")%></td>
						<td><%=resultSet.getInt("Thu")%></td>
						<td><%=resultSet.getString("Phong")%></td>
						<td><%=resultSet.getString("ThoGianBatDau")%></td>
						<td><%=resultSet.getString("ThoiGianKetThuc")%></td>
					</tr>
					<%
						break;
								}
					%>
				</table>

				<br> <br> <a
					href="<%=request.getContextPath()%>/index.jsp"><button
						name="Index" value="Trang chủ">Trang chủ</button></a>
	<%
		} else {
	%>
	<jsp:forward page="index.jsp"></jsp:forward>

	<%
		}
		}
	%>
</body>
</html>