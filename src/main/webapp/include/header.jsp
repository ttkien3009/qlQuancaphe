<%@ page pageEncoding="utf-8"%>
<%@ page import="Code.FindUser"%>
<!DOCTYPE html>
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
<html>
<head>
<meta charset="utf-8">
<title></title>

</head>
<body>
	<div class="header">
		<div class="lg">
			<a href="https://www.facebook.com/congtacsinhviendtm/"
				target="_blank"> <img src="Image/Main_Page/facebook.png.png"
				width="40" height="40"></a> <a href="#"><img
				src="Image/Main_Page/twitter-logo.png" width="40" height="40"></a>
			<a href="#"><img src="Image/Main_Page/google-plus-icon.png"
				width="40" height="40"></a>
		</div>
		<div class="headerright">
			<%
				if (exUser == null) {
			%>
			<ul>
				<li><a href="#"></a></li>
				&emsp;&emsp;
				<li><a href="Login.jsp">Sign in</a></li>
			</ul>
			<%
				} else {
					FindUser find = new FindUser();
					String PhanQuyen = find.findType(exUser);
			%>
			<%
				if (PhanQuyen.equals("Admin")) {
			%>
			<ul>
				&emsp;&emsp;<li><a href="Admin.jsp">Welcome <%=exUser%></a></li>
				<li><a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a></li>
			</ul>
			<%
				}
			%>
			<%
				if (PhanQuyen.equals("Student")) {
			%>
			<ul>
				<li><a href="Student.jsp">Welcome <%=exUser%></a></li>
				<li><a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a></li>
			</ul>
			<%
				}
			%>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>