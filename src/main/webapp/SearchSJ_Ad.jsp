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

<title>Tìm kiếm môn học</title>
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
								SÁCH THÔNG TIN MÔN HỌC</h1></b></th>
				</tr>
				<tr>
					<th>STT</th>
					<th>Mã Lớp</th>
					<th>Mã Môn</th>
					<th>Tên Môn</th>
					<th>Số Tín Chỉ</th>
					<th>Giảng Viên</th>
					<th>Ca</th>
					<th>Thứ</th>
					<th>Phòng</th>
					<th>Thời Gian Bắt Đầu</th>
					<th>Thời Gian Kết Thúc</th>
					<th>Sửa</th>
					<th>Xóa</th>
				</tr>
				<%
					String mamon1 = null, mamon2 = null, mamon3 = null, malop1 = null, malop2 = null, malop3 = null;
					String tenmon1 = null, tenmon2 = null, tenmon3 = null, giangvien1 = null, giangvien2 = null, giangvien3 = null;
					String thoigianbatdau1 = null, thoigianbatdau2 = null, thoigianbatdau3 = null, thoigianketthuc1 = null, thoigianketthuc2 = null, thoigianketthuc3 = null;
					String phong1 = null, phong2 = null, phong3 = null, sotinchi1 = null, sotinchi2 = null, sotinchi3 =null;
					String ca1 = null, ca2 = null, ca3 = null, thu1= null, thu2 = null, thu3 = null;
					

					if (request.getParameter("TimKiemTheo").equals("MaLop") == true && request.getParameter("DuLieu").equals("") == false) {
						malop1 = '%' + request.getParameter("DuLieu");
						malop2 = request.getParameter("DuLieu") + '%';
						malop3 = '%' + request.getParameter("DuLieu") + '%';
					}

					if (request.getParameter("TimKiemTheo").equals("MaMon") == true && request.getParameter("DuLieu").equals("") == false) {
						mamon1 = '%' + request.getParameter("DuLieu");
						mamon2 = request.getParameter("DuLieu") + '%';
						mamon3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("TenMon") == true && request.getParameter("DuLieu").equals("") == false) {
						tenmon1 = '%' + request.getParameter("DuLieu");
						tenmon2 = request.getParameter("DuLieu") + '%';
						tenmon3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("GiangVien") == true && request.getParameter("DuLieu").equals("") == false) {
						giangvien1 = '%' + request.getParameter("DuLieu");
						giangvien2 = request.getParameter("DuLieu") + '%';
						giangvien3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("ThoiGianBatDau") == true && request.getParameter("DuLieu").equals("") == false) {
						thoigianbatdau1 = '%' + request.getParameter("DuLieu");
						thoigianbatdau2 = request.getParameter("DuLieu") + '%';
						thoigianbatdau3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("ThoiGianKetThuc") == true && request.getParameter("DuLieu").equals("") == false) {
						thoigianketthuc1 = '%' + request.getParameter("DuLieu");
						thoigianketthuc2 = request.getParameter("DuLieu") + '%';
						thoigianketthuc3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("Phong") == true && request.getParameter("DuLieu").equals("") == false) {
						phong1 = '%' + request.getParameter("DuLieu");
						phong2 = request.getParameter("DuLieu") + '%';
						phong3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("SoTinChi") == true && request.getParameter("DuLieu").equals("") == false) {
						sotinchi1 = '%' + request.getParameter("DuLieu");
						sotinchi2 = request.getParameter("DuLieu") + '%';
						sotinchi3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("Ca") == true && request.getParameter("DuLieu").equals("") == false) {
						ca1 = '%' + request.getParameter("DuLieu");
						ca2 = request.getParameter("DuLieu") + '%';
						ca3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("Thu") == true && request.getParameter("DuLieu").equals("") == false) {
						thu1 = '%' + request.getParameter("DuLieu");
						thu2 = request.getParameter("DuLieu") + '%';
						thu3 = '%' + request.getParameter("DuLieu") + '%';
					}
					
					Connection con = null;
					con = DBConnection.createConnection();
					ResultSet rs = null;
					Statement st = con.createStatement();

					PreparedStatement ps = con.prepareStatement(
							"select * from Mon where MaLop like ? OR MaLop like ? OR MaLop like ? OR MaMon like ? OR MaMon like ? OR MaMon like ? OR TenMon like ? OR TenMon like ? OR TenMon like ? OR SoTinChi like ? OR SoTinChi like ? OR SoTinChi like ? OR Ca like ? OR Ca like ? OR Ca like ? OR Thu like ? OR Thu like ? OR Thu like ? OR Phong like ? OR Phong like ? OR Phong like ? OR ThoiGianBatDau like ? OR ThoiGianBatDau like ? OR ThoiGianBatDau like ? OR ThoiGianKetThuc like ? OR ThoiGianKetThuc like ? OR ThoiGianKetThuc like ? OR GiangVien like ? OR GiangVien like ? OR GiangVien like ?");
					ps.setString(1, malop1);
					ps.setString(2, malop2);
					ps.setString(3, malop3);
					ps.setString(4, mamon1);
					ps.setString(5, mamon2);
					ps.setString(6, mamon3);
					ps.setString(7, tenmon1);
					ps.setString(8, tenmon2);
					ps.setString(9, tenmon3);
					ps.setString(10, sotinchi1);
					ps.setString(11, sotinchi2);
					ps.setString(12, sotinchi3);
					ps.setString(13, ca1);
					ps.setString(14, ca2);
					ps.setString(15, ca3);
					ps.setString(16, thu1);
					ps.setString(17, thu2);
					ps.setString(18, thu3);
					ps.setString(19, phong1);
					ps.setString(20, phong2);
					ps.setString(21, phong3);
					ps.setString(22, thoigianbatdau1);
					ps.setString(23, thoigianbatdau2);
					ps.setString(24, thoigianbatdau3);
					ps.setString(25, thoigianketthuc1);
					ps.setString(26, thoigianketthuc2);
					ps.setString(27, thoigianketthuc3);
					ps.setString(28, giangvien1);
					ps.setString(29, giangvien2);
					ps.setString(30, giangvien3);
					
					System.out.println(ps);
					rs = ps.executeQuery();
					int dem = 1;
					while (rs.next()) {

						out.println("<tr>");
						out.println("<td>" + dem + "</td>");

						out.println("<td>" + rs.getString("MaLop") + "</td>");
						out.println("<td>" + rs.getString("MaMon") + "</td>");
						out.println("<td>" + rs.getString("TenMon") + "</td>");
						out.println("<td>" + rs.getString("SoTinChi") + "</td>");
						out.println("<td>" + rs.getString("GiangVien") + "</td>");
						out.println("<td>" + rs.getString("Ca") + "</td>");
						out.println("<td>" + rs.getString("Thu") + "</td>");
						out.println("<td>" + rs.getString("Phong") + "</td>");
						out.println("<td>" + rs.getString("ThoiGianBatDau") + "</td>");
						out.println("<td>" + rs.getString("ThoiGianKetThuc") + "</td>");
						out.println("<td><a href='UpdateSubject.jsp?MaMon=" + rs.getString("MaMon")
								+ "'><img src='Image/Admin/repair.png' width='30px' height='30px'></a></td>");
						out.println("<td><a href='DeleteSubject.jsp?MaMon=" + rs.getString("MaMon")
								+ "'><img src='Image/Admin/delete.jpg' width='30px' height='30px'></a></td>");

						out.println("</tr>");
						dem++;
					}

					st.close();
				%>

				<tr>
					<td colspan='17'><center>
							<a href='Admin.jsp?tmp=ListSubject'><button>Trở
									lại</button></a>
						</center></td>
				</tr>
			</table>

		</div>
	</div>

</body>
</html>

