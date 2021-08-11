<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Knowledge Class-Room</title>
</head>
<body>
<% 
 if(session.getAttribute("sess_id")==null)
 {
	 response.sendRedirect("user_login.jsp");
 }
 
if(session.getAttribute("sess_id")!=null)
{
	session.removeAttribute("sess_id");
	response.sendRedirect("user_login.jsp");
}
%>
</body>
</html>