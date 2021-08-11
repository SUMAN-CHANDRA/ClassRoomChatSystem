<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Knowledge Class-Room</title>
</head>
<body>
<% 
String rcv_name = request.getParameter("login_name");
String rcv_password = request.getParameter("login_password");
     if (rcv_name.equals("admin")&& rcv_password.equals("admin@123")) 
	 {  
          out.print(rcv_name);
		 out.print(rcv_password);
          session.setAttribute("sess_admin","admin@123");
		response.sendRedirect("student_listing.jsp");
		}
else {
    String redirectURL = "admin_login.jsp";
response.sendRedirect(redirectURL);
}
%>
</body>
</html>