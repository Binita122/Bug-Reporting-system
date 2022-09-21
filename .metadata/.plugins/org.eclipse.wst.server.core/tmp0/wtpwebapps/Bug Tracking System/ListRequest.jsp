<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List Requests</title>
<link href="style.css" type="text/css" rel="stylesheet">
<style>
.Button1 {
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
		<p>
			<a href="./Administration.jsp"><img border="0"
				src="./Images/administration.png" height="120"></a>
		<p>
			<br> <br>
		<h2 align="center">Employee List</h2>

		<form action="Login.html">
			<%
			Connection con;
			PreparedStatement pstmt;
			ResultSet rs = null;

			String username, userid, email, address, phno, status;

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts", "root", "");
				pstmt = con.prepareStatement("select * from employee");
				rs = pstmt.executeQuery();
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (rs != null) {
			%>
			<br>
			<table class="notebook" align="center">
				<tr class="row_title">
					<th align="center">userName</th>
					<th align="center">userId</th>
					<th align="center">Email</th>
					<th align="center">Address</th>
					<th align="center">phone No</th>
					<th align="center">status</th>
				</tr>
				<%
				int DisRow = 0;

				while (rs.next()) {
					username = rs.getString(1);
					userid = rs.getString(2);
					email = rs.getString(3);
					address = rs.getString(4);
					phno = rs.getString(5);
					status = rs.getString(6);
					DisRow++;
				%>
				<tr class=<%=(DisRow % 2 != 0) ? "row_even" : "row_odd"%>>
					<td><a href=""><%=username%></a></td>
					<td align="center"><%=userid%></td>
					<td align="center"><%=email%></td>
					<td align="center"><%=address%></td>
					<td align="center"><%=phno%></td>
					<td align="center"><%=status%></td>
				</tr>
				<%
				}
				rs.close();
				if (DisRow == 0) {
				%>
				<tr>
					<th colspan="6">No Records found</th>
				</tr>
				<%
				}
				}
				%>
			</table>
			<br> <br> <input type="submit" name="logout" value="Logout"
				class="Button1">
		</form>


	</div>
</body>
</html>