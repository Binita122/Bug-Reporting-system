<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true"%>
<%@ page import="java.sql.*, java.io.*, java.util.Random"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee request</title>

<style>
.button1 {
  background-color: #f44336;
  border: none;
  color: white;
  padding: 5px 15px;
  text-align: center;
  display: inline-block;
  font-size: 14px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>

</head>
<body class="SC">
<div class="center">
<p>	<a href="./Administration.jsp"><img border="0"
		src="./Images/administration.png" height="120"></a><p>
		
		<br>
		<br>
		
		<h2 align="center">Employee Request</h2>
		
		
	<form action="Login.html">
		<%
Connection con;
PreparedStatement pstmt;
ResultSet rs=null;

String f1,to,from,subject,message,tested;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
  	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bts", "root", "");
  	pstmt=con.prepareStatement("select * from employeerequest");
	rs=pstmt.executeQuery();
}catch(Exception e){
	e.printStackTrace();
}
if(rs!=null){
%>
<br>
	<table align="center" width="150%">
	<tr class="row_title">
        <th align="center">f1</th>
		<th align="center">To</th>
		<th align="center">From</th>
		<th align="center">Subject</th>
		<th align="center">Message</th>
		<th align="center">Tested</th>
		</tr>
		<%
		int DisRow=0;
		
		while(rs.next())
		{
		   f1=rs.getString(1);
		   to=rs.getString(2);
		   from=rs.getString(3);
		   subject=rs.getString(4);
		   message=rs.getString(5);
		   tested=rs.getString(6);
		  	   DisRow++;
		%>
		
		<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href=""><%=f1%></a></td>		
		<td align="center"><%=to%></td>
		<td align="center"><%=from%></td>
		<td align="center"><%=subject%></td>
		<td align="center"><%=message%></td>
		<td align="center"><%=tested%></td>
		</tr>
		
		<%
		}
		rs.close();
		if(DisRow==0){
			%>
			<tr><th colspan=6>No Records found</th></tr>
			<%
		}
		}
			%>
		
		
		</table>
	
		<br>
		<br>
		
		<input type="submit" name="logout" value="Logout" class="button1">
				
		
	</form>
</div>
</body>
</html>