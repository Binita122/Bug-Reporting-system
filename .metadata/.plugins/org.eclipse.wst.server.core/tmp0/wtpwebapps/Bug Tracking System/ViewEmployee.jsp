<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include flush="true" page="Header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">


</head>
<body class="SC">
	<form name="get ElementById">
		<h3 align="center">Employee Details</h3>

		<%
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs = null;

		String ecode, fname, lname, gender, dob, qualification, address, phoneno, mobileno, emailid, doj, role;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts", "root", "");
			pstmt = con.prepareStatement("select * from employee_details");
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (rs != null){
		%>
		<br>
		<table class="notebook" align="center">
			<tr class="row_title">
				<th align="center">EmployeeName</th>
				<th align="center">Gender</th>
				<th align="center">Date Of Birth</th>
				<th align="center">Qualification</th>
				<th align="center">Address</th>
				<th align="center">PhoneNo</th>
				<th align="center">MobileNo</th>
				<th align="center">EmailId</th>
				<th align="center">Date Of Joining</th>
				<th align="center">Role</th>
				<th align="center">Delete</th>
			</tr>
			<%
int DisRow=0;


while(rs.next())
{
   ecode=rs.getString("e_code");
   fname=rs.getString("fname");
   lname=rs.getString("lname");
   gender=rs.getString("gender");
   dob=rs.getString("dob");
   qualification=rs.getString("qualification");
   address=rs.getString("address");
   phoneno=rs.getString("phoneno");
   mobileno=rs.getString("mobileno");
   emailid=rs.getString("emailid");
   doj=rs.getString("doj");
   role=rs.getString("role");
   
   DisRow++;
%>
			<tr class=<%=(DisRow%2!=0)? "row_even" : "row_odd"%>>

				<td align="center"><%=fname%><%=lname%></td>
				<td align="center"><%=gender%></td>
				<td align="center"><%=dob%></td>
				<td align="center"><%=qualification%></td>
				<td align="center"><%=address%></td>
				<td align="center"><%=phoneno%></td>
				<td align="center"><%=mobileno%></td>
				<td align="center"><%=emailid%></td>
				<td align="center"><%=doj%></td>
				<td align="center"><%=role%></td>
				<td align="center"><a href="DeleteEmp?ecode=<%=ecode%>">Delete</a></td>
			</tr>
			<%
}

		rs.close();		
		if(DisRow==0)
		{	
		%>
		<tr><th colspan=5>No Records found</th></tr>
		<%
		}
		}
		
		%>
		</table>
	</form>

</body>
<jsp:include flush="true" page="./Footer.jsp"></jsp:include>
</html>