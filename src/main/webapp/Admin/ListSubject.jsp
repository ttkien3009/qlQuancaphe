<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.util.Vector"%>
<%@ page import="Code.Subject"%>
<%@ page import="Code.LoginBean"%>
<%@page import="java.util.List"%>
<%@ page import="Code.User"%>

<%
	int first = 0, last = 0, pages = 1, itemnumber = 6;

	if (request.getParameter("pages") != null) {
		pages = (int) Integer.parseInt(request.getParameter("pages"));
	}
	int total = new Subject().getCountSubject();
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
<title>ĐĂNG KÝ MÔN HỌC</title>
</head>
<body>
	<form name="form"
		action="<%=request.getContextPath()%>/SearchSJ_Ad.jsp" method="get">
		<div class="textbox">
			<select name="TimKiemTheo">
				<option value="MaLop">Mã Lớp</option>
				<option value="MaMon">Mã Môn</option>
				<option value="TenMon">Tên Môn</option>
				<option value="SoTinChi">Số Tín Chỉ</option>
				<option value="Ca">Ca</option>
				<option value="Thu">Thứ</option>
				<option value="Phong">Phòng</option>
				<option value="ThoiGianBatDau">Thời Gian Bắt Đầu</option>
				<option value="ThoiGianKetThuc">Thời Gian Kết Thúc</option>
			</select>
		</div>
		<p>Nhập Dữ Liệu Cần Tìm:</p>
		<div class="textbox">
			<input type="text" name="DuLieu" placeholder="Nhập Dữ Liệu">
		</div>
		<div class="bottom">
			<input type="submit" value="Tìm kiếm">
		</div>
		<br>
		<br>
		<table id="Table">
			<tr>
				<th colspan='13' align='center' height=60px><b><h1>DANH
							SÁCH ĐĂNG KÝ MÔN HỌC</h1></b></th>
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
			<tr>
				<%
					List<Subject> list = new Subject().getListSubject_Array(first, last);
					for (Subject subj : list) {
				%>
				<td><%=(dem + 1)%></td>
				<td><%=subj.getMaLop()%></td>
				<td><%=subj.getMaMon()%></td>
				<td><%=subj.getTenMon()%></td>
				<td><%=subj.getSoTinChi()%></td>
				<td><%=subj.getGiangVien()%></td>
				<td><%=subj.getCa()%></td>
				<td><%=subj.getThu()%></td>
				<td><%=subj.getPhong()%></td>
				<td><%=subj.getThoiGianBatDau()%></td>
				<td><%=subj.getThoiGianKetThuc()%></td>
				<td><a href="UpdateSubject.jsp?MaMon=<%=subj.getMaMon()%>"><img
						src="Image/Admin/repair.png" width="30px" height="30px"></a></td>
				<td><a href="DeleteSubject.jsp?MaMon=<%=subj.getMaMon()%>"><img
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
							href="<%=request.getContextPath()%>/Admin.jsp?tmp=ListSubject&pages=<%=back%>">Back</a></span>
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
								href="<%=request.getContextPath()%>/Admin.jsp?tmp=ListSubject&pages=<%=i%>"><%=i%></a></span></i>
						<%
							} else {
						%>
						<i><a
							href="<%=request.getContextPath()%>/Admin.jsp?tmp=ListSubject&pages=<%=i%>"><%=i%></a>
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
							href="<%=request.getContextPath()%>/Admin.jsp?tmp=ListSubject&pages=<%=next%>"><i
								class="next">Next</i></a></i>
					</ul>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
