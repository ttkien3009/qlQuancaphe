<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<%
	String tmp = request.getParameter("tmp");
	if (tmp == null) {
		tmp = "index";	}
%>
<html>
<head>
<meta charset="utf-8">
<title>Quản Lý Sinh Viên</title>
<link rel="stylesheet" type="text/css" href="CSS/Index.css">
<link rel="stylesheet" type="text/css" href="CSS/Login.css">
<link rel="shortcut icon" type="Image/jpg"
	href="Image/Main_Page/favicon.jpg">
</head>
<body>
	<div class="bg">
		<div class="main">
			<div id="header"><%@ include file="include/header.jsp"%></div>
			<div class="menu"><%@ include file="include/menu.jsp"%></div>
			<div class="banner"><%@ include file="include/banner.jsp"%></div>
			<div class="content">
			<%
			 if (tmp.equals("index")==true)
			 {
			%>
			<%@ include file="include/GioiThieu.jsp"%>
			<%
			}
			%>
			<%
			 if (tmp.equals("gt")==true)
			{
			%>
			<%@ include file="include/GioiThieu.jsp"%>
			<%
			}
			%>
			<%
			 if (tmp.equals("lienhe")==true)
			 {
			%>
			<%@ include file="include/LienHe.jsp"%>
			<%
			}
			%>
			</div>
		</div>
		<div class="bottom"><%@ include file="include/footer.jsp"%></div>
	</div>
</body>
</html>