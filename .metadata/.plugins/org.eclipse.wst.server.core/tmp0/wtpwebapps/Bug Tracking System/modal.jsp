<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="./base.html" /> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
			ServletContext sc = getServletContext();
			String driver = sc.getInitParameter("drivername");
			String url = sc.getInitParameter("url");
			String uname = sc.getInitParameter("username");
			String pwd = sc.getInitParameter("password");
			try {
				Class.forName(driver);
				Connection con = DriverManager.getConnection(url, uname, pwd);
				//System.out.println(".......11........");
				ResultSet rs;
				HttpSession hs = request.getSession();
				String userid = (String) hs.getAttribute("userid");
				System.out.print("userid" + userid);
				String s = request.getParameter("bugid");
				PreparedStatement pstmt = con
				.prepareStatement("select * from bug_report where bugno=?");
				pstmt.setString(1, s);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {

%>
<div class="card" align="center">
  <div class="card-header">
    Bug Details
  </div>
  <div class="card-body">
    <h5 class="card-title">Bug Name: <%=rs.getString("bug_name")%></h5>
    <p></p>
    <p class="card-text">Description: <%=rs.getString("description") %></p>
    <p class="card-text">Bug Type: <%=rs.getString("bug_type") %></p>
    <p class="card-text">Bug Level: <%=rs.getString("bug_level") %></p>
        <p class="card-text">Priority: <%=rs.getString("priority") %></p>
         <p class="card-text">Project Name: <%=rs.getString("pname") %></p>
         <p class="card-text">Bug Status: <%=rs.getString("status") %></p>
    <a href="#" class="btn btn-primary" data-dismiss="modal">Close</a>
  </div>
</div>
	
        
      
<%}
				} catch (Exception e) {
			e.printStackTrace();
			}
	
		%>
</body>
</html>