<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include flush="true" page="Header.jsp"></jsp:include>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Employee</title>
<link href="style.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	function Checkfiles() {

		var fup = document.getElementById('my_file_element').value;
		alert(fup);
		if (fup == "") {
			alert("Upload at least one file");
			document.getElementById('my_file_element').focus();
			return false;
		} else if (fup != "") {
			alert("Not null");
			var fileName = fup;

			var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
			alert(ext);
			if (ext == "gif" || ext == "GIF" || ext == "JPEG" || ext == "jpeg"
					|| ext == "jpg" || ext == "JPG")

			{
				alert("correct format");
				return true;

			}

			else

			{

				alert("Upload Gif or Jpg images only");
				document.getElementById('my_file_element').focus();
				return false;

			}
			return false;
		}
	}
</script>

</head>
<body class="SC">
	<form name="get ElementById">
		<h3 align="center">Update Employee</h3>

		<%
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs = null;

		String ecode, fname, lname, gender, dob, qualification, address, phoneno, mobileno, emailid, doj, role, salary, dno;

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
		<th align="center">Salary</th>
		<th align="center">DName</th>
		<th align="center">Update</th>
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
		   salary=rs.getString("basicsalary");
		   dno=rs.getString("dno");
		   
		   DisRow++;
		%>
		
		<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		
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
		<td align="center"><%=salary%></td>
		<td align="center"><%=dno%></td>
		<td align="center"><a href="UpdateEmployee1.jsp?ecode=<%=ecode%>">Update</a></td>
		</tr>
		<%
		}
		rs.close();		
		if(DisRow==0){
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