<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include flush="true" page="./Header.jsp"></jsp:include>	
	<%@ page import="java.sql.*"%>
	<link href="style.css" rel="stylesheet" type="text/css">
<title>Employee Permission</title>
<jsp:include page="./base.html" /> 

<script type="text/javascript">
	function SeekersDetails() {
		var a = document.form1.userid.value;
		alert(a);
		window.location.href = "./EmployeePermission.jsp?msg=" + a;
		System.out.println("msg3 " + request.getParameter("msg"));
	}
</script>

<script type="text/javascript">
	function check(fname) {
		window.open(fname);
		return false;
	}
</script>

</head>
<body class="SC">
	<form name="form1" method="get" action="./EmployeePermisssion">
		<h3 align="center">
			Employee Details</h3>
		<%
		String ecode, fname, lname, gender, dob, qualification, address, phoneno, mobileno, emailid, doj, role;
		try {

			Connection con;
			Statement st;
			Class.forName("com.mysql.cj.jdbc.Driver");
			String s = "jdbc:mysql://localhost:3306/bts";
			con = DriverManager.getConnection(s, "root", "");
			st = con.createStatement();
			String q = "select p.username,p.middlename,p.fathername,r.resumepath from zcs_personal p,resume r,zcs_logins s where s.userid=p.username and p.resumeid=r.rid and s.permission='y'";
			ResultSet rs = st.executeQuery("select * from employee_details where permission='n'");
			
		%>
		

		<table border="1">
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
				<th align="center">Accept</th>
				
				<%
				int DisRow = 0;
				int i = 0;
				while (rs.next()) {
					System.out.println("---executed--");

					ecode = rs.getString("e_code");
					fname = rs.getString("fname");
					lname = rs.getString("lname");
					gender = rs.getString("gender");
					dob = rs.getString("dob");
					qualification = rs.getString("qualification");
					address = rs.getString("address");
					phoneno = rs.getString("phoneno");
					mobileno = rs.getString("mobileno");
					emailid = rs.getString("emailid");
					doj = rs.getString("doj");
					role = rs.getString("role");
					DisRow++;
				%>
			
			<tr class=<%=(DisRow % 2 != 0) ? "row_even" : "row_odd"%>>
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

				<td><input type="checkbox" name="list-<%=i%>"
					value="<%=rs.getString(1)%>"></td>
					
			</tr>
			<%
			i++;
			}

			rs.close();
			if (DisRow == 0) {
			%>
			<tr align="center">
				<td colspan="9" align="center">No Records Found</td>
			</tr>
			<%
			}
			%>
			
			<%
			if (i != 0) {
			%>
			<tr></tr>
			<tr align="center">
				<td colspan="11"><input type="hidden" name="size" value="<%=i%>">

					<button type="submit" class="btn btn-danger" value="submit">Submit</button></td>
			</tr>
			<%
			
			}
			%>
			
			<%
			
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
			</table>

			</form>
</body>
	</html>