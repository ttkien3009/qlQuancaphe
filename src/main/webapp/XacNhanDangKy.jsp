<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="Code.MonDK"%>
<%
	String exUser = null;
	Cookie[] listCookie = request.getCookies();
	if (listCookie != null) {
		for (Cookie cookie : listCookie) {
			if (cookie.getName().equals("exUser")) {
				exUser = cookie.getValue();
				break;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="CSS/DangKy.css">

<link rel="shortcut icon" type="Image/jpg"
	href="Image/Main_Page/favicon.jpg">
<title>Xác Nhận Đăng Ký</title>
</head>
<body>
	<div class="Main">
		<div class="TT">

			<%
			HttpSession session_listSubject_MaLop = request.getSession();
			HttpSession session_listSubject_MaMon = request.getSession();
			HttpSession session_listSubject_SoTinChi = request.getSession();
			HttpSession session_listSubject_Ca = request.getSession();
			HttpSession session_listSubject_Thu = request.getSession();
			HttpSession session_listSubject_Phong = request.getSession();
			HttpSession session_listSubject_ThoiGianBatDau = request.getSession();
			HttpSession session_listSubject_ThoiGianKetThuc = request.getSession();

				MonDK cart = new MonDK();
				
				String malop = "";
				String mamon = "";
				String sotinchi = "";
				String ca = "";
				String thu = "";
				String phong = "";
				String thoigianbatdau = "";
				String thoigianketthuc = "";

				int total = 0;
				if (request.getParameter("rm_id") != null) {

					malop = session_listSubject_MaLop.getAttribute("malop").toString();
					mamon = session_listSubject_MaMon.getAttribute("mamon").toString();
					sotinchi = session_listSubject_SoTinChi.getAttribute("sotinchi").toString();
					ca = session_listSubject_Ca.getAttribute("ca").toString();
					thu = session_listSubject_Thu.getAttribute("thu").toString();
					phong = session_listSubject_Phong.getAttribute("phong").toString();
					thoigianbatdau = session_listSubject_ThoiGianBatDau.getAttribute("thoigianbatdau").toString();
					thoigianketthuc = session_listSubject_ThoiGianKetThuc.getAttribute("thoigianketthuc").toString();

					int kt = cart.check_String(mamon, request.getParameter("rm_id"));
					if (kt != -1) {
						mamon = cart.XoaMon(mamon, kt);
						if (mamon == "") {
							session_listSubject_MaMon.setAttribute("mamon", null);
						} else {
							session_listSubject_MaMon.setAttribute("mamon", mamon);
							mamon = session_listSubject_MaMon.getAttribute("mamon").toString();
						}
						malop = cart.XoaMon(malop, kt);
						if (malop == "") {
							session_listSubject_MaLop.setAttribute("malop", null);
						} else {
							session_listSubject_MaLop.setAttribute("malop", malop);
							malop = session_listSubject_MaLop.getAttribute("malop").toString();
						}
						sotinchi = cart.XoaMon(sotinchi, kt);
						if (sotinchi == "") {
							session_listSubject_SoTinChi.setAttribute("sotinchi", null);
						} else {
							session_listSubject_SoTinChi.setAttribute("sotinchi", sotinchi);
							sotinchi = session_listSubject_SoTinChi.getAttribute("sotinchi").toString();
						}
						ca = cart.XoaMon(ca, kt);
						if (ca == "") {
							session_listSubject_Ca.setAttribute("ca", null);
						} else {
							session_listSubject_Ca.setAttribute("ca", ca);
							ca = session_listSubject_Ca.getAttribute("ca").toString();
						}
						thu = cart.XoaMon(thu, kt);
						if (thu == "") {
							session_listSubject_Thu.setAttribute("thu", null);
						} else {
							session_listSubject_Thu.setAttribute("thu", thu);
							thu = session_listSubject_Thu.getAttribute("thu").toString();
						}
						phong = cart.XoaMon(phong, kt);
						if (phong == "") {
							session_listSubject_Phong.setAttribute("phong", null);
						} else {
							session_listSubject_Phong.setAttribute("phong", phong);
							phong = session_listSubject_Phong.getAttribute("phong").toString();
						}
						thoigianbatdau = cart.XoaMon(thoigianbatdau, kt);
						if (thoigianbatdau == "") {
							session_listSubject_ThoiGianBatDau.setAttribute("thoigianbatdau", null);
						} else {
							session_listSubject_ThoiGianBatDau.setAttribute("thoigianbatdau", thoigianbatdau);
							thoigianbatdau = session_listSubject_ThoiGianBatDau.getAttribute("thoigianbatdau").toString();
						}
						thoigianketthuc = cart.XoaMon(thoigianketthuc, kt);
						if (thoigianketthuc == "") {
							session_listSubject_ThoiGianKetThuc.setAttribute("thoigianketthuc", null);
						} else {
							session_listSubject_ThoiGianKetThuc.setAttribute("thoigianketthuc", thoigianketthuc);
							thoigianketthuc = session_listSubject_ThoiGianKetThuc.getAttribute("thoigianketthuc")
									.toString();
						}
					}
				} else if (request.getParameter("mamon") == null
						&& session_listSubject_MaMon.getAttribute("mamon") == null) {
			%>
			<div class="GioHang">

				<h1>KHÔNG CÓ MÔN HỌC NÀO TRONG THỜI KHÓA BIỂU</h1>

			</div>
			<%
				} else {
					if (session_listSubject_MaMon.getAttribute("mamon") == null) {
						session_listSubject_MaMon.setAttribute("mamon", request.getParameter("mamon"));
						session_listSubject_Ca.setAttribute("ca", Integer.parseInt(request.getParameter("ca")));
						session_listSubject_Thu.setAttribute("thu", Integer.parseInt(request.getParameter("thu")));
						session_listSubject_MaLop.setAttribute("malop", request.getParameter("malop"));
						session_listSubject_Phong.setAttribute("phong", request.getParameter("phong"));
						session_listSubject_SoTinChi.setAttribute("sotinchi", "1");
						session_listSubject_SoTinChi.setAttribute("sotinchi", request.getParameter("sotinchi"));
						session_listSubject_ThoiGianBatDau.setAttribute("thoigianbatdau",
								request.getParameter("thoigianbatdau"));
						session_listSubject_ThoiGianKetThuc.setAttribute("thoigianketthuc",
								request.getParameter("thoigianketthuc"));

						mamon = session_listSubject_MaMon.getAttribute("mamon").toString();
						malop = session_listSubject_MaLop.getAttribute("malop").toString();
						sotinchi = session_listSubject_SoTinChi.getAttribute("sotinchi").toString();
						ca = session_listSubject_Ca.getAttribute("ca").toString();
						thu = session_listSubject_Thu.getAttribute("thu").toString();
						phong = session_listSubject_Phong.getAttribute("phong").toString();
						thoigianbatdau = session_listSubject_ThoiGianBatDau.getAttribute("thoigianbatdau").toString();
						thoigianketthuc = session_listSubject_ThoiGianKetThuc.getAttribute("thoigianketthuc").toString();

					} else {

						mamon = session_listSubject_MaMon.getAttribute("mamon").toString();
						malop = session_listSubject_MaLop.getAttribute("malop").toString();
						sotinchi = session_listSubject_SoTinChi.getAttribute("sotinchi").toString();
						ca = session_listSubject_Ca.getAttribute("ca").toString();
						thu = session_listSubject_Thu.getAttribute("thu").toString();
						phong = session_listSubject_Phong.getAttribute("phong").toString();
						thoigianbatdau = session_listSubject_ThoiGianBatDau.getAttribute("thoigianbatdau").toString();
						thoigianketthuc = session_listSubject_ThoiGianKetThuc.getAttribute("thoigianketthuc").toString();

						if (request.getParameter("mamon") != null) {
							int kt = cart.check_String(mamon, request.getParameter("mamon"));
							if (kt == -1) {

								malop = malop + ";" + request.getParameter("malop");
								mamon = mamon + ";" + request.getParameter("mamon");
								sotinchi = sotinchi + ";" + request.getParameter("sotinchi");
								ca = ca + ";" + request.getParameter("ca");
								thu = thu + ";" + request.getParameter("thu");
								phong = phong + ";" + request.getParameter("phong");
								thoigianbatdau = thoigianbatdau + ";" + request.getParameter("thoigianbatdau");
								thoigianketthuc = thoigianketthuc + ";" + request.getParameter("thoigianketthuc");

								session_listSubject_MaLop.setAttribute("malop", malop);
								session_listSubject_MaMon.setAttribute("mamon", mamon);
								session_listSubject_SoTinChi.setAttribute("sotinchi", sotinchi);
								session_listSubject_Ca.setAttribute("ca", ca);
								session_listSubject_Thu.setAttribute("thu", thu);
								session_listSubject_Phong.setAttribute("phong", phong);
								session_listSubject_ThoiGianBatDau.setAttribute("thoigianbatdau", thoigianbatdau);
								session_listSubject_ThoiGianKetThuc.setAttribute("thoigianketthuc", thoigianketthuc);

							} else {
								sotinchi = cart.CapNhatSL(sotinchi, kt);
								session_listSubject_SoTinChi.setAttribute("sotinchi", sotinchi);
							}
						} else {
							sotinchi = session_listSubject_SoTinChi.getAttribute("sotinchi").toString();
						}
					}
				}

				String[] array_malop = malop.split(";");
				String[] array_mamon = mamon.split(";");
				String[] array_sotinchi = sotinchi.split(";");
				String[] array_ca = ca.split(";");
				String[] array_thu = thu.split(";");
				String[] array_phong = phong.split(";");
				String[] array_thoigianbatdau = thoigianbatdau.split(";");
				String[] array_thoigianketthuc = thoigianketthuc.split(";");

				//out.write("<br/>mang id="+id);
				//out.write("<br/>mang qualiti="+qualiti);
				//out.write("<br/>mang price="+price);
				//out.write("<br/>mang picture="+image);
				int i;
				if (array_mamon.length > 0) {
			%>
			<form name="giohang"
				action="<%=request.getContextPath()%>/CheckoutServlet" method="post">
				<table>
					<tr>
						<th>Xóa</th>
						<th>Mã Lớp</th>
						<th>Mã Môn</th>
						<th>Số Tín Chỉ</th>
						<th>Ca</th>
						<th>Thứ</th>
						<th>Phòng</th>
						<th>Ngày Bắt Đầu</th>
						<th>Ngày Kết Thúc</th>
					</tr>
					<tr>


						<%
							for (i = 0; i < array_mamon.length; i++) {
									if (array_sotinchi[i].isEmpty()) {
										total = 0;
									} else {
										total = total + Integer.parseInt(array_sotinchi[i]);
									}
									if (!array_mamon[i].isEmpty()) {
						%>
						<td width="10" align="center"><a
							href="<%=request.getContextPath()%>/Student.jsp?tmp=addcart&rm_id=<%=array_mamon[i]%>"><img
								src="<%=request.getContextPath()%>/Image/Admin/delete.jpg"  width="60px" height="60px" /></a></td>
						<td><%=array_malop[i]%></td>
						<td><%=array_mamon[i]%></td>
						<td><%=array_sotinchi[i]%></td>
						<td><%=array_ca[i]%></td>
						<td><%=array_thu[i]%></td>
						<td><%=array_phong[i]%></td>
						<td><%=array_thoigianbatdau[i]%></td>
						<td><%=array_thoigianketthuc[i]%></td>
					</tr>
					<%
						}
							}
					%>
					<tr>
						<td colspan="8" align="right">Tổng cộng số tín chỉ:&nbsp;</td>
						<td align="left"><%=total%></td>
					</tr>
				</table>
				<br>
				
				<input type="hidden" name="TaiKhoan" value="<%=exUser%>"> 
				<input type="submit" value="Đăng Ký">
			</form>
			<a href="Student.jsp?tmp=addcart"><button>Môn Đã Chọn</button></a>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>
