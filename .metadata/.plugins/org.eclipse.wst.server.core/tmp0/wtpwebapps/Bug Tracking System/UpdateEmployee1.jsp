<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit request</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript">
	function ChkMandatoryField(F, T) {
		var val = F.value;
		if (val == "") {
			alert(T + " is mandatory");
			return false;
		}
	}

	function validate() {

		if (ChkMandatoryField(frm.salary, 'BasicSalary') == false)
			return false;
		if (ChkMandatoryField(frm.ecode, 'e_code') == false)
			return false;
		if (ChkMandatoryField(frm.fname, 'fname') == false)
			return false;
		if (ChkMandatoryField(frm.lname, 'lname') == false)
			return false;
		if (ChkMandatoryField(frm.gender, 'gender') == false)
			return false;
		if (ChkMandatoryField(frm.dob, 'dob') == false)
			return false;
		if (ChkMandatoryField(frm.qualification, 'qualification') == false)
			return false;
		if (ChkMandatoryField(frm.address, 'address') == false)
			return false;
		if (ChkMandatoryField(frm.mobileno, 'mobileno') == false)
			return false;
		if (ChkMandatoryField(frm.emailid, 'emailid') == false)
			return false;
		if (ChkMandatoryField(frm.role, 'role') == false)
			return false;
		if (ChkMandatoryField(frm.dno, 'dno') == false)
			return false;
		

	}
</script>

</head>
<body>
	<form action="./UpdateEmp" method="post" name="frm">
		<h3 align=center>UPDATE EMPLOYEE</h3>
		<%
		Connection con;
		PreparedStatement pstmt, pstmt1;
		ResultSet rs = null, rs1 = null;

		String ecode, fname, lname, gender, dob, qualification, address, phoneno, mobileno, emailid, doj, role, salary, dno;
		ecode = request.getParameter("ecode");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts", "root", "");
			pstmt = con.prepareStatement("select * from employee_details where e_code=?");
			pstmt.setString(1, ecode);
			rs = pstmt.executeQuery();

			if (rs != null) {
		%>
		<br>

		<table class="notebook" align="center">
			<%
			int DisRow = 0;

			while (rs.next()) {
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
				salary = rs.getString("basicsalary");
				dno = rs.getString("dno");

				DisRow++;
			%>
			<tr class=<%=(DisRow % 2 != 0) ? "row_even" : "row_odd"%>>
			<tr>
				<td align="center"></td>
				<td><input type="hidden" value=<%=ecode%> name="ecode"></td>
			</tr>
			<tr>
				<td align="center">Employee Name:</td>
				<td><input type="text" value=<%=fname%> <%=lname%>
					name="empname" disabled="true"></td>
			</tr>
			<tr>
				<td align="center">Gender:</td>
				<td><input type="text" value=<%=gender%> name="gender"
					disabled="true"></td>
			</tr>
			<tr>
				<td align="center">Date of Birth</td>
				<td><input type="text" value=<%=dob%> name="dob"
					disabled="true"></td>
			</tr>
			<tr>
				<td align="center">Qualification:</td>
				<td><input type="text" value=<%=qualification%>
					name="qualification" disabled="true"></td>
			</tr>
			<tr>
				<td align="center">Address:</td>
				<td><input type="text" value=<%=address%> name="address"
					disabled="true"></td>
			</tr>
			<tr>
				<td align="center">PhoneNo</td>
				<td><input type="text" value=<%=phoneno%> name="phoneno"
					disabled="true"></td>
			</tr>
			<tr>
				<td align="center">MobileNo:</td>
				<td><input type="text" value=<%=mobileno%> name="mobileno"
					disabled="true"></td>
			</tr>
			<tr>
				<td align="center">EmailId:</td>
				<td><input type="text" value=<%=emailid%> name="emailid"
					disabled="true"></td>
			</tr>
			<tr>
				<td align="center">Date Of Joining:</td>
				<td><input type="text" value=<%=doj%> name="doj"
					disabled="true"></td>
			</tr>
			<tr>
				<td align="center">Role:</td>
				<td><input type="text" value=<%=role%> name="role"
					disabled="true"></td>
			</tr>
			<tr>
				<td align="center">Basic Salary:</td>
				<td><input type="text" name="bsalary" value=<%=salary%>></td>
			</tr>
			<tr>
				<td align="center">Department Name</td>
				<td><select name="depname">
						<%
						pstmt = con.prepareStatement("select * from department_details");
						rs = pstmt.executeQuery();
						%>
						<option>---Select---</option>
						<%
						while (rs.next()) {
						%>
						
						<option><%=rs.getString("dept_name")%></option>
						<%} %>
				</select> 
				<%
 }
 rs.close();
 if (DisRow == 0) {
 %>
			<tr>
				<th colspan=6>No Jobs found</th>
			</tr>
			<%
			}
			}

			} catch (Exception e) {
			e.printStackTrace();
			}
		%>

		</table>
		<br>
		<br>
		<center>
		<input type="submit"value="Update" onClick="return validate()">
		</center>
	</form>
</body>
<jsp:include flush="true" page="./Footer.jsp"></jsp:include>
</html>