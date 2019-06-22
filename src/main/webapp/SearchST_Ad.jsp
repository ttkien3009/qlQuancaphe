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

<title>Tìm kiếm sinh viên</title>
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
								SÁCH THÔNG TIN SINH VIÊN</h1></b></th>
				</tr>
				<tr>
					<th>STT</th>
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
					<th>Sửa</th>
					<th>Xóa</th>
				</tr>
				<%
					String HoTen1 = null, HoTen2 = null, HoTen3 = null, MaSV1 = null, MaSV2 = null, MaSV3 = null;
					String Phai1 = null, Phai2 = null, Phai3 = null, sdt1 = null, sdt2 = null, sdt3 = null;
					String NgaySinh1 = null, NgaySinh2 = null, NgaySinh3 = null, dc1 = null, dc2 = null, dc3 = null;
					String Khoa1 = null, Khoa2 = null, Khoa3 = null, Nghanh1 = null, Nghanh2 = null, Nghanh3 = null;
					String cmnd1 = null, cmnd2 = null, cmnd3 = null, tinhtrang1 = null, tinhtrang2 = null, tinhtrang3 = null;
					String tinchidahoc1 = null, tinchidahoc2 = null, tinchidahoc3 = null, tinchidangno1 = null, tinchidangno2 = null, tinchidangno3 = null;
					String email1 = null, email2 = null,email3 = null;
					
					if (request.getParameter("TimKiemTheo").equals("HoTen") == true && request.getParameter("DuLieu").equals("") == false) {
						HoTen1 = '%' + request.getParameter("DuLieu");
						HoTen2 = request.getParameter("DuLieu") + '%';
						HoTen3 = '%' + request.getParameter("DuLieu") + '%';
					}

					if (request.getParameter("TimKiemTheo").equals("MaSV") == true && request.getParameter("DuLieu").equals("") == false) {
						MaSV1 = '%' + request.getParameter("DuLieu");
						MaSV2 = request.getParameter("DuLieu") + '%';
						MaSV3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("Phai") == true && request.getParameter("DuLieu").equals("") == false) {
						Phai1 = '%' + request.getParameter("DuLieu");
						Phai2 = request.getParameter("DuLieu") + '%';
						Phai3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("SoDienThoai") == true && request.getParameter("DuLieu").equals("") == false) {
						sdt1 = '%' + request.getParameter("DuLieu");
						sdt2 = request.getParameter("DuLieu") + '%';
						sdt3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("NgaySinh") == true && request.getParameter("DuLieu").equals("") == false) {
						NgaySinh1 = '%' + request.getParameter("DuLieu");
						NgaySinh2 = request.getParameter("DuLieu") + '%';
						NgaySinh3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("QueQuan") == true && request.getParameter("DuLieu").equals("") == false) {
						dc1 = '%' + request.getParameter("DuLieu");
						dc2 = request.getParameter("DuLieu") + '%';
						dc3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("Khoa") == true && request.getParameter("DuLieu").equals("") == false) {
						Khoa1 = '%' + request.getParameter("DuLieu");
						Khoa2 = request.getParameter("DuLieu") + '%';
						Khoa3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("Nghanh") == true && request.getParameter("DuLieu").equals("") == false) {
						Nghanh1 = '%' + request.getParameter("DuLieu");
						Nghanh2 = request.getParameter("DuLieu") + '%';
						Nghanh3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("TinhTrang") == true && request.getParameter("DuLieu").equals("") == false) {
						tinhtrang1 = '%' + request.getParameter("DuLieu");
						tinhtrang2 = request.getParameter("DuLieu") + '%';
						tinhtrang3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("CMND") == true && request.getParameter("DuLieu").equals("") == false) {
						cmnd1 = '%' + request.getParameter("DuLieu");
						cmnd2 = request.getParameter("DuLieu") + '%';
						cmnd3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("Email") == true && request.getParameter("DuLieu").equals("") == false) {
						email1 = '%' + request.getParameter("DuLieu");
						email2 = request.getParameter("DuLieu") + '%';
						email3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("TinChiDaHoc") == true && request.getParameter("DuLieu").equals("") == false) {
						tinchidahoc1 = '%' + request.getParameter("DuLieu");
						tinchidahoc2 = request.getParameter("DuLieu") + '%';
						tinchidahoc3 = '%' + request.getParameter("DuLieu") + '%';
					}
					if (request.getParameter("TimKiemTheo").equals("TinChiDangNo") == true && request.getParameter("DuLieu").equals("") == false) {
						tinchidangno1 = '%' + request.getParameter("DuLieu");
						tinchidangno2 = request.getParameter("DuLieu") + '%';
						tinchidangno3 = '%' + request.getParameter("DuLieu") + '%';
					}

					Connection con = null;
					con = DBConnection.createConnection();
					ResultSet rs = null;
					Statement st = con.createStatement();

					PreparedStatement ps = con.prepareStatement(
							"select * from sinhvien where HoTen like ? OR HoTen like ? OR HoTen like ? OR MaSV like ? OR MaSV like ? OR MaSV like ? OR Phai like ? OR Phai like ? OR Phai like ? OR SoDienThoai like ? OR SoDienThoai like ? OR SoDienThoai like ? OR NgaySinh like ? OR NgaySinh like ? OR NgaySinh like ? OR QueQuan like ? OR QueQuan like ? OR QueQuan like ? OR Khoa like ? OR Khoa like ? OR Khoa like ? OR Nghanh like ? OR Nghanh like ? OR Nghanh like ? OR TinChiDaHoc like ? OR TinChiDaHoc like ? OR TinChiDaHoc like ? OR TinChiDangNo = ? OR TinChiDangNo = ? OR TinChiDangNo = ? OR Email like ? OR Email like ? OR Email like ? OR TinhTrang like ? OR TinhTrang like ? OR TinhTrang like ? OR CMND like ? OR CMND like ? OR CMND like ?");
					ps.setString(1, HoTen1);
					ps.setString(2, HoTen2);
					ps.setString(3, HoTen3);
					ps.setString(4, MaSV1);
					ps.setString(5, MaSV2);
					ps.setString(6, MaSV3);
					ps.setString(7, Phai1);
					ps.setString(8, Phai2);
					ps.setString(9, Phai3);
					ps.setString(10, sdt1);
					ps.setString(11, sdt2);
					ps.setString(12, sdt3);
					ps.setString(13, NgaySinh1);
					ps.setString(14, NgaySinh2);
					ps.setString(15, NgaySinh3);
					ps.setString(16, dc1);
					ps.setString(17, dc2);
					ps.setString(18, dc3);
					ps.setString(19, Khoa1);
					ps.setString(20, Khoa2);
					ps.setString(21, Khoa3);
					ps.setString(22, Nghanh1);
					ps.setString(23, Nghanh2);
					ps.setString(24, Nghanh3);
					ps.setString(25, tinchidahoc1);
					ps.setString(26, tinchidahoc2);
					ps.setString(27, tinchidahoc3);
					ps.setString(28, tinchidangno1);
					ps.setString(29, tinchidangno2);
					ps.setString(30, tinchidangno3);
					ps.setString(31, email1);
					ps.setString(32, email2);
					ps.setString(33, email3);
					ps.setString(34, tinhtrang1);
					ps.setString(35, tinhtrang2);
					ps.setString(36, tinhtrang3);
					ps.setString(37, cmnd1);
					ps.setString(38, cmnd2);
					ps.setString(39, cmnd3);
					

					System.out.println(ps);
					rs = ps.executeQuery();
					int dem = 1;
					while (rs.next()) {

						out.println("<tr>");
						out.println("<td>" + dem + "</td>");

						out.println("<td>" + rs.getString("MaSV") + "</td>");
						out.println("<td>" + rs.getString("HoTen") + "</td>");
						out.println("<td>" + rs.getString("Phai") + "</td>");
						out.println("<td>" + rs.getString("NgaySinh") + "</td>");
						out.println("<td>" + rs.getString("QueQuan") + "</td>");
						out.println("<td>" + rs.getString("CMND") + "</td>");
						out.println("<td>" + rs.getString("SoDienThoai") + "</td>");
						out.println("<td>" + rs.getString("Khoa") + "</td>");
						out.println("<td>" + rs.getString("Nghanh") + "</td>");
						out.println("<td>" + rs.getString("TinhTrang") + "</td>");
						out.println("<td>" + rs.getInt("TinChiDaHoc") + "</td>");
						out.println("<td>" + rs.getInt("TinChiDangNo") + "</td>");
						out.println("<td>" + rs.getString("Email") + "</td>");
						out.println("<td>" + rs.getString("HinhSV") + "</td>");

						out.println("<td><a href='UpdateStudent.jsp?MaSV=" + rs.getString("MaSV")
								+ "'><img src='Image/Admin/repair.png' width='30px' height='30px'></a></td>");
						out.println("<td><a href='DeleteStudent.jsp?MaSV=" + rs.getString("MaSV")
								+ "'><img src='Image/Admin/delete.jpg' width='30px' height='30px'></a></td>");

						out.println("</tr>");
						dem++;
					}

					st.close();
				%>

				<tr>
					<td colspan='17'><center>
							<a href="Admin.jsp?tmp=ListStudent"><button>Trở
									lại</button></a>
						</center></td>
				</tr>
			</table>

		</div>
	</div>

</body>
</html>

