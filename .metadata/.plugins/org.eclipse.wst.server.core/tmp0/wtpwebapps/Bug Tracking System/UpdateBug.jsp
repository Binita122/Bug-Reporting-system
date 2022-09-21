<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<jsp:include page="./DeveloperHeader.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bug Update</title>

<script>
	function check() {
		if (testerForm.bug_type.value == '') {
			window.alert("Bug Type is empty !");
			return false;
		}
		if (testerForm.bug_level.value == '') {
			window.alert("Bug Level is empty !");
			return false;
		}
		if (testerForm.priority.value == '') {
			window.alert("Bug Priority is empty !");
			return false;
		}
		if (testerForm.pname.value == '') {
			window.alert("Project name is empty !");
			return false;
		}
		if (testerForm.tester_code.value == '') {
			window.alert("Tester code is empty !");
			return false;
		}
		if (testerForm.bug_date.value == '') {
			window.alert("Bug Date is empty !");
			return false;
		}
		if (testerForm.e_code.value == "select") {
			window.alert("Employee Code is empty !");
			return false;
		}
		if (testerForm.status.value == "select") {
			window.alert("Select Status !");
			return false;
		}

	}
</script>
</head>
<body>
	<form name="testerform" action="UpdateBugReport"
		onsubmit="return check()" method="post">
		<center>
			<h3>
				<font color="#D02090" size="5px">&nbsp;&nbsp;&nbsp;&nbsp;Update
					Bug</font>
			</h3>
			<table border="0" cellpadding="2">
				<%
				ServletContext sc = getServletContext();
				String driver = sc.getInitParameter("drivername");
				String url = sc.getInitParameter("url");
				String uname = sc.getInitParameter("username");
				String pwd = sc.getInitParameter("password");
				int bugid;
				bugid = Integer.parseInt(request.getParameter("bugid"));
				try {
					Class.forName(driver);
					Connection con = DriverManager.getConnection(url, uname, pwd);
					System.out.println(".......11........");
					ResultSet rs;

					PreparedStatement pstmt1 = con.prepareStatement("select * from bug_report where bugno=?");
					pstmt1.setInt(1, bugid);
					rs = pstmt1.executeQuery();
					while (rs.next()) {
				%>
				<tr>
					<td align="right"><font>Bug_Name</font></td>
					<td><input type="text" name="bug_name"
						value="<%=rs.getString(2)%>"></td>
				</tr>
				<tr>
					<td align="right"><font>Description</font></td>
					<td><textarea name="Description"><%=rs.getString(3)%></textarea></td>
				</tr>
				<tr>
					<td align="right"><font>Bug_type</font></td>
					<td><input type="text" name="bug_type"
						value="<%=rs.getString(4)%>"></td>
				</tr>
				<tr>
					<td align="right"><font>Bug_level</font></td>
					<td><input type="text" name="bug_level"
						value="<%=rs.getString(5)%>"></td>
				</tr>
				<tr>
					<td align="right"><font>Priority</font></td>
					<td><input type="text" name="priority"
						value="<%=rs.getString(6)%>"></td>
				</tr>
				<tr>
					<td align="right"><font>Project Name</font></td>
					<td><input type="text" name="pname"
						value="<%=rs.getString(7)%>"></td>
				</tr>
				<tr>
					<td align="right"><font>Bug_Image</font></td>
					<td><input type="image" name="image" value="<%=rs.getString(8) %>"></td>
				</tr>
				<tr>
					<td align="right"><font>Tester Code</font></td>
					<td><input type="text" name="tester_code"
						value="<%=rs.getString(9)%>"></td>
				</tr>
				<tr>
					<td align="right"><font>Bug Date</font></td>
					<td><input type="text" name="bug_date"
						value="<%=rs.getString(10)%>"></td>
				</tr>
				<tr>
					<td align="right"><font>Employee code</font></td>
					<td><input type="text" name="e_code"
						value="<%=rs.getString(11)%>"></td>
				</tr>
				<tr>
					<td align="right"><font>Tester Status</font></td>
					<td><input type="text" name="status"
						value="<%=rs.getString(12)%>"></td>
				</tr>
				<tr>
					<td align="right"><font>Rectified Date</font></td>
					<td><input type="date" name="bug_rectified"></input></td>
				</tr>
				<%
				}
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
				<tr>
					<td align="right"><font>Status</font></td>

					<td><select name="Status">
							<option value="select">----Select----</option>
							<option>Resolve</option>
							<option>Completed</option>

					</select></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="hidden"
						name="bugid" value="<%=bugid%>"></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="submit"
						value="submit"></td>
				</tr>
			</table>
		</center>

	</form>
</body>
<jsp:include page="./Footer.jsp"/>
</html>