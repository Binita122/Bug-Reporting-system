/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.55
 * Generated at: 2022-08-04 01:32:59 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.io.*;
import java.util.Random;

public final class ViewProject_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("java.io");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.Random");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>View Project</title>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Header.jsp", out, true);
      out.write("\r\n");
      out.write("\r\n");
      out.write("<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"SC\">\r\n");
      out.write("	<form name=\"get ElementById\">\r\n");
      out.write("		<h3 align=\"center\">View Project</h3>\r\n");
      out.write("		");

Connection con;
PreparedStatement pstmt;
ResultSet rs=null;

String pid,pname,description,date,duration,name,address,phone,email,plead,deptname;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bts", "root", "");
    pstmt=con.prepareStatement("select * from project_details");
    rs=pstmt.executeQuery();
}
catch(Exception e){
	e.printStackTrace();
}
if(rs!=null){



      out.write("\r\n");
      out.write("\r\n");
      out.write("<br>\r\n");
      out.write("	<table class=\"notebook\" align=\"center\">\r\n");
      out.write("	<tr class=\"row_title\">\r\n");
      out.write("        <th align=\"center\">ProjectName</th>\r\n");
      out.write("		<th align=\"center\">Submission Date</th>\r\n");
      out.write("		<th align=\"center\">Duration</th>\r\n");
      out.write("		<th align=\"center\">ClientName</th>\r\n");
      out.write("		<th align=\"center\">ClientAddress</th>\r\n");
      out.write("		<th align=\"center\">PhoneNo</th>\r\n");
      out.write("		<th align=\"center\">EmailId</th>\r\n");
      out.write("		<th align=\"center\">ProjectLead</th>\r\n");
      out.write("		<th align=\"center\">DeptName</th>\r\n");
      out.write("		<th align=\"center\">Delete</th>\r\n");
      out.write("		</tr>\r\n");
      out.write("		");

		int DisRow=0;
		while(rs.next())
		{
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
		
      out.write("\r\n");
      out.write("		<tr class= ");
      out.print((DisRow%2!=0)? "row_even" : "row_odd");
      out.write(">\r\n");
      out.write("		\r\n");
      out.write("		<td align=\"center\">");
      out.print(pname);
      out.write("</td>\r\n");
      out.write("		<td align=\"center\">");
      out.print(date);
      out.write("</td>\r\n");
      out.write("		<td align=\"center\">");
      out.print(duration);
      out.write("</td>\r\n");
      out.write("		<td align=\"center\">");
      out.print(name);
      out.write("</td>\r\n");
      out.write("		<td align=\"center\">");
      out.print(address);
      out.write("</td>\r\n");
      out.write("		<td align=\"center\">");
      out.print(phone);
      out.write("</td>\r\n");
      out.write("		<td align=\"center\">");
      out.print(email);
      out.write("</td>\r\n");
      out.write("		<td align=\"center\">");
      out.print(plead);
      out.write("</td>\r\n");
      out.write("		<td align=\"center\">");
      out.print(deptname);
      out.write("</td>\r\n");
      out.write("		<td align=\"center\"><a href=\"DeleteProject?pid=");
      out.print(pid);
      out.write("\">Delete</a></td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		");

		}
		rs.close();		
	if(DisRow==0){	
		
      out.write("\r\n");
      out.write("			<tr><th colspan=5>No Records found</th></tr>\r\n");
      out.write("			");

	}
}
			
      out.write("\r\n");
      out.write("			</table>\r\n");
      out.write("	</form>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "./Footer.jsp", out, true);
      out.write("\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
