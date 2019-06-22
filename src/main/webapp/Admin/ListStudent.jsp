<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.util.Vector"%>
<%@ page import="Code.Student"%>
<%@ page import="Code.LoginBean"%>
<%@page import="java.util.List"%>
<%@ page import="Code.User"%>

<%
	int first = 0, last = 0, pages = 1, itemnumber = 6;

	if (request.getParameter("pages") != null) {
		pages = (int) Integer.parseInt(request.getParameter("pages"));
	}
	int total = new Student().getCountStudent();
	if (total <= itemnumber) {
		first = 0;
		last = total;
	} else {
		first = (pages - 1) * itemnumber;
		last = itemnumber;
	}

	int dem = 0;
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet type="text/css" href="CSS/Admin.css">
<link rel="shortcut icon" type="Image/jpg"
	href="Image/Main_Page/favicon.jpg">
<title>THÔNG TIN SINH VIÊN</title>
</head>
<body>
	<form name="form"
		action="<%=request.getContextPath()%>/SearchST_Ad.jsp" method="get">
		<div class="textbox">
			<select name="TimKiemTheo">
				<option value="MaSV">Mã Sinh Viên</option>
				<option value="HoTen">Họ và Tên</option>
				<option value="Phai">Giới Tính</option>
				<option value="NgaySinh">Ngày Sinh</option>
				<option value="QueQuan">Quê Quán</option>
				<option value="CMND">Số Chứng Minh Nhân Dân</option>
				<option value="SoDienThoai">Số Điện Thoại</option>
				<option value="Khoa">Khoa</option>
				<option value="Nghanh">Nghành</option>
				<option value="TinhTrang">Tình Trạng</option>
				<option value="TinChiDaHoc">Tín Chỉ Đã Học</option>
				<option value="TinChiDangNo">Tín Chỉ Đang Nợ</option>
				<option value="Email">Email</option>
			</select>
		</div>
		<p>Nhập Dữ Liệu Cần Tìm:</p>
		<div class="textbox">
			<input type="text" name="DuLieu" placeholder="Nhập Dữ Liệu">
		</div>
		<div class="bottom">
			<input type="submit" value="Tìm kiếm">
		</div>
		<br> <br>

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
			<tr>
				<%
					List<Student> list = new Student().getListSv_Array(first, last);
					for (Student std : list) {
				%>
				<td><%=(dem + 1)%></td>
				<td><%=std.getMaSV()%></td>
				<td><%=std.getHoTen()%></td>
				<td><%=std.getPhai()%></td>
				<td><%=std.getNgaySinh()%></td>
				<td><%=std.getQueQuan()%></td>
				<td><%=std.getCMND()%></td>
				<td><%=std.getSoDienThoai()%></td>
				<td><%=std.getKhoa()%></td>
				<td><%=std.getNghanh()%></td>
				<td><%=std.getTinhTrang()%></td>
				<td><%=std.getTinChiDaHoc()%></td>
				<td><%=std.getTinChiDangNo()%></td>
				<td><%=std.getEmail()%></td>
				<td><image src="Upload/<%=std.getHinhSV()%>" width = 5px height = 5px></td>
				<td><a href="UpdateStudent.jsp?MaSV=<%=std.getMaSV()%>"><img
						src="Image/Admin/repair.png" width="30px" height="30px"></a></td>
				<td><a href="DeleteStudent.jsp?MaSV=<%=std.getMaSV()%>"><img
						src="Image/Admin/delete.jpg" width="30px" height="30px"></a></td>
			</tr>

			<%
				dem++;
				}
			%>
		</table border="1">
		<table>
			<tr>
				<td>
					<ul>
						<%
							//Button Previous
							int back = 0;
							if (pages == 0 || pages == 1) {
								back = 1;//Luon la page 1
							} else {
								back = pages - 1;//Neu pages tu 2 tro len thi back tru 1
							}
						%>
						<span><a
							href="<%=request.getContextPath()%>/Admin.jsp?tmp=ListStudent&pages=<%=back%>">Back</a></span>
						<%
							//Button Number pages
							int loop = 0, num = 0;
							if ((total / itemnumber) % 2 == 0) {
								num = total / itemnumber;
							} else {
								num = (total + 1) / itemnumber;
							}
							if (total % 2 != 0) {
								loop = (total / itemnumber) + 1;

							} else {
								if (total < (num * itemnumber) + itemnumber && total != num * itemnumber) {
									loop = (total / itemnumber) + 1;
								} else {
									loop = (total / itemnumber);
								}
							}

							for (int i = 1; i <= loop; i++) {
						%>
						<%
							if (pages == i) {
						%>
						<i><span><a
								href="<%=request.getContextPath()%>/Admin.jsp?tmp=ListStudent&pages=<%=i%>"><%=i%></a></span></i>
						<%
							} else {
						%>
						<i><a
							href="<%=request.getContextPath()%>/Admin.jsp?tmp=ListStudent&pages=<%=i%>"><%=i%></a>
						</i>

						<%
							}
							}
						%>
						<%
							int next = 0;
							if (total % 2 != 0) {
								if (pages == (total / itemnumber) + 1) {
									next = pages;//Khong next
								} else {
									next = pages + 1;//Co next
								}
							} else {
								if (total < (num * itemnumber) + itemnumber && total != num * itemnumber) {
									if (pages == (total / itemnumber) + 1) {
										next = pages;//Khong next
									} else {
										next = pages + 1;//Co next
									}
								} else {
									if (pages == (total / itemnumber)) {
										next = pages;//Khong next
									} else {
										next = pages + 1;//Co next
									}
								}
							}
						%>
						<i><a
							href="<%=request.getContextPath()%>/Admin.jsp?tmp=ListStudent&pages=<%=next%>"><i
								class="next">Next</i></a></i>
					</ul>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
