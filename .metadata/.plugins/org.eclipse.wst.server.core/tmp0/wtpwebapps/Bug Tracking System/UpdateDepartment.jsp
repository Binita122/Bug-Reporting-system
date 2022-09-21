<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="./Header.jsp" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="style.css" rel="stylesheet" type="text/css">
<title>Update Department</title>
<script type="text/javascript">
	function Checkfiles() {
		var fup = document.getElementById('my_file_element').value;
		alert(fup);
		if (fup == "") {
			alert("Upload at least one file");
			document.getElementById('my_file_element').focus();
			return false;
		} else if (fup != "") {
			alert("Not Null");
			var fileName = fup;
			var ext = fileName.subString(fileName.lastIndexOf('.') + 1);
			alert(ext);

			if (ext == "gif" || ext == "GIF" || ext == "JPEG" || ext == "jpeg"
					|| ext == "JPG" || ext == "jpg") {
				alert("Correct Format");
				return true;
			} else {
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
		<h3 align="center">Update Department</h3>
		<%
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs = null;

		String dno, dname, location;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bts", "root", "");
			pstmt = con.prepareStatement("select * from department_details");
			rs = pstmt.executeQuery();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(rs!= null){
		%>
		<br>
		<table class="notebook">
			<tr class="row_title">
				<th align="center">Department Name</th>
				<th align="center">Location</th>
				<th align="center">Update</th>
				<%
		int DisRow=0;
		while(rs.next()){
			dno = rs.getString(1);
			dname=rs.getString(2);
			location = rs.getString(3);
			DisRow++;
			%>
			<tr class = <%= (DisRow%2!=0)? "row_even" : "row_odd"%>>
			<td align="center"><%=dname%></td>
			<td align="center"><%=location%></td>
			<td align="center"><a href="UpdateDepartment1.jsp?deptno=<%=dno%>">Edit</a></td>
			
			</tr>
			<%
		}
		rs.close();
		if(DisRow==0){
			%>
			<tr><th colspan=5>No Records Found</th></tr>
			<%
		}
		}
			%>
		
		</table>

<br>	<br>	<br>	<br>	<br>	<br>	<br>
	</form>

</body>
<jsp:include flush="true" page="./Footer.jsp" /> 
</html>