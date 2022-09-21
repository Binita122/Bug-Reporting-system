<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*" %>
	<jsp:include page="./TesterHeader.jsp"/>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="./base.html" /> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Bugs</title>
<script src="validation.js" type="text/javascript"></script>

<style type="text/css">
.bugimg{
height:100px;
width:100px;
}
</style>
</head>
<body>
<div class="container">
	<form name="testerForm" action="ViewBugs" onsubmit="return check2()"
	method="post">
	<br>
		<h4 align="center">
			<font color="green"> <%
 if (request.getParameter("msg") != null) {
 %> <%=request.getParameter("msg")%> <%
 }
 %>
			</font>
		</h4>

		<h3 align="center">
			<font color="#FBB117">&nbsp;&nbsp;&nbsp;&nbsp;View
				All Bugs</font>
		</h3>

		<table border="1" cellpadding="2" cellspacing="0" bordercolor="#7952B3">
			<tr>
				<th>Bug Name</th>
				<th>Description</th>
				<th>Bug Type</th>
				<th>Bug Level</th>
				<th>Priority</th>
				<th>Project Name</th>
				<th>Bug Image</th>
				<th>Tester Code</th>
				<th>Bug Date</th>
				<th>Employee Code</th>
				<th>Status</th>
				<th>Update</th>
				<th>View</th>

			</tr>
			<%
			ServletContext sc = getServletContext();
			String driver = sc.getInitParameter("drivername");
			String url = sc.getInitParameter("url");
			String uname = sc.getInitParameter("username");
			String pwd = sc.getInitParameter("password");
			try {
				Class.forName(driver);
				Connection con = DriverManager.getConnection(url, uname, pwd);
				//System.out.println(".......11........");
				ResultSet rs;
				HttpSession hs = request.getSession();
				String userid = (String) hs.getAttribute("userid");
				System.out.print("userid" + userid);
				PreparedStatement pstmt = con
				.prepareStatement("select * from bug_report where testercode=? and (status1='resolve' or status1='')");
				pstmt.setString(1, userid);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
			%>

			<tr>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				<%String imageName = rs.getString(8);
  			if(imageName!=""){
  				%>
  				<!-- to open image in blank page (zooming) -->
  				<td><a target="_blank" href="BugImages/<%=imageName%>">
  				<img src="BugImages/<%=imageName%>" class="bugimg" id="bugimgId"></a></td>
  				<%
  			}
  			
  			%>
				
				<td><%=rs.getString(9)%></td>
				<td><%=rs.getString(10)%></td>
				<td><%=rs.getString(11)%></td>
				<td><%=rs.getString(12)%></td>
		 		
				<%
				
				if (rs.getString(11).equals("")) {
				%>
				<td>&nbsp;</td>

				<%
				} else {
				%>
				<td><a href="./UpdateBug1.jsp?bugid=<%=rs.getInt(1)%>">Update</a></td>
				<%
				}
				%>

				<td><a href="./modal.jsp?bugid=<%=rs.getInt(1)%>"><i class="bi bi-eye-fill" ></i></a></td>
			</tr>
			
	
			<%
			
			} //while
				
			

					
			} catch (Exception e) {
			e.printStackTrace();
			}
	
		
			%>
		</table>

	</form>
</div>
</body>
<jsp:include page="./Footer.jsp"></jsp:include>
</html>