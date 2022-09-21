<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="./base.html" /> 
<title>Post Solution</title>
<script type="text/javascript" src="dateget.js">
	
</script>


</head>
<body>
<div class="container">
	<form name="testerForm" action="Solution" method="post">

			<h3>
				<font color="#FBB117" face="arial narrow">&nbsp;&nbsp;&nbsp;&nbsp;</font>
			</h3>
			
				<%
				ServletContext sc = getServletContext();
				String driver = sc.getInitParameter("drivername");
				String url = sc.getInitParameter("url");
				String uname = sc.getInitParameter("username");
				String pwd = sc.getInitParameter("password");
				int bugid;
				bugid = Integer.parseInt(request.getParameter("bugid"));
				try {
					Class.forName(driver);
					Connection con = DriverManager.getConnection(url, uname, pwd);
					System.out.println(".......11........");
					ResultSet rs;

					PreparedStatement pstmt1 = con.prepareStatement("select * from bug_report where bugno=?");
					pstmt1.setInt(1, bugid);
					rs = pstmt1.executeQuery();
					while (rs.next()) {
				%>
				<div class="form-group">
			<label for="bug_name" class="col-sm-2 col-form-label col-form-label-lg">Bug Name</label>
    		<input type="text" class="form-control form-control-lg" id="bug_name" name="bug_name" value="<%=rs.getString(2)%>">
			</div>
				<div class="form-group">
					<label for="solution" class="col-sm-2 col-form-label col-form-label-lg">Post Solution</label><br>
					<textarea name="solution" id="solution" rows="20" cols="85"></textarea>
				
				</div>
				
					<div class="form-group">
			<label for="pdate" class="col-sm-2 col-form-label col-form-label-lg">Posted Date</label>
    		<input type="date" class="form-control form-control-lg" id="pdate" name="pdate"> 
			</div>
				
					<p align="center"><input type="hidden"
						name="bugid" value="<%=bugid%>"></p>
			
		
						<p align="center" >
    					<button type="submit" class="btn btn-success">Post</button></p>
						<%
					}
					}catch(Exception e){
						e.printStackTrace();
					}
						%>
			
	</form>
</div>

</body>
<jsp:include page="./Footer.jsp" />
</html>