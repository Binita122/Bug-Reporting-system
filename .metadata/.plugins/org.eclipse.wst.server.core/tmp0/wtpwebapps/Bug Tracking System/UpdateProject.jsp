<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page session="true" %>
    <%@ page import="java.sql.*,java.io.*,java.util.Random"%>
    <jsp:include flush="true" page="Header.jsp"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="style.css" type="text/css" rel="stylesheet">
<title>UpdateProject</title>

</head>
<body class="SC">
<form name="get ElementById">
<h3 align=center>Update Project</h3>
<%
Connection con;
PreparedStatement pstmt;
ResultSet rs=null;

String pid,pname,description,date,duration,name,address,phone,email,plead,deptname;

try
{	
	      Class.forName("com.mysql.cj.jdbc.Driver");
       	  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bts", "root", "");
       	  pstmt=con.prepareStatement("select * from project_details");
    	   rs=pstmt.executeQuery();
}
catch(Exception e)
{
	e.printStackTrace();
}
if(rs!=null)
{
%>
<br>
	<table class=notebook align=center>
	<tr class=row_title>
        <th align="center">ProjectName</th>
		<th align="center">Submission Date</th>
		<th align="center">Duration</th>
		<th align="center">ClientName</th>
		<th align="center">ClientAddress</th>
		<th align="center">PhoneNo</th>
		<th align="center">EmailId</th>
		<th align="center">ProjectLead</th>
		<th align="center">DeptName</th>
		<th align="center">Update</th>
		</tr>
		<%
		int DisRow=0;
		while(rs.next())
		{
		   pid=rs.getString("project_no");
		   pname=rs.getString("project_name");
		   description=rs.getString("project_description");
		   date=rs.getString("sdate");
		   duration=rs.getString("duration");
		   name=rs.getString("clientname");
		   address=rs.getString("clientaddress");
		   phone=rs.getString("clientphone");
		   email=rs.getString("clientemail");
		   plead=rs.getString("projectlead");
		   deptname=rs.getString("deptname");
		   DisRow++;
		%>
		<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td align="center"><%=pname%></td>
		<td align="center"><%=date%></td>
		<td align="center"><%=duration%></td>
		<td align="center"><%=name%></td>
		<td align="center"><%=address%></td>
		<td align="center"><%=phone%></td>
		<td align="center"><%=email%></td>
		<td align="center"><%=plead%></td>
		<td align="center"><%=deptname%></td>
		<td align="center"><a href="UpdateProject1.jsp?pid=<%=pid%>">Update</a></td>
		</tr>
		<%
		}
		rs.close();		
		if(DisRow==0)
		{	
		%>
		<tr>
		<th colspan=5>No Records found</th>
		</tr>
		<%
		}
}
		%>
		</table>
</form>
<br><br><br>
</body>
<jsp:include flush="true" page="./Footer.jsp"></jsp:include>
</html>