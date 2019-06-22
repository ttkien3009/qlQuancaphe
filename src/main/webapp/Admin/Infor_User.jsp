<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.util.Vector"%>
<%@ page import="Code.User"%>
<%@ page import="Code.LoginBean"%>
<%@page import="java.util.List"%>
<%
	int first = 0, last = 0, pages = 1, itemnumber = 6;

	if (request.getParameter("pages") != null) {
		pages = (int) Integer.parseInt(request.getParameter("pages"));
	}
	int total = new User().getCountUser();
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
<title>THÔNG TIN NGƯỜI DÙNG</title>

<%-- <%
	if ((request.getSession(false).getAttribute("Admin") == null)) {
%>
<jsp:forward page="Login.jsp"></jsp:forward>
<%
	}
%> --%>
</head>
<body>
	<form name="form"
		action="<%=request.getContextPath()%>/SearchUS_Ad.jsp" method="get">
		<div class="textbox">
			<select name="TimKiemTheo">
				<option value="TaiKhoan">Tài Khoản</option>
				<option value="MatKhau">Mật Khẩu</option>
				<option value="PhanQuyen">Phân Quyền</option>
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
		<table border="1" padding="15px">
			<tr>
				<th colspan='9' align='center' height=60px><b><h1>DANH
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
			<tr>
				<%
					List<User> list = new User().getListUs_Array(first, last);
					for (User usr : list) {
				%>
				<td><%=(dem + 1)%></td>
				<td><%=usr.getTaiKhoan()%></td>
				<td><%=usr.getMatKhau()%></td>
				<td><%=usr.getPhanQuyen()%></td>
				<td><a href="UpdateAccount.jsp?TaiKhoan=<%=usr.getTaiKhoan()%>"><img
						src="<%=request.getContextPath()%>/Image/Admin/repair.png"
						width="30px" height="30px"></a></td>
				<td><a href="DeleteAccount.jsp?TaiKhoan=<%=usr.getTaiKhoan()%>"><img
						src="<%=request.getContextPath()%>/Image/Admin/delete.jpg"
						width="30px" height="30px"></a></td>
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
							href="<%=request.getContextPath()%>/Admin.jsp?tmp=Infor_User&pages=<%=back%>">Back</a></span>
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
								href="<%=request.getContextPath()%>/Admin.jsp?tmp=Infor_User&pages=<%=i%>"><%=i%></a></span></i>
						<%
							} else {
						%>
						<i><a
							href="<%=request.getContextPath()%>/Admin.jsp?tmp=Infor_User&pages=<%=i%>"><%=i%></a>
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
							href="<%=request.getContextPath()%>/Admin.jsp?tmp=Infor_User&pages=<%=next%>"><i
								class="next">Next</i></a></i>
					</ul>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>