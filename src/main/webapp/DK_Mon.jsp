<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Code.Subject"%>

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
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet type="text/css"
	href="<%=request.getContextPath()%>/CSS/Student.css">
<link rel="shortcut icon" type="Image/jpg"
	href="Image/Main_Page/favicon.jpg">
<title>Môn Học Đăng Ký</title>
</head>

<body>
	<div class="Main">
		<div class="Menu">
			<ul>
				<li><a href="index.jsp">Trang Chủ</a></li>
				<li><a href="Student.jsp">Trang Cá Nhân</a>
			</ul>
		</div>
		<div class="Content">
			<table border="1" padding="15px">
				<tr>
					<th align="center">Mã Lớp</th>
					<th align="center">Mã Môn</th>
					<th align="center">Số Tín Chỉ</th>
					<th align="center">Ca</th>
					<th align="center">Thứ</th>
					<th align="center">Phòng</th>
					<th align="center">Ngày Bắt Đầu</th>
					<th align="center">Ngày Kết Thúc</th>
					<th align="center">Đăng Ký</th>
				</tr>
				<tr>
					<%
						List<Subject> list = new Subject().getListSubject_Array(first, last);
						for (Subject subj : list) {
					%>
					<td><span><%=subj.getMaLop().toString()%> </span></td>
					<td><span><%=subj.getMaMon().toString()%> </span></td>
					<td><span><%=subj.getSoTinChi()%> </span></td>
					<td><span><%=subj.getCa()%> </span></td>
					<td><span><%=subj.getThu()%> </span></td>
					<td><span><%=subj.getPhong().toString()%> </span></td>
					<td><span><%=subj.getThoiGianBatDau().toString()%> </span></td>
					<td><span><%=subj.getThoiGianKetThuc().toString()%> </span></td>
					<td valign="center"><span><a
							href="<%=request.getContextPath()%>/Student.jsp?tmp=addcart&mamon=<%=subj.getMaMon().toString()%>&malop=<%=subj.getMaLop().toString()%>&sotinchi=<%=subj.getSoTinChi()%>&ca=<%=subj.getCa()%>&thu=<%=subj.getThu()%>&phong=<%=subj.getPhong().toString()%>&thoigianbatdau=<%=subj.getThoiGianBatDau().toString()%>&thoigianketthuc=<%=subj.getThoiGianKetThuc().toString()%>">
								<img style="width: 60px; height: 60px;"
								src="<%=request.getContextPath()%>/Image/Admin/add.png">
						</a> </span></td>
				</tr>
				<%
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
								href="<%=request.getContextPath()%>/Student.jsp?tmp=addcart&pages=<%=back%>">Back</a></span>
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
									href="<%=request.getContextPath()%>/Student/DK_Mon.jsp&pages=<%=i%>"><%=i%></a></span></i>
							<%
								} else {
							%>
							<i><a
								href="<%=request.getContextPath()%>/Student/DK_Mon.jsp&pages=<%=i%>"><%=i%></a>
							</i>

							<%
								}
								}
							%>
							<%
								//Button Next
								int next = 0;
								//Náº¿u total láº»
								if (total % 2 != 0) {
									if (pages == (total / itemnumber) + 1) {
										next = pages;//Khong next
									} else {
										next = pages + 1;//Co next
									}
								} else {
									//Náº¿u total cháºµn nhá» hÆ¡n fullpage
									//VÃ  khÃ´ng fullPage thÃ¬ thÃªm 1
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
								href="<%=request.getContextPath()%>/Student/DK_Mon.jsp&pages=<%=next%>"><i
									class="next">Next</i></a></i>
						</ul>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
