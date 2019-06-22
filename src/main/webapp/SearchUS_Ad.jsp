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
								SÁCH THÔNG TIN NGƯỜI DÙNG</h1></b></th>
				</tr>
				<tr>
					<th>STT</th>
					<th>Tài Khoản</th>
					<th>Mật Khẩu</th>
					<th>Phân Quyền</th>
					<th>Chỉnh sửa</th>
					<th>Xóa</th>
				</tr>
				<%
					String taikhoan1 = null, taikhoan2 = null, taikhoan3 = null, matkhau1 = null, matkhau2 = null, matkhau3 = null;
					String phanquyen1 = null, phanquyen2 = null, phanquyen3 = null;
					

					if (request.getParameter("TimKiemTheo").equals("TaiKhoan") == true
							&& request.getParameter("DuLieu").equals("") == false) {
						taikhoan1 = '%' + request.getParameter("DuLieu");
						taikhoan2 = request.getParameter("DuLieu") + '%';
						taikhoan3 = '%' + request.getParameter("DuLieu") + '%';
					}

					if (request.getParameter("TimKiemTheo").equals("MatKhau") == true
							&& request.getParameter("DuLieu").equals("") == false) {
						matkhau1 = '%' + request.getParameter("DuLieu");
						matkhau2 = request.getParameter("DuLieu") + '%';
						matkhau3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("PhanQuyen") == true
							&& request.getParameter("DuLieu").equals("") == false) {
						phanquyen1 = '%' + request.getParameter("DuLieu");
						phanquyen2 = request.getParameter("DuLieu") + '%';
						phanquyen3 = '%' + request.getParameter("DuLieu") + '%';
					}
					
					Connection con = null;
					con = DBConnection.createConnection();
					ResultSet rs = null;
					Statement st = con.createStatement();

					PreparedStatement ps = con.prepareStatement(
							"select * from NguoiDung where TaiKhoan like ? OR TaiKhoan like ? OR TaiKhoan like ? OR MatKhau like ? OR MatKhau like ? OR MatKhau like ? OR PhanQuyen like ? OR PhanQuyen like ? OR PhanQuyen like ?");
					ps.setString(1, taikhoan1);
					ps.setString(2, taikhoan2);
					ps.setString(3, taikhoan3);
					ps.setString(4, matkhau1);
					ps.setString(5, matkhau2);
					ps.setString(6, matkhau3);
					ps.setString(7, phanquyen1);
					ps.setString(8, phanquyen2);
					ps.setString(9, phanquyen3);

					System.out.println(ps);
					rs = ps.executeQuery();
					int dem = 1;
					while (rs.next()) {

						out.println("<tr>");
						out.println("<td>" + dem + "</td>");

						out.println("<td>" + rs.getString("TaiKhoan") + "</td>");
						out.println("<td>" + rs.getString("MatKhau") + "</td>");
						out.println("<td>" + rs.getString("PhanQuyen") + "</td>");
						out.println("<td><a href='UpdateAccount.jsp?TaiKhoan=" + rs.getString("TaiKhoan")
								+ "'><img src='Image/Admin/repair.png' width='30px' height='30px'></a></td>");
						out.println("<td><a href='DeleteAccount.jsp?TaiKhoan=" + rs.getString("TaiKhoan")
								+ "'><img src='Image/Admin/delete.jpg' width='30px' height='30px'></a></td>");

						out.println("</tr>");
						dem++;
					}

					st.close();
				%>

				<tr>
					<td colspan='17'><center>
							<a href='Admin.jsp?tmp=Infor_User'><button>Trở lại</button></a>
						</center></td>
				</tr>
			</table>

		</div>
	</div>

</body>
</html>

