<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page session="true" %>
    <%@ page import="java.sql.*,java.io.*,java.util.Random"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Request List</title>
<link href="style.css" type="text/css" rel="stylesheet">

<script type="text/javascript">
function Checkfiles()
{
	
     var fup = document.getElementById('my_file_element').value;
     alert(fup);
	 if(fup=="")
	 {
	 alert("Upload at least one file");
	 document.getElementById('my_file_element').focus();
	 return false;
	 }
	 else if(fup!="")
	 {
	 alert("Not null");
     var fileName = fup;

     var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
	 alert(ext);
     if(ext == "gif" || ext == "GIF" || ext == "JPEG" || ext == "jpeg" || ext == "jpg" || ext == "JPG")

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
<h3 align=center>Employee Request</h3>
<%


Connection con;
PreparedStatement pstmt;
ResultSet rs=null;

String f1,to,from,subject,message,tested;

try
{	
	      Class.forName("com.mysql.cj.jdbc.Driver");
       	  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bts", "root", "");
       	  pstmt=con.prepareStatement("select * from employeerequest");
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
		<th align="center">to</th>
		<th align="center">from</th>
		<th align="center">subject</th>
		<th align="center">message</th>
		<th align="center">tested</th>
		
		<%
int DisRow=0;
	/*Getting the values from the database*/

	while(rs.next())
	{
	   f1=rs.getString(1);
	   to=rs.getString(2);
	   from=rs.getString(3);
	   subject=rs.getString(4);
	   message=rs.getString(5);
	   tested=rs.getString(6);
	  	   DisRow++;
	%>
	<tr class= <%=(DisRow%2!=0)? "row_even" : "row_odd"%>>
		<td><a href=""><%=f1%></a></td>		
		<td align="center"><%=to%></td>
		<td align="center"><%=from%></td>
		<td align="center"><%=subject%></td>
		<td align="center"><%=message%></td>
		<td align="center"><%=tested%></td>
				
	<%
	}
	rs.close();		
if(DisRow==0)
{	
	%>		
			<tr><th colspan="6">No Records found</th></tr>
	<%
}
}
%>
</table>
</form>
</body>
</html>