<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<p align="center"><img src="Images/Header.png" height="220" width="500" align="middle"></p>


<%
HttpSession hs = request.getSession();
hs.invalidate();
%>
<hr>
<br><br><br><br><br><br>
<center><font face="arial narrow"><b> You have been logged out. Click <a href="./Home.jsp"><font color="red">here</font></a> to go Home</b></font></center>
<br><br><br><br><br><br>

</body>
<jsp:include page="./Footer.jsp" />

</html>