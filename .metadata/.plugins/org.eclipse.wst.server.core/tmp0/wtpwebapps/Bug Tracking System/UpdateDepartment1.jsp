<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="style.css" rel="stylesheet" type="text/css">
<title>Edit Request</title>
<script type="text/javascript">
	function ChkMandatoryField(F, T) {
		var val = F.value;
		if (val == "") {
			alert(T + " is mandatory");
			return false;
		}
	}

	function validate() {

		if (ChkMandatoryField(frm.deptname, 'DepartmentName') == false)
			return false;
		if (ChkMandatoryField(frm.location, 'Location') == false)
			return false;

	}
</script>


</head>
<body class="SC">
	<form action="./UpdateDept" method="post" name="frm">
		<h3 align="center">Update Department</h3>
		<%
Connection con;
PreparedStatement pstmt;
ResultSet rs=null;

String deptname,location;
String deptno=request.getParameter("deptno");

try
{	
	      Class.forName("com.mysql.cj.jdbc.Driver");
       	  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bts", "root", "");
       	  pstmt=con.prepareStatement("select * from department_details where dept_no=?");
       	  pstmt.setString(1,deptno);
    	   rs=pstmt.executeQuery();
}
catch(Exception e)
{
	e.printStackTrace();
}

if(rs!=null){
%>
		<br>
		<table align="center">
			<%
int DisRow=0;
while(rs.next()){
	deptno = rs.getString(1);
	deptname = rs.getString(2);
	location = rs.getString(3);
	
	DisRow++;
	%>
			<tr class=<%=(DisRow%2!=0)? "row_even" : "row_odd" %>>
			<tr>
				<td align="center"></td>
				<td><input type="hidden" value=<%=deptno%> name="deptno"></td>
			</tr>
			<tr>
				<td align="center">Department Name:</td>
				<td><input type="text" value=<%=deptname%> name="deptname"></td>
			</tr>
			<tr>
				<td align="center">Location:</td>
				<td><input type="text" value="<%=location%>" name="location"></td>
			</tr>
			
			<%
			}
			rs.close();
			if(DisRow==0){	
				%>		
				  <tr><th colspan=6>No Jobs found</th></tr>
				<%
			}
}
			%>
		

		</table>
<br>
<br>
<center><input type="submit" value="Update" onClick="return validate()"></center>
	
	</form>
</body>
<jsp:include flush="true" page="Footer.jsp"></jsp:include>
</html>