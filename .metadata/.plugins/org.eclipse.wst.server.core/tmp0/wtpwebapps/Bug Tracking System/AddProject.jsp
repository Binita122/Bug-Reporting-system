<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true"%>
<%@ page errorPage="error.jsp" %>
<%@ page import="java.sql.*, java.util.Random ,java.sql.SQLIntegrityConstraintViolationException"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Add Project</title>
<jsp:include flush="true" page="Header.jsp"></jsp:include>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function FieldCheck(F, T) {
		var val = F.value;
		if (val == "") {
			alert(T + "is mandatory");
			return false;
		}
	}

	function validate() {
		if (FieldCheck(proj.pname, 'ProjectName') == false)
			return false;
		if (FieldCheck(proj.description, 'Description') == false)
			return false;
		if (FieldCheck(proj.sdate, 'date') == false)
			return false;
		if (proj.duration.value < 0){
			alert("Duration Cannot be negative");
			return false;
			}
		if (FieldCheck(proj.duration, 'Duration') == false)
			return false;
		
		if (FieldCheck(proj.cname, 'Name') == false)
			return false;
		if (FieldCheck(proj.caddress, 'Address') == false)
			return false;
		if (FieldCheck(proj.phone, 'Phone') == false)
			return false;
		if (FieldCheck(proj.mailid, 'Mailid') == false)
			return false;
		if (proj.phoneno.length < 10){
			alert("Invalid Number");
			return false;
		}

	}
</script>

<script type="text/javascript" src="dateget.js"></script>

</head>
<body class="SC">

<br>
<br>
<form name="proj" action="./AddProj">
	<center>
		<h3>Add Project</h3>
	</center>
	<br>
	<br>
	<center>
		<table>
	
			<tr>
			
				<td>&nbsp;Project Name :</td>
				<td><input type="text" name="pname"></td>
			</tr>
			<tr>
				<td>&nbsp;Project Description:</td>
				<td><textarea name="description" cols="20" rows="3"
						name="description"></textarea></td>
			</tr>

			<tr>
				<td>&nbsp;Date</td>
				<td><input type="date" name="sdate" value=""></td>
			</tr>

			<tr>
				<td>&nbsp;Duration:</td>
				<td><input type="text" name="duration" value=""></td>
			</tr>

			<tr>
				<td>&nbsp;Client Name:</td>
				<td><input type="text" name="cname" value=""></td>
			</tr>


			<tr>
				<td>&nbsp;Client Address</td>
				<td><textarea name="caddress" name="caddress" cols="20"
						rows="3"></textarea></td>
			</tr>

			<tr>
				<td>&nbsp;Phone No:</td>
				<td><input type="text" name="phoneno" value=""  pattern="98[0-9]{8}"></td>
			</tr>

			<tr>
				<td>&nbsp;EmailId:</td>
				<td><input type="email" name="mailid" value=""></td>
			</tr>

			<tr>
				<td>&nbsp;Department Name:</td>
				<td><select name="deptname">
						<%
						Connection con;
						PreparedStatement pstmt, pstmt1;
						ResultSet rs = null, rs1 = null;
						try {
							Class.forName("com.mysql.cj.jdbc.Driver");
							con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts", "root", "");
							pstmt = con.prepareStatement("select * from department_details");

							rs = pstmt.executeQuery();
							while (rs.next()) {
							%>
							<option><%=rs.getString("dept_name")%></option>
							<%
							}
							%>
							
							</select>
							</td>
							</tr>
							<tr>
							<td>Project Lead:</td>
							<td><select name="plead">
							<%
							pstmt=con.prepareStatement("select * from employee_details");
					    	rs=pstmt.executeQuery();
					    	while(rs.next())
					    	{
							%>
							<option><%=rs.getString("loginid") %></option>
							<%
					    	}
							%>
							</select>
							</td>
							</tr>
						<%
						} catch (Exception e) {
						e.printStackTrace();

						}
						%>
		</table><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
		<button type="submit" name="submit" onclick="return validate()" >Submit</button>
		
	</center>

</form>

</body>
<br>
<br>
<jsp:include flush="true" page="Footer.jsp"></jsp:include>







</html>