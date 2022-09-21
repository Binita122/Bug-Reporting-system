<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page session="true" %>
    <%@ page import="java.sql.*,java.io.*,java.util.Random" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Project</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript">
function ChkMandatoryField(F,T){
	var val= F.value;
	if(val==""){alert(T+" is mandatory");return false;}
}

function validate()
{
	
	if(ChkMandatoryField(proj.pname,'ProjectName')==false) return false;
    if(ChkMandatoryField(proj.description,'Description')==false) return false;
     if(ChkMandatoryField(proj.date,'date')==false) return false;
    if(ChkMandatoryField(proj.duration,'Duration')==false) return false;
    if(ChkMandatoryField(proj.name,'Name')==false) return false;
    if(ChkMandatoryField(proj.address,'Address')==false) return false;
    if(ChkMandatoryField(proj.phone,'Phone')==false) return false;
     if(ChkMandatoryField(proj.mailid,'Mailid')==false) return false; 
     if (proj.duration.value < 0){
			alert("Duration Cannot be negative");
			return false;
			}
     if (proj.phoneno.length < 10){
			alert("Invalid Number");
			return false;
		}
}

</script>

</head>
<body>
<form action="./UpdateProject" method="post" name="proj">
<h3 align="center">Update Project</h3>
<%
Connection con;
PreparedStatement pstmt,pstmt1;
ResultSet rs=null,rs1=null;

String pname,description,date,duration,name,address,phone,email,plead,deptname;
 String pid=request.getParameter("pid");

try{	
	      Class.forName("com.mysql.cj.jdbc.Driver");
       	  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bts", "root", "");
       	  pstmt=con.prepareStatement("select * from project_details where project_no=?");
       	  pstmt.setString(1,pid);
    	  rs=pstmt.executeQuery();


if(rs!=null){
%>
<br>
<table align="center">
<%
int DisRow=0;
while(rs.next()){
   pid=rs.getString("project_no");
   pname=rs.getString("project_name");
   description=rs.getString("project_description");
   date=rs.getString("sdate");
   duration=rs.getString("duration");
   name=rs.getString("clientname");
   address=rs.getString("clientaddress");
   phone=rs.getString("clientphone");
   email=rs.getString("clientemail");
   plead=rs.getString("projectlead");
   deptname=rs.getString("deptname");
   DisRow++;
   
%>
<tr><td align="center"></td><td><input type="hidden" value=<%=pid%> name="pid"></td></tr>
		<tr><td align="center">ProjectName:</td><td><input type="text" value=<%=pname%> name="pname"></td></tr>
		<tr><td align="center">Description:</td><td><textarea cols="30" rows="3" name="description"><%=description%> </textarea></td></tr>
		<tr><td align="center">Submission Date</td><td><input type="text"value=<%=date%> name="date" ></td></tr>
		<tr><td align="center">Duration:</td><td><input type="text"value=<%=duration%> name="duration" ></td></tr>
		<tr><td align="center">Client Name:</td><td><input type="text"value=<%=name%> name="name" ></td></tr>
		<tr><td align="center">Address</td><td><input type="text"value=<%=address%> name="address" ></td></tr>
		<tr><td align="center">phoneNo:</td><td><input type="text"value=<%=phone%> name="phoneno" ></td></tr>
		<tr><td align="center">EmailId:</td><td><input type="text"value=<%=email%> name="emailid" ></td></tr>
		<tr><td>Department Name:</td>
<td><select name="deptname">
<option>deptname</option>
<%
pstmt=con.prepareStatement("select * from department_details");

rs=pstmt.executeQuery();
while(rs.next()){
%>
<option><%=rs.getString("dept_name") %></option>
<%
}
%>
</select>
</td>
</tr>


<tr>
<td>Project Lead:</td>
<td><select name="plead">
<option>plead</option>
<%
pstmt=con.prepareStatement("select * from employee_details");
rs=pstmt.executeQuery();
while(rs.next()){
%>
<option><%=rs.getString("loginid")%></option>
<%
}
%>
</select>
</td>
</tr>
<%
	
if(DisRow==0){	
%>
<tr><th colspan=6>No Jobs found</th></tr>
<%
}
rs.close();	
}
}
}catch(Exception e){
	e.printStackTrace();
}
%>
</table>
<br>
<br>
<center>
<input type="submit" value="Update" onclick="return validate()">

</center>
</form>
<br><br>

</body>
<jsp:include flush="true" page="./Footer.jsp"></jsp:include>
</html>