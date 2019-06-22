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
							String query = "select * from NguoiDung where TaiKhoan like '" + exUser + "'";
							System.out.println(query);
							resultSet = statement.executeQuery(query);
							while (resultSet.next()) {
				%>

				<table id="Table">
					<tr>
						<th colspan='3' align='center' height="60px"><b><h1>THÔNG
									TIN TÀI KHOẢN</h1></b></th>
					</tr>

					<tr>
						<th>Tài Khoản:</th>
						<td><%=exUser%></td>
					</tr>
					<tr>

						<th>Mật Khẩu:</th>
						<td><%=resultSet.getString("MatKhau")%></td>
					</tr>
					<tr>

						<th>Phân Quyền:</th>
						<td><%=resultSet.getString("PhanQuyen")%></td>
					</tr>
				</table>
				<br> <a href="UpdateAccountStudent.jsp?TaiKhoan=<%=exUser%>"><button
						name="Update" value="Chỉnh sửa">Chỉnh sửa</button></a> <br> <br>

				<%
					break;
							}
							query = "select * from SinhVien where MaSV like '" + exUser + "'";
							System.out.println(query);
							resultSet = statement.executeQuery(query);
				%>
				<table id="Table">
					<tr>
						<th colspan='14' align='center' height="60px"><b><h1>THÔNG
									TIN SINH VIÊN</h1></b></th>
					</tr>
					<tr>
						<th>Mã Sinh Viên</th>
						<th>Họ Tên</th>
						<th>Phái</th>
						<th>Ngày Sinh</th>
						<th>Quê Quán</th>
						<th>CMND</th>
						<th>Số Điện Thoại</th>
						<th>Khoa</th>
						<th>Nghành</th>
						<th>Tình Trạng</th>
						<th>Tín Chỉ Đã Học</th>
						<th>Tín Chỉ Đang Nợ</th>
						<th>Email</th>
						<th>Hình Sinh Viên</th>
					</tr>
					<%
						while (resultSet.next()) {
					%>

					<tr>
						<td><%=resultSet.getString("MaSV")%></td>
						<td><%=resultSet.getString("HoTen")%></td>
						<td><%=resultSet.getString("Phai")%></td>
						<td><%=resultSet.getString("NgaySinh")%></td>
						<td><%=resultSet.getString("QueQuan")%></td>
						<td><%=resultSet.getString("CMND")%></td>
						<td><%=resultSet.getString("SoDienThoai")%></td>
						<td><%=resultSet.getString("Khoa")%></td>
						<td><%=resultSet.getString("Nghanh")%></td>
						<td><%=resultSet.getString("TinhTrang")%></td>
						<td><%=resultSet.getString("TinChiDaHoc")%></td>
						<td><%=resultSet.getString("TinChiDangNo")%></td>
						<td><%=resultSet.getString("Email")%></td>
						<td><img src="Upload/<%=resultSet.getString("HinhSV")%>"></td>
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