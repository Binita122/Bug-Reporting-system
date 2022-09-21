<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <jsp:include page="./ManagerHeader.jsp" /> 
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <link rel="stylesheet" href="testerstyle.css" type="text/css">
    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">

<title>Assign Bug</title>


<script type="text/javascript" language="javascript">
function check(){
	if(testerForm.bug_name.value == ''){
		window.alert("Bug Name is empty !");
		return false;
	}
	if(testerForm.bug_type.value == ''){
		window.alert("Bug Type is empty !");
		return false;
	}
	if(testerForm.bug_level.value == ''){
		window.alert("Bug Level is empty !");
		return false;
	}
	if(testerForm.priority.value == ''){
		window.alert("Bug Priority is empty !");
		return false;
	}
	
	if(testerForm.tester_code.value=='')
	{
		window.alert("Tester code is empty !");
		return false;
	}
	if(testerForm.bug_date.value=='')
	{
		window.alert("Bug Date is empty !");
		return false;
	}
	if(testerForm.e_code.value=="select")
	{
		window.alert("Employee Code is empty !");
		return false;
	}
	if(testerForm.status.value=="select")
	{
		window.alert("Select Status !");
		return false;
	}
}

function fileValidation() {
    var fileInput =
        document.getElementById('image');
     
    var filePath = fileInput.value;
 
    // Allowing file type
    var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
     
    if (!allowedExtensions.exec(filePath)) {
        alert('Invalid file type');
        fileInput.value = '';
        return false;
    }
</script>

<script type="text/javascript" src="dateget.js">
</script>
</head>

<body>
<form name="testerForm" action="AssignBug" onSubmit="return check()" method="post" enctype="multipart/form-data">
<br>
<center>
<h5 align="center"><font color="red">
<%
HttpSession hs = request.getSession();
String s1 = (String)hs.getAttribute("userid");

if(request.getParameter("msg")!=null){
%>
<%=request.getParameter("msg")%>
<%}
%>
</font></h5>
<br>
<h3><font color="#D02090" size="5px">&nbsp;&nbsp;&nbsp;&nbsp;Assign Bug</font></h3>
<table border="0" cellpadding="2">

 <tr><td>Bug_Name:</td><td><input type="text" name="bug_name"></td></tr>
  		<tr><td>Bug_type:</td><td><input type="text" name="bug_type"></td></tr>
  		<tr><td>Bug_level:</td><td><input type="text" name="bug_level"></td></tr>
		<tr><td>Priority:</td><td><input type="text" name="priority"></td></tr>
  		<tr><td>Project Name:</td>
  		<td>
  		
  		<%
  		ServletContext sc=getServletContext();
		String driver=sc.getInitParameter("drivername");
		String url=sc.getInitParameter("url");
		String uname=sc.getInitParameter("username");
		String pwd=sc.getInitParameter("password");
		
		try{
			Class.forName(driver);
			Connection  con=DriverManager.getConnection(url,uname,pwd);
			
			ResultSet rs,rs1;
			PreparedStatement pstmt=con.prepareStatement("select loginid from employee_details");
			rs=pstmt.executeQuery();
			
			PreparedStatement pstmt1=con.prepareStatement("select project_name from project_details");
			rs1=pstmt1.executeQuery();
  		%> 
  		<select name="pname">
  		<option>---Select---</option>
  		<%
  		while(rs1.next()){
  		%>
  		<option><%=rs1.getString(1)%></option>
  		<%}%>
  		</select>
  		</td>
  		</tr>
  		<tr><td>Bug_Image:</td>
  		<td><input type="file" name="image" name="image" onchange="return fileValidation()"></td></tr>
  		<tr>
  		<td>Tester Code:</td>
  		<td> <input type="text" name="tester_code" value=<%=s1%> readonly></td> 		
  		</tr>
  		
  		<tr>
  		<td>Bug Date:</td>
  		<td><input  type="text" name="bug_date"><a href="javascript:show_calendar('document.testerForm.bug_date', document.testerForm.bug_date.value);">date</a></td>
  		</tr>
  		<tr>
  		<td>Employee code:</td>
  		<td>
  		<select name="e_code">
  		<option value="select">---Select---</option>
  		<%
  		while(rs.next()){
  		%>
  		<option><%=rs.getString(1) %></option>
  		<%
  		}
		}catch(Exception ex){
			ex.printStackTrace();
		}
  		%>
  		</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		</td>
  		</tr>
  		
  		<tr>
  		<td>Status:</td>
  		
  		<td>
  		<select name="status">
  			<option value="select">---select---</option>
  			<option>open</option>
  			<option>close</option>
  	</select>
  	</td>
  	</tr>
  	
  	<tr>
  	<td align="center"  colspan="2"><input type="submit" id="btn" value="submit" onclick="return check()">
  	</td>
  	</tr>
  	
</table>
</center>
</form>
</body>
<jsp:include page="./Footer.jsp"></jsp:include>
</html>