<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<% 
	String msg=request.getParameter("msg");
	if(msg==null)
	{
		 msg="";
	}
%>
<title>Change Password</title>
<style type="text/css">
body,td,th {
	color: #990099;

}
</style>

<script type="text/javascript">
function check()
{
if(document.form1.opass.value=="")
{
	alert("Please Enter Old password First...");
	return false;
}
if(document.form1.npass.value!=document.form1.cpass.value)
{
	alert("new password is not matched with confirm password .. please check!");
	return false;
}
}
</script>

</head>
<body>
<h4 align="center"><font color="red">
</font>
</h4>

<h2 align="center" class="Sitemap1">change password </h2>

<form action="./pchange?cat=<%=request.getParameter("cat") %>" onsubmit="return check();" method="post">
<center>
<p>&nbsp;</p>
<p><font color="red"><%=msg %></font></p>
</center>
<table width="352" height="105" border="0" align="center">
<tr>
      <td width="171" class="text"><div align="left">Old Password : </div></td>
      <td width="171"><input name="opass" type="password" class="borderBlue" id="opass"></td>
    </tr>
    <tr>
      <td class="text"><div align="left">New Password : </div></td>
      <td><input name="npass" type="password" class="borderBlue" id="npass"></td>
    </tr>
    <tr>
      <td class="text"><div align="left">Confirm Password : </div></td>
      <td><input name="cpass" type="password" class="borderBlue" id="cpass"></td>
    </tr>
</table>
<br>

  <p align="center">
    <input name="Submit" type="submit" id="button" value="Submit"></p>
    
</form>
<jsp:include page="./Footer.jsp" />  
</body>
</html>