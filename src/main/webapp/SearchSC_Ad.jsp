<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.util.Vector"%>
<%@ page import="Code.Student"%>
<%@ page import="Code.DBConnection"%>

<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="Image/jpg"
	href="Image/Main_Page/favicon.jpg">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/CSS/Admin.css">

<title>Tìm kiếm người dùng</title>
</head>
<body>
<body>
	<div class="Main">
		<div class="Menu">
			<ul>
				<li><a href="index.jsp">Trang Chủ</a></li>
				<li><a href="Admin.jsp?tmp=ListSchedule">Quản lý Thời Khóa
						Biểu</a>
				<li><a href="Admin.jsp?tmp=ListStudent">Quản Lý Sinh Viên</a>
					<ul class="sub-menu">
						<li><a href="Admin.jsp?tmp=ListStudent">Danh Sách Sinh
								Viên</a>
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
						<li><a href="Admin.jsp?tmp=Infor_User">Danh Sách Người
								Dùng</a>
						<li><a href="Register.jsp">Thêm Tài Khoản</a>
					</ul></li>
			</ul>
		</div>
		<div class="Content">

			<table id="Table">
				<tr>
					<th colspan='17' align='center' height=60px><b><h1>DANH
								SÁCH ĐIỂM SINH VIÊN</h1></b></th>
				</tr>
				<tr>
					<th>STT</th>
					<th>Mã Sinh Viên</th>
					<th>Mã Môn</th>
					<th>Mã Lớp</th>
					<th>Điểm</th>
					<th>Chỉnh sửa</th>
					<th>Xóa</th>
				</tr>
				<%
					String masv1 = null, masv2 = null, masv3 = null, mamon1 = null, mamon2 = null, mamon3 = null;
					String malop1 = null, malop2 = null, malop3 = null,  diem1 = null, diem2 = null, diem3 = null;
					

					if (request.getParameter("TimKiemTheo").equals("MaSV") == true
							&& request.getParameter("DuLieu").equals("") == false) {
						masv1 = '%' + request.getParameter("DuLieu");
						masv2 = request.getParameter("DuLieu") + '%';
						masv3 = '%' + request.getParameter("DuLieu") + '%';
					}

					if (request.getParameter("TimKiemTheo").equals("MaMon") == true
							&& request.getParameter("DuLieu").equals("") == false) {
						mamon1 = '%' + request.getParameter("DuLieu");
						mamon2 = request.getParameter("DuLieu") + '%';
						mamon3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("MaLop") == true
							&& request.getParameter("DuLieu").equals("") == false) {
						malop1 = '%' + request.getParameter("DuLieu");
						malop2 = request.getParameter("DuLieu") + '%';
						malop3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("Diem") == true
							&& request.getParameter("DuLieu").equals("") == false) {
						diem1 = '%' + request.getParameter("DuLieu");
						diem2 = request.getParameter("DuLieu") + '%';
						diem3 = '%' + request.getParameter("DuLieu") + '%';
					}
					Connection con = null;
					con = DBConnection.createConnection();
					ResultSet rs = null;
					Statement st = con.createStatement();

					PreparedStatement ps = con.prepareStatement(
							"select * from DiemSV where MaSV like ? OR MaSV like ? OR MaSV like ? OR MaMon like ? OR MaMon like ? OR MaMon like ? OR MaLop like ? OR MaLop like ? OR MaLop like ? OR Diem like ? OR Diem like ? OR Diem like ?");
					ps.setString(1, masv1);
					ps.setString(2, masv2);
					ps.setString(3, masv3);
					ps.setString(4, mamon1);
					ps.setString(5, mamon2);
					ps.setString(6, mamon3);
					ps.setString(7, malop1);
					ps.setString(8, malop2);
					ps.setString(9, malop3);
					ps.setString(10, diem1);
					ps.setString(11, diem2);
					ps.setString(12, diem3);

					System.out.println(ps);
					rs = ps.executeQuery();
					int dem = 1;
					while (rs.next()) {

						out.println("<tr>");
						out.println("<td>" + dem + "</td>");

						out.println("<td>" + rs.getString("MaSV") + "</td>");
						out.println("<td>" + rs.getString("MaMon") + "</td>");
						out.println("<td>" + rs.getString("MaLop") + "</td>");
						out.println("<td>" + rs.getString("Diem") + "</td>");
						out.println("<td><a href='UpdateScore.jsp?MaSV=" + rs.getString("MaSV")
								+ "'><img src='Image/Admin/repair.png' width='30px' height='30px'></a></td>");
						out.println("<td><a href='DeleteScore.jsp?MaSV=" + rs.getString("MaSV")
								+ "'><img src='Image/Admin/delete.jpg' width='30px' height='30px'></a></td>");

						out.println("</tr>");
						dem++;
					}

					st.close();
				%>

				<tr>
					<td colspan='17'><center>
							<a href='Admin.jsp?tmp=ListScore'><button>Trở lại</button></a>
						</center></td>
				</tr>
			</table>

		</div>
	</div>

</body>
</html>

