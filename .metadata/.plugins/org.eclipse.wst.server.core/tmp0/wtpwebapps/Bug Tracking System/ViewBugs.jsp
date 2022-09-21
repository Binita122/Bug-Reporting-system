<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="./DeveloperHeader.jsp"/>
    <%@ page import="java.sql.*, java.io.*" %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
.bugimg{
height:100px;
width:100px;
}
</style>
<jsp:include page="./base.html" /> 
<title>View Bugs</title>
<script src="validation.js" type="text/javascript"></script>

</head>
<body>

<%
  			ServletContext sc=getServletContext();
  			String driver=sc.getInitParameter("drivername");
  			String url=sc.getInitParameter("url");
  			String uname=sc.getInitParameter("username");
  			String pwd=sc.getInitParameter("password");
  			HttpSession hs=request.getSession();
  			String s=(String)hs.getAttribute("userid");
  	try{
  				Class.forName(driver);
  				Connection  con=DriverManager.getConnection(url,uname,pwd);
  				System.out.println(".......11........");
  				ResultSet rs;

%>
<div class="container">
<h2 align="center"><font color="red">&nbsp;&nbsp;&nbsp;&nbsp;View Bugs</font></h2>
<p align="right"><jsp:include page="Search.html"></jsp:include></p>

<form name="testerForm" action="ViewBugs" onsubmit="return check()" method="post">
<br>
<center>
<h4 align="center"><font color="green">
<%if(request.getParameter("msg")!=null)
{ %>
<%=request.getParameter("msg")%>
<%} %>
</font>
</h4>


<!-- High Priority -->

<h3 align="left"> <font color="red">High Priority</font></h3>
<table border="1" cellpadding="2" cellspacing="0" bordercolor="Red">
<tr>
			<th>Bug Name</th>
			<th>Description</th>
  			<th>Bug Type</th>
  			<th>Bug Level</th>  			
  			<th>Priority</th>
  			<th>Project Name</th>
  			<th>Bug Image</th>
  			<th>Tester Code</th>
  			<th>Bug Date</th>
  			<th>Employee Code</th>
  			<th>Status</th>
  			<th>Update</th>
  			<th>Post Solution</th>
  			<th>View</th>
  			</tr>
  			<%
  			
  				PreparedStatement pstmt=con.prepareStatement("select * from bug_report where e_code=? and priority='High' and status1=''");
  				pstmt.setString(1,s);
  				rs=pstmt.executeQuery();
  		while(rs.next())
  		{			
  
  			%>
  			<tr>
  			<td><%=rs.getString(2)%></td>
  			<td><%=rs.getString(3)%></td>
  			<td><%=rs.getString(4)%></td>
  			<td><%=rs.getString(5)%></td>
  			<td><%=rs.getString(6)%></td>
  			<td><%=rs.getString(7)%></td>
  			<%String imageName = rs.getString(8);
  			if(imageName!=""){
  				%>
  				<!-- to open image in blank page (zooming) -->
  				<td><a target="_blank" href="BugImages/<%=imageName%>">
  				<img src="BugImages/<%=imageName%>" class="bugimg" id="bugimgId"></a></td>
  				<%
  			}
  			
  			%>
  			
  			<td><%=rs.getString(9)%></td>
  			<td><%=rs.getString(10)%></td>
  			<td><%=rs.getString(11)%></td>
  			<td><%=rs.getString(12)%></td>
  			<td><a href="./UpdateBug.jsp?bugid=<%=rs.getInt(1)%>">Update</a></td>
  			<td><a href="./PostSolution.jsp?bugid=<%=rs.getInt(1)%>">Post Solution</a></td>
			<td><a href="./modal.jsp?bugid=<%=rs.getInt(1)%>"><i class="bi bi-eye-fill" ></i></a></td>
		</tr>
  <%
  		}
  %>

 
  <% 

        
        pstmt.close(); 
         
        %>
</table>
<p style="height:50px;"></p>

<h3 align="left"><font color="#000080"> Medium Priority</font></h3>
<table border="1" cellpadding="2" cellspacing="0" bordercolor="#000080">
<tr>
			<th>Bug Name</th>
			<th>Description</th>
  			<th>Bug Type</th>
  			<th>Bug Level</th>  			
  			<th>Priority</th>
  			<th>Project Name</th>
  			<th>Bug Image</th>
  			<th>Tester Code</th>
  			<th>Bug Date</th>
  			<th>Employee Code</th>
  			<th>Status</th>
  			<th>Update</th>
  			<th>Post Solution</th>
  			<th>View</th>
  			</tr>
  			<%
  			
  				PreparedStatement pstmt1=con.prepareStatement("select * from bug_report where e_code=? and priority='Medium' and status1=''");
  				pstmt1.setString(1,s);
  				rs=pstmt1.executeQuery();
  		while(rs.next())
  		{			
  
  			%>
  			<tr>
  			<td><%=rs.getString(2)%></td>
  			<td><%=rs.getString(3)%></td>
  			<td><%=rs.getString(4)%></td>
  			<td><%=rs.getString(5)%></td>
  			<td><%=rs.getString(6)%></td>
  			<td><%=rs.getString(7)%></td>
  			<%String imageName = rs.getString(8);
  			if(imageName!=""){
  				%>
  				<!-- to open image in blank page (zooming) -->
  				<td><a target="_blank" href="BugImages/<%=imageName%>">
  				<img src="BugImages/<%=imageName%>" class="bugimg" id="bugimgId"></a></td>
  				<%
  			}
  			
  			%>
  			
  			<td><%=rs.getString(9)%></td>
  			<td><%=rs.getString(10)%></td>
  			<td><%=rs.getString(11)%></td>
  			<td><%=rs.getString(12)%></td>
  			<td><a href="./UpdateBug.jsp?bugid=<%=rs.getInt(1)%>">Update</a></td>
  			<td><a href="./PostSolution.jsp?bugid=<%=rs.getInt(1)%>">Post Solution</a></td>
  			<td><a href="./modal.jsp?bugid=<%=rs.getInt(1)%>"><i class="bi bi-eye-fill" ></i></a></td>
							
		</tr>
		
  <%
  		}
  %>
  
 
  <% 

       
        pstmt1.close(); 
        %>
        </table>
        
     <p style="height:50px;"></p>

<h3 align="left"><font color="#40E0D0"> Low Priority</font></h3>
<table border="1" cellpadding="2" cellspacing="0" bordercolor="#40E0D0">
<tr>
			<th>Bug Name</th>
			<th>Description</th>
  			<th>Bug Type</th>
  			<th>Bug Level</th>  			
  			<th>Priority</th>
  			<th>Project Name</th>
  			<th>Bug Image</th>
  			<th>Tester Code</th>
  			<th>Bug Date</th>
  			<th>Employee Code</th>
  			<th>Status</th>
  			<th>Update</th>
  			<th>Post Solution</th>
  			<th>View</th>
  			</tr>
  			<%
  			
  				PreparedStatement pstmt2=con.prepareStatement("select * from bug_report where e_code=? and priority='Low' and status1=''");
  				pstmt2.setString(1,s);
  				rs=pstmt2.executeQuery();
  		while(rs.next())
  		{			
  
  			%>
  			<tr>
  			<td><%=rs.getString(2)%></td>
  			<td><%=rs.getString(3)%></td>
  			<td><%=rs.getString(4)%></td>
  			<td><%=rs.getString(5)%></td>
  			<td><%=rs.getString(6)%></td>
  			<td><%=rs.getString(7)%></td>
  			<%String imageName = rs.getString(8);
  			if(imageName!=""){
  				%>
  				<!-- to open image in blank page (zooming) -->
  				<td><a target="_blank" href="BugImages/<%=imageName%>">
  				<img src="BugImages/<%=imageName%>" class="bugimg" id="bugimgId"></a></td>
  				<%
  			}
  			
  			%>
  			
  			<td><%=rs.getString(9)%></td>
  			<td><%=rs.getString(10)%></td>
  			<td><%=rs.getString(11)%></td>
  			<td><%=rs.getString(12)%></td>
  			<td><a href="./UpdateBug.jsp?bugid=<%=rs.getInt(1)%>">Update</a></td>
  			<td><a href="./PostSolution.jsp?bugid=<%=rs.getInt(1)%>">Post Solution</a></td>
  			<td><a href="./modal.jsp?bugid=<%=rs.getInt(1)%>"><i class="bi bi-eye-fill" ></i></a></td>
		</tr>
		
		
  <%
  		}
  %>
  
 
  <% 

       
        pstmt2.close(); 
        %>
        </table>
<p style="height:50px;"></p>


<h3 align="left"><font color="green"> None</font></h3>
<table border="1" cellpadding="2" cellspacing="0" bordercolor="green">
<tr>
			<th>Bug Name</th>
			<th>Description</th>
  			<th>Bug Type</th>
  			<th>Bug Level</th>  			
  			<th>Priority</th>
  			<th>Project Name</th>
  			<th>Bug Image</th>
  			<th>Tester Code</th>
  			<th>Bug Date</th>
  			<th>Employee Code</th>
  			<th>Status</th>
  			<th>Update</th>
  			<th>Post Solution</th>
  			<th>View</th>
  			<th>Action</th>
  			</tr>
  			<%
  			
  				PreparedStatement pstmt3=con.prepareStatement("select * from bug_report where e_code=? and priority='None' and status1=''");
  				pstmt3.setString(1,s);
  				rs=pstmt3.executeQuery();
  		while(rs.next())
  		{			
  
  			%>
  			<tr>
  			<td><%=rs.getString(2)%></td>
  			<td><%=rs.getString(3)%></td>
  			<td><%=rs.getString(4)%></td>
  			<td><%=rs.getString(5)%></td>
  			<td><%=rs.getString(6)%></td>
  			<td><%=rs.getString(7)%></td>
  			<%String imageName = rs.getString(8);
  			if(imageName!=""){
  				%>
  				<!-- to open image in blank page (zooming) -->
  				<td><a target="_blank" href="BugImages/<%=imageName%>">
  				<img src="BugImages/<%=imageName%>" class="bugimg" id="bugimgId"></a></td>
  				<%
  			}
  			
  			%>
  			
  			<td><%=rs.getString(9)%></td>
  			<td><%=rs.getString(10)%></td>
  			<td><%=rs.getString(11)%></td>
  			<td><%=rs.getString(12)%></td>
  			<td><a href="./UpdateBug.jsp?bugid=<%=rs.getInt(1)%>">Update</a></td>
  			<td><a href="./PostSolution.jsp?bugid=<%=rs.getInt(1)%>">Post Solution</a></td>
  			<td><a href="./modal.jsp?bugid=<%=rs.getInt(1)%>"><i class="bi bi-eye-fill" ></i></a></td>
  			
		</tr>
 
  <%
  		}
  %>

  <% 

        rs.close(); 
        pstmt3.close(); 
        %>
        </table>
</center>
</form>

</div>
<%
con.close();
  	}catch(Exception e){
  		e.printStackTrace();
  	}
%>
</body>
<jsp:include page="./Footer.jsp"></jsp:include>
</html>