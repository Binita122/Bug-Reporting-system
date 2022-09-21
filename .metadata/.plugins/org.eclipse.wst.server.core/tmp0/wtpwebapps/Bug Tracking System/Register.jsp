<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>

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
		if (ChkMandatoryField(editform.mobileno, 'MobileNo') == false)
			return false;
		if (ChkMandatoryField(editform.emailid, 'EmailID') == false)
			return false;
		if (ChkMandatoryField(editform.doj, 'Date Of Joining') == false)
			return false;

		if (editform.designation.value == "select") {
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
		
		else
			alert("Registered Successfully")
	}
</script>

<script type="text/javascript" src="dateget.js"></script>

</head>
<body bgcolor="white">

	<form action="./Reg" name="editform" onsubmit="return validate()">
		<table width="100%">
			<tr>
				<td><img alt="HeaderImage" src="./Images/Header.png"
					height="120"></td>
				<td><font face="arial narrow" size="10px" color="#4D2661"><b>Bug
							Tracking System</b></font></td>
			</tr>

			<tr>
				<td align="right" colspan="2"><b>[<a href="./Home.jsp"><font
							color="#FBC61" size="3px">Home</font></a>]
				</b></td>
			</tr>

		</table>
		<hr>
		<center>
			<tr>
				<td><h4>REGISTRATION FORM</h4></td>
			</tr>
		</center>
		<center>
			<table>
				<tr>
					<td>UserId:</td>
					<td><input type="text" name="userid" value=""></td>
				</tr>

				<tr>
					<td>Fname:</td>
					<td><input type="text" name="fname" value="" pattern="[A-Za-z]{}"></td>
				</tr>

				<tr>
					<td>Lname:</td>
					<td><input type="text" name="lname" value="" pattern="[A-Za-z]{}"></td>
				</tr>

				<tr>
					<td>Gender:</td>
					<td><select name="gender">
							<option value="select">-----select----</option>
							<option>Male</option>
							<option>Female</option>
							</select>
							</td>
				</tr>

				<tr>
					<td>Qualification:</td>
					<td><input type="text" name="qualification" value=""></td>
				</tr>

				<tr>
					<td>Address:</td>
					<td><input type="text" name="address" value=""></td>
				</tr>

				<tr>
					<td>PhoneNo:</td>
					<td><input type="tel" name="phoneno" value=""></td>
				</tr>

				<tr>
					<td>MobileNo:</td>
					<td><input type="text" name="mobileno" value="" pattern="9[7-8]{1}[0-9]{8}"></td>
				</tr>

				<tr>
					<td>EmailID:</td>
					<td><input type="email" name="mailid" value=""></td>
				</tr>

				<tr>
					<td>DOJ</td>
					<td><input type="date" name="doj" value=""> </td>
				</tr>

				<tr>
					<td>Designation:</td>
					<td><select name="designation">
							<option value="select">-----select----</option>
							<option>Developer</option>
							<option>Tester</option>
							<option>Manager</option>
					</select></td>
				</tr>

				<tr>
					<td>MaritalStatus:</td>
					<td><select name="maritalstatus">
							<option value="select">-----select----</option>
							<option>Married</option>
							<option>Unmarried</option>
					</select></td>
				</tr>

				<tr>
					<td>Password</td>
					<td><input type="password" name="password" value=""></td>
				</tr>

				<tr>
					<td class="text1">Hint
							Question</div></td>
					<td><div align="left">
							<select name="HintQuestion" class="borderBlue">
								<OPTION value="select">[Select One]
								<OPTION value="What is the name of your first school?">What
									is the name of your first school?
								<OPTION value="What is your favourite pass-time?">What
									is your favourite pass-time?
								<OPTION value="What is your mother maiden name?">What
									is your mother's maiden name?
								<OPTION value="What is your favourite food?">What is
									your favourite food?
							</select>
						</div></td>
				</tr>

				<tr>
					<td>HintAnswer</td>
					<td><input type="text" name="hintanswer" value=""></td>
				</tr>

				<tr>
					<td><input type="submit" name="sub" value="Register">
					 <input type="Reset" name="reset" value="Reset"></td>
				</tr>

			</table>
		</center>
	</form>
	</body>
	<jsp:include page="./Footer.jsp"></jsp:include>
</html>