<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="menu.css" type="text/css">




<title>Tester Header</title>
<script type="text/javascript">
sfHover = function() {
   var sfEls = document.getElementById("nav").getElementsByTagName("LI");
   for (var i=0; i<sfEls.length; i++) {
      sfEls[i].onmouseover=function() {
         this.className+=" over";
      }
      sfEls[i].onmouseout=function() {
         this.className=this.className.replace(new RegExp(" over\\b"), "");
      }
   }
}
if (window.attachEvent) window.attachEvent("onload", sfHover);

</script>

</head>
<body class="SC">
	<form>
		<table width="100%" border="0">
			<tr>
				<td align=""><img alt="HeaderImage" src="./Images/Header.png"
					height="120"></td>
				<td align=""><font face="arial narrow" size="10px"
					color="#4D2661"><b>Bug Tracking System</b></font></td>
			</tr>
			<tr>
				<%
				HttpSession hs = request.getSession();
				String uname = (String) hs.getAttribute("userid");
				String role = (String) hs.getAttribute("role");
				%>
				<td align="right" valign="bottom" colspan="2"><b> <%
if (("admin").equals(role)) {
%>Welcome,&nbsp;&nbsp; Admin<%
 } else {
 %>Welcome,&nbsp;&nbsp;<%=uname%> <%
 }
 %>
</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>[ <%
if(("admin").equals(role)){
 %><a href="./AdminHome.jsp"> <%
 } else if(("Tester").equals(role)){
 %><a href="./TesterHome.jsp?cat=Tester"> <%
 } else if(("Developer").equals(role)){
 %><a href="./DeveloperHome.jsp?cat=Developer"> <%
 } else if(("HRManager").equals(role)){
 %><a href="./ManagerHome.jsp?cat=HrManager"> <%
 }
 %><font color="#FBC61">Home</font>
								</a> ]</b>&nbsp; <%
 if (role != "user") {
 %><b>[ <a href="./Logout.jsp"><font color="#FBC61">logout</font></a>]</b> <%
 }
 %></td>
		</table>
	</form>
	
	<form>
	<hr>
	<table border="0" align="right">
	<tr>
	<td>
	<ul id="nav">
	<li><a href="#">Open</a>
	<ul id="nav">
	<li><a href="./AssignBug.jsp?cat=Tester">Bug Report</a></li>
       <li><a href="./ViewBugs1.jsp?cat=Tester">View Bugs</a></li>
       <li><a href="./EditProfile.jsp?cat=Tester">Edit Profile</a></li> 
       <li><a href="./ChangePassword.jsp?cat=Tester">Change Password</a></li> 
	</ul>
	</li>
	</ul>
	</td>
	</tr>
	</table>
	<br>
	
	</form>

</body>
</html>