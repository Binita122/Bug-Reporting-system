<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <link rel="stylesheet" href="testerstyle.css" type="text/css">
   <jsp:include page="./base.html" /> 
    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
   <%
if(request.getParameter("cat")!=null)
{
if(request.getParameter("cat").equals("Tester"))
{
%>
<jsp:include page="./TesterHeader.jsp" />   
<%} %>
<%if(request.getParameter("cat").equals("Developer"))
{
%>
<jsp:include page="./DeveloperHeader.jsp" />   
<%}
if(request.getParameter("cat").equals("HrManager"))
{
%>
<jsp:include page="./ManagerHeader.jsp" />   
<%}

}//top if %>

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
	else{
		alert("Bug Assigned Successfully")
	}
}

function fileValidation() {
    var fileInput = document.getElementById('image');
     
    var filePath = fileInput.value;
    if (filePath == '') {
        alert("Please upload an image");

    } else {
        var Extension = FileUploadPath.substring(
                FileUploadPath.lastIndexOf('.') + 1).toLowerCase();
        
        if (Extension == "gif" || Extension == "png" || Extension == "bmp"
            || Extension == "jpeg" || Extension == "jpg") {
        	  if (fileInput.files && fileInput.files[0]) {
                  var reader = new FileReader();

                  reader.onload = function(e) {
                      $('#blah').attr('src', e.target.result);
                  }

                  reader.readAsDataURL(fuData.files[0]);
              }

          
        }

        else {
            alert("Photo only allows file types of GIF, PNG, JPG, JPEG and BMP. ");

        }
    }
}
  
</script>

<script type="text/javascript" src="dateget.js">
</script>
</head>

<body>
<div class="container">
<form name="testerForm" action="AssignBug" method="post" enctype="multipart/form-data">
 
<br>
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
<h2 align="center"><font color="Red">&nbsp;&nbsp;&nbsp;&nbsp;Assign Bug</font></h2>

<div class="form-group">
<label for="bug_name" class="col-sm-2 col-form-label col-form-label-lg">Bug Name</label>
    <input type="text" class="form-control form-control-lg" id="bug_name" name="bug_name">
</div>

<div class="form-group">
<label for="bug_des" class="col-sm-2 col-form-label col-form-label-lg">Bug Description</label>
    <textarea class="form-control" id="bug_des" name="bug_des"></textarea>
</div>

<div class="form-group">
<label for="bug_type" class="col-sm-2 col-form-label col-form-label-lg">Bug Type</label>
    <input type="text" class="form-control" id="bug_type" name="bug_type">
</div>

<div class="form-group">
<label for="bug_level" class="col-sm-2 col-form-label col-form-label-lg">Bug level</label>
    <input type="text" class="form-control" id="bug_level" name="bug_level">
</div>

<div class="form-group">
<label for="priority" class="col-sm-2 col-form-label col-form-label-lg">Priority</label>
     <select class="form-control" id="priority" name="priority">
     	<option>High</option>
     	<option>Medium</option>
     	<option>Low</option>
     	<option>None</option>
     </select>
</div>

<div class="form-group">
<label for="pname" class="col-sm-2 col-form-label col-form-label-lg">Project Name</label>
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
     <select class="form-control" id="pname" name="pname" class="col-sm-2 col-form-label col-form-label-lg">
     	<option>---Select---</option>
  		<%
  		while(rs1.next()){
  		%>
  		<option><%=rs1.getString(1)%></option>
  		<%}%>
     </select>
</div>

<div class="form-group">
    <label for="image" class="col-sm-2 col-form-label col-form-label-lg">Bug Image</label>
 <input type="file" class="form-control-file" id="image" onchange="return fileValidation()" name="image" onSubmit="">
  </div>

<div class="form-group">
<label for="tester_code" class="col-sm-2 col-form-label col-form-label-lg">Tester Code</label>
    <input type="text" class="form-control" id="tester_code" name="tester_code" value=<%=s1%> readonly>
</div>

<div class="form-group">
<label for="bug_date" class="col-sm-2 col-form-label col-form-label-lg">Bug Date</label>
    <input type="date" class="form-control" id="bug_date" name="bug_date">
</div>

<div class="form-group">
<label for="e_code" class="col-sm-2 col-form-label col-form-label-lg">Employee code</label>
    <select class="form-control" id="e_code" name="e_code">
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
    </select>
</div>

<div class="form-group">
<label for="status" class="col-sm-2 col-form-label col-form-label-lg">Status</label>
    <select class="form-control" id="status" name="status">
    <option value="select">---select---</option>
  			<option>open</option>
  			<option>close</option>
    </select>
    </div>
    
    <p align="center" >
    <button type="submit" class="btn btn-success" onclick="return check()">Submit</button></p>
</form>
</div>
</body>
<jsp:include page="./Footer.jsp"></jsp:include>
</html>