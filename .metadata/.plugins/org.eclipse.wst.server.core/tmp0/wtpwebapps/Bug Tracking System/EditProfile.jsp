<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile</title>
 <link rel="stylesheet" href="testerstyle.css" type="text/css">
<%
if(request.getParameter("cat")!=null){
	if(request.getParameter("cat").equals("Tester")){
		%>
<jsp:include page="./TesterHeader.jsp" />
<%
	}
	
	if(request.getParameter("cat").equals("Developer")){
%>
<jsp:include page="./DeveloperHeader.jsp" />
<%
	}
	if(request.getParameter("cat").equals("HrManager")){
%>
<jsp:include page="./ManagerHeader.jsp" />
<%
	}
}
%>

<%@ page import="java.sql.*"%>

<br>

<script type="text/javascript">
	function ChkMandatoryField(F, T) {
		var val = F.value;
		if (val == "") {
			alert(T + " is mandatory");
			return false;
		}
	}

	function validate() {
		if (ChkMandatoryField(editform.userid, 'UserId') == false)
			return false;
		if (ChkMandatoryField(editform.fname, 'FirstName') == false)
			return false;
		
		if (ChkMandatoryField(editform.lname, 'LastName') == false)
			return false;
		if (editform.gender.value == "select") {
			window.alert("Select Gender !");
			return false;
		}
		
		if (ChkMandatoryField(editform.qualification, 'Qualification') == false)
			return false;
		if (ChkMandatoryField(editform.address, 'Address') == false)
			return false;
		if (ChkMandatoryField(editform.phoneno, 'PhoneNo') == false)
			return false;
		if (ChkMandatoryField(editform.mobileno, 'MobileNo') == false)
			return false;
		if (ChkMandatoryField(editform.emailid, 'EmailID') == false)
			return false;
		if (ChkMandatoryField(editform.doj, 'Date Of Joining') == false)
			return false;

		if (editform.role.value == "select") {
			window.alert("Select Designation !");
			return false;
		}

		if (editform.maritalstatus.value == "select") {
			window.alert("Select MaritalStatus !");
			return false;
		}
		if (editform.HintQuestion.value == "select") {
			window.alert("Select HintQuestion !");
			return false;
		}

		if (ChkMandatoryField(editform.hintanswer, 'HintAnswer') == false)
			return false;

	}
</script>

<script type="text/javascript" src="dateget.js"></script>



</head>
<body bgcolor="White">
	<form action="UpdateProfile?cat=<%= request.getParameter("cat") %>"
		method="post">
		<h3 align="center">
			<font color="red"> <%if(request.getParameter("msg")!=null)
{ %> <%=request.getParameter("msg")%> <%} %>

			</font>
		</h3>
		<center>
			<h2>
			Edit Profile
			</h2>
		</center>
		<center>
			<table>
				<%
		ServletContext sc=getServletContext();
		String driver=sc.getInitParameter("drivername");
		String url=sc.getInitParameter("url");
		String uname=sc.getInitParameter("username");
		String pwd=sc.getInitParameter("password");
		try{
			Class.forName(driver);
			Connection  con=DriverManager.getConnection(url,uname,pwd);
			ResultSet rs;
			HttpSession hs=request.getSession();
			String userid=(String)hs.getAttribute("userid");
			PreparedStatement pstmt=con.prepareStatement("select * from employee_details where loginid=?");
			pstmt.setString(1,userid);
			rs=pstmt.executeQuery();
			
		while(rs.next()){
		%>
		<tr>
		<td>UserId: </td>
		<td><input type="text" name="userid" value="<%= rs.getString("loginid")%>" readonly></td>
		</tr>
		<tr>
		<td>Fname: </td>
		<td><input type="text" name="fname" value="<%=rs.getString("fname")%>"></td>
		</tr>
		
		<tr>
		<td>Lname: </td>
		<td><input type="text" name="lname" value="<%=rs.getString("lname")%>"></td>
		</tr>
		
		<tr>
		<td>Gender: </td>
		<td><select name="gender">
		<option><%=rs.getString("gender")%></option>
		<option value="select">---Select---</option>
		<option value="male">Male</option>
		<option value="female">Female</option>
		</select>
		</td>
		</tr>
		
		
		<tr>
		<td>Qualification:</td>
		<td><input type="text" name="qualification" value="<%=rs.getString("qualification")%>"></td>
		</tr>
		
		<tr>
		<td>Address:</td>
		<td><input type="text" name="address" value="<%=rs.getString("address")%>"></td>
		</tr>
		
		<tr>
		<td>Phone No:</td>
		<td><input type="text" name="phoneno" value="<%=rs.getString("phoneno")%>"></td>
		</tr>
		
		<tr>
		<td>Mobile No:</td>
		<td><input type="text" name="mobileno" value="<%=rs.getString("mobileno")%>"></td>
		</tr>
		
		<tr>
		<td>Email ID:</td>
		<td><input type="email" name="mailid" value="<%=rs.getString("emailid")%>"></td>
		</tr>
		
		<tr>
		<td>DOJ:</td>
		<td><input type="date" name="doj" value="<%=rs.getString("doj")%>" readonly>
		</td>
		</tr>
		
		<tr>
		<td>Designation:</td>
		<td>
		<select name="role">
			<option><%=rs.getString("role")%></option>
			<option value="select">----select----</option>
			<option>Tester</option>
			<option>Manager</option>
			<option>Developer</option>
		</select>
		</td>
		</tr>
		
		
		<tr>
		<td>Marital Status:</td>
		<td>
		<select name="maritalstatus">
			<option><%=rs.getString("maritalstatus") %></option>
			<option value="select">----select----</option>
			<option>Married</option>
			<option>Unmarried</option>
		</select>
		</td>
		</tr>
		
		<tr>
		<td><div>Hint Question:</div></td>
		<td><div align="left">
             <select name="HintQuestion" class="borderBlue">
		       <OPTION value="select">[Select One]
               <OPTION value="What is the name of your first school?">What is the name of your first school?
               <OPTION value="What is your favourite pass-time?">What is your favourite pass-time?
               <OPTION value="What is your mother maiden name?">What is your mother's maiden name?
               <OPTION value="What is your favourite food?">What is your favourite food?
             </select>
           </div>
           </td>
         </tr>
         
         <tr>
			<td>HintAnswer:</td>
			<td><input type="text" name="hintanswer" value="<%=rs.getString("hintanswer")%>"></td>
		</tr>
		
		<%
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		%>
		<tr>
		
		</tr>
		
			<tr>
			<td colspan="2" align="center"><input type="submit" id="btn" name="sub" value="Edit" onclick="return validate()">
			<input type="Reset" id="btn2" name="reset" value="Reset"></td>
			</tr>
			</table>
		</center>
	</form>

</body>
<jsp:include page="./Footer.jsp"></jsp:include>
</html>