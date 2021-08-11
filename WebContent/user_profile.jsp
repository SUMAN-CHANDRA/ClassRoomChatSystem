<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@include file="navigation.jsp" %>
 <%
 if(session.getAttribute("sess_id")==null)
 {
	 response.sendRedirect("user_login.jsp");
 }
 
if(session.getAttribute("sess_id")!=null)
{
	out.print("hghgghgf");
}
%>