<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Response List</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>

<script type="text/javascript" language="javascript">
	function checkfiles() {
		var fup = document.getElementById('my_file_element').value;
		alert(fup);

		if (fup == "") {
			alert("Upload at least one file");
			document.getElementById('my_file_element').focus();
			return false;
		} else if (fup != "") {
			alert("Not Null");
			S
			var fileName = fup;
			var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
			alert(ext);

			if (ext == "gif" || ext == "GIF" || ext == "JPEG" || ext == "jpeg"
					|| ext == "jpg" || ext == "JPG") {
				alert("correct format");
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
		<h3 align="center">Admin Response List</h3>

		<%
Connection con;
PreparedStatement pstmt;
ResultSet rs=null;

String f1,message,reassignto,newstatus,tested;

try
{	
	      Class.forName("com.mysql.cj.jdbc.Driver");
       	  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bts", "root", "");
       	  pstmt=con.prepareStatement("select * from adminresponse");
    	  rs=pstmt.executeQuery();
}
catch(Exception e)
{
	e.printStackTrace();
}
if(rs!=null)
{
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
int DisRow=0;

while(rs.next())
{
   f1=rs.getString(1);
   message=rs.getString(2);
   reassignto=rs.getString(3);
   newstatus=rs.getString(4);
   tested=rs.getString(5);
   DisRow++;
%>
			<tr class=<%=(DisRow%2!=0)? "row_even":"row_odd" %>>
				<td><a href=""><%=f1%></a></td>
				<td align="center"><%=message%></td>
				<td align="center"><%=reassignto%></td>
				<td align="center"><%=newstatus%></td>
				<td align="center"><%=tested%></td>
			</tr>
			<%
}
rs.close();
if(DisRow == 0){
		%>
		<tr><th colspan="5">No Record Found</th></tr>
		<%
}
}
		%>

		</table>


	</form>

</body>
</html>