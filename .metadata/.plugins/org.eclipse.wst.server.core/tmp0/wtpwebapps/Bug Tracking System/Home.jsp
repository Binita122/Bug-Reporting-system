<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%
String msg = null;
msg = request.getParameter("msg");
%>
<head>
<jsp:include page="./base.html" /> 
<meta charset="ISO-8859-1">

<script type="text/javascript">
	function check() {
<%if (request.getParameter("msg") != null) {%>
	var msg = "Please Check Your UserId and password";
		alert(msg);
<%}

	if (request.getParameter("msg1") != null) {%>
	var msg1 = "Permission not granted";
		alert(msg1);
<%}%>
	}
</script>


<title>Home</title>
</head>
<h3></h3>
<body onload="return check()">
		<table width="100%" bgcolor="#FFFFFF" >
			<tr>
				<td><img src="Images/TestTrack_Pro.gif" height="150"
					alt="Header Image" bgcolor=""></td>
				<td><font face="arial narrow" size="10px" color="#4D2661"><b>Bug
							Tracking System</b></font></td>
			</tr>
			</table>
			<hr>
			<br><br>
	
		<table width="50%" align="right">
<tr>
<td height="50px">&nbsp;</td>
</tr>
<tr>

		<td align="center"><jsp:include page="./Login.html" /></td>
		</tr>
</table>
		

</body>
<jsp:include page="./Footer.jsp" />
</html>