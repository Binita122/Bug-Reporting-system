<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="./DeveloperHeader.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Solutions</title>
<jsp:include page="./base.html" /> 
</head>
<body>
<div class="container">
	<form name="testerForm" action="ViewBugs" onsubmit="return check()"
		method="post">
		
		<br>
		<center>
			<h4 align="center">
				<font color="green"> <%
 if (request.getParameter("msg") != null) {
 %> <%=request.getParameter("msg")%> <%
 }
 %>
				</font>
			</h4>

			<h3>
				<font color="#FBB117" face="arial narrow">&nbsp;&nbsp;&nbsp;&nbsp;View
					Solution</font>
			</h3>
<hr>
				<%
				ServletContext sc = getServletContext();
				String driver = sc.getInitParameter("drivername");
				String url = sc.getInitParameter("url");
				String uname = sc.getInitParameter("username");
				String pwd = sc.getInitParameter("password");
				HttpSession hs = request.getSession();
				String s = request.getParameter("bugid");
				try {
					Class.forName(driver);
					Connection con = DriverManager.getConnection(url, uname, pwd);
					System.out.println(".......11........");
					ResultSet rs;
					PreparedStatement pstmt = con.prepareStatement("select solution from bug_solution where bugno=?");
					pstmt.setString(1, s);
					rs = pstmt.executeQuery();
					int i = 0;
					while (rs.next()) {
				%>
					<div>
					<%=rs.getString("solution")%>
					</div>
			
				<%
				System.out.println(".......12........");

				i = i + 1;
				} //while
				if (i == 0) {
				%>
	
				<p align="center">No Records Found</p>
				

			<%
			}
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</center>
	</form>
	</div>
</body>
<jsp:include page="./Footer.jsp" />
</html>