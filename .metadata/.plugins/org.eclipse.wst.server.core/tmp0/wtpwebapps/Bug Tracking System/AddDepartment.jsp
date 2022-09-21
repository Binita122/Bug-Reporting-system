<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="./Header.jsp" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="style.css" type="text/css">
<title>Add Department</title>

<script type="text/javascript">
	function FieldCheck(F, T) {
		var val = F.value;
		if (val == "") {
			alert(T + " is mandatory");
			return false;
		}
	}

	function validate() {
		if (FieldCheck(login.dname, 'Department name ') == false)
			return false;

		if (FieldCheck(login.location, 'Location ') == false)
			return false;
		
		else{
			alert("Successfully saved");
		}
	}
	
</script>

</head>
<body class="SC">
<form name="login" action="./AddDept" name="frm">
<br><br><center>
<h3>Add Department</h3>
</center>
<center>
<table>
<tr>
<td>&nbsp;Department Name:</td>
<td><input type="text" name="dname" value=""></td>
</tr>
<tr>
<td>&nbsp;Department Location:</td>
<td><input type="text" name="location" value=""></td>
</tr>

<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</table>
<input type="submit" id="btn" name="login" value="Add" onClick="return validate()">
</center>
</form>

</body>
<jsp:include page="./Footer.jsp"></jsp:include>
</html>