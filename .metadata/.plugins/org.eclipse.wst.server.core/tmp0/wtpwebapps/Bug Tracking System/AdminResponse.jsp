<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css" type="text/css" >
<script type="text/javascript" src="Images/validate.js"></script>
<title>Admin Response</title>

</head>

<body class="SC">
<a href="Employee.jsp"><img src="bug.jpg"
	alt="image"></a>
	<form action="Login.html">
		<h3 align="center">Admin Response</h3>
		<%
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs = null;

		String f1, message, reassignto, newstatus, tested;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts", "root", "");
			pstmt = con.prepareStatement("select * from adminresponse");
			rs = pstmt.executeQuery();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		if (rs != null) {
		%>
		<br>
		<table class="notebook" align="center">
			<tr class="row_title">
				<th align="center">f1</th>
				<th align="center">Message</th>
				<th align="center">Reassign To</th>
				<th align="center">New Status</th>
				<th align="center">Tested</th>
			</tr>
			<%
			int DisRow = 0;
			while (rs.next()) {
				f1 = rs.getString(1);
				message = rs.getString(2);
				reassignto = rs.getString(3);
				newstatus = rs.getString(4);
				tested = rs.getString(5);
				DisRow++;
			%>
			<tr class=<%=(DisRow % 2 != 0) ? "row_even" : "row_odd"%>>
				<td><a href=""><%=f1%></a></td>
				<td align="center"><%=message%></td>
				<td align="center"><%=reassignto%></td>
				<td align="center"><%=newstatus%></td>
				<td align="center"><%=tested%></td>
				<%
				}
				rs.close();
				if (DisRow == 0) {
				%>
			
			<tr>
				<th colspan=5>No Records found</th>
			</tr>

			<%
			}
			}
			%>

		</table>
		<table align="right">
		<tr>
		<td><input type="submit" name="logout" Value="Logout"></td></tr>
		
		</table>
	</form>

</body>
</html>