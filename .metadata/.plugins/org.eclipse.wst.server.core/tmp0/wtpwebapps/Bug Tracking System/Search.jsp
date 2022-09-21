<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.bugimg{
height:100px;
width:100px;
}
</style>
</head>

<body class="SC">
<form name="testerForm" action="ViewBugs" method="post">
<center>
<h2><font color="red" face="arial narrow">&nbsp;&nbsp;&nbsp;&nbsp;Search Result</font></h2>
<table border="1" cellpadding="2" cellspacing="0" bordercolor="green">
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
  			<th>View Solution</th>
  			</tr>
  			
  			<%
  			ServletContext sc=getServletContext();
  			String driver=sc.getInitParameter("drivername");
  			String url=sc.getInitParameter("url");
  			String uname=sc.getInitParameter("username");
  			String pwd=sc.getInitParameter("password");
  			HttpSession hs=request.getSession();
  			String s=(String)hs.getAttribute("userid");
  			String b = request.getParameter("bname");
  	try{
  				Class.forName(driver);
  				Connection  con=DriverManager.getConnection(url,uname,pwd);
  				System.out.println(".......11........");
  				ResultSet rs;
  				
  				b = b.replace("!", "!!")
  					.replace("%", "!%")
 					 .replace("_", "!_")
 					  .replace("[", "![");
  				
  				PreparedStatement pstmt=con.prepareStatement("select * from bug_report where bug_name LIKE ? ESCAPE '!'");
  				pstmt.setString(1, "%" +b +"%");
  	
  				rs=pstmt.executeQuery();
 			int i=0;
  		while(rs.next())
  		{			
  			
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
  			<td><a href="./ViewSolution.jsp?bugid=<%=rs.getInt(1)%>">View</a></td>
		</tr>
		
  <%
  i++;
  		}
  		
			%>


</table>

<%
if (i == 0) {
	%>
	<h2>No Record Found</h2>
	<%
}
  	}catch(Exception e){
  		e.printStackTrace();
  	}
%>
</center>
</form>


</body>
</html>