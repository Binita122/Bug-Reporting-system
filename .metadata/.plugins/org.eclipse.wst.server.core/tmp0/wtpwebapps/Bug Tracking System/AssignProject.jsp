<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<jsp:include page="./ManagerHeader.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign Project</title>

<script type="text/javascript" language="javascrpt">
	function check() {

		if (Assignproject.pname.value == "select") {
			window.alert("Select Project Name!");
			return false;
		}

		if (Assignproject.e_code.value == "select") {
			window.alert("Select Employee Code!");
			return false;
		}
		if (Assignproject.role.value == '') {
			window.alert("role is Empty !");
			return false;
		}
	}
</script>
</head>
<body>
<center>
	<%
	String s = request.getParameter("msg");
	if (s == null)
		s = "";
	%>
	</center>
	<form action="AssignProject" name="AssignProject"
		onsubmit="return check()">
		<p>
			<font color="red"><%=s%></font>
		</p>
		<center>
			<h3>
				<font color="#D02090" size="5px">&nbsp;&nbsp;&nbsp;&nbsp;Assign Project</font>
			</h3>
			<table border="0" cellpadding="2">
				<tr>
					<td align="right"><font size="4px">Project Name</font></td>

					<td>
						<%
						ServletContext sc = getServletContext();
						String driver = sc.getInitParameter("drivername");
						String url = sc.getInitParameter("url");
						String uname = sc.getInitParameter("username");
						String pwd = sc.getInitParameter("password");
						try {
							Class.forName(driver);
							Connection con = DriverManager.getConnection(url, uname, pwd);
							ResultSet rs, rs1;
							PreparedStatement pstmt = con.prepareStatement("select loginid from employee_details");
							rs = pstmt.executeQuery();

							PreparedStatement pstmt1 = con.prepareStatement("select project_name from project_details");
							rs1 = pstmt1.executeQuery();
						%> <select name="pname">
							<option value="select">---select---</option>
							<%
							while (rs1.next()) {
							%>

							<option><%=rs1.getString(1)%></option>
							<%
							}
							%>
					</select>
					</td>
				</tr>

				<tr>
					<td align="right"><font size="4px">Employee code</font></td>

					<td><select name="e_code">
							<option value="select">---select---</option>
							<%
							while (rs.next()) {
							%>
							<option><%=rs.getString(1)%></option>
							<%
							}
							} catch (Exception e) {
							e.printStackTrace();
							}
							%>
					</select></td>
				</tr>

				<tr>
					<td align="right"><font size="4px">Role</font></td>
					<td><input type="text"
						name="role"></td>
</tr>

<tr>
<td align="center" colspan="2"><input type="submit" value="submit"></td>
</tr>


</table>
</center>

</form>

</body>
<jsp:include page="./Footer.jsp"/>
</html>