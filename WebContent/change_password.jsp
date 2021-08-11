<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.util.*" %>
  <%@page import="java.sql.*" %>
  <% 
  if(session.getAttribute("sess_id")==null)
    {
    	 response.sendRedirect("user_login.jsp");
    	}
    else
    {
    int rcv_id=	(int)session.getAttribute("sess_id");
     Statement st=null;
    Connection con=null;
    String rcv_password = request.getParameter("new_password");
    ResultSet rs;
     int temp=0; 
    try{
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","suman013");
    	  st=con.createStatement();
    	 temp=st.executeUpdate("update new_user1 set user_password ='"+rcv_password+"' where user_id="+rcv_id);
    }catch(Exception e)
    {
    	 out.write(e.getMessage());
    }
   response.sendRedirect("profile_update.jsp");
  %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Knowledge Class-Room</title>
</head>
<body>
</body>
</html>
<%
}
%>