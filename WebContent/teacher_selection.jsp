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
Connection con=null;
Statement st=null;
ResultSet rs;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","suman013");
	  st=con.createStatement();
	  int rcv_id=Integer.parseInt(request.getParameter("user_id_t"));
	  int rcv_teacher=Integer.parseInt(request.getParameter("teacher_appoint"));
	st.executeUpdate("UPDATE new_user1 SET user_teacher="+rcv_teacher+" WHERE user_id="+rcv_id);
	response.sendRedirect("user_login.jsp");
	}catch(Exception e)
{
	 out.write(e.getMessage());
}
%>
</body>
</html>