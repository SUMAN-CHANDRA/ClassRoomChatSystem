<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="java.sql.*"   %>
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
    
 %>
   <%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
    <%@page import="java.util.*" %>
    <%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream,java.text.*"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Knowledge Class-Room</title>
</head>
<body>
<%
String rcv_msg=request.getParameter("user_msg");
String rcv_firstname=null;
String rcv_lastname=null;
out.print(rcv_id);
Statement st=null,st1=null;
Connection con=null;
out.print(rcv_msg);
out.print("Successful");
ResultSet rs;
ResultSet rs1;
int temp=0;
try{
	 
	 Class.forName("com.mysql.jdbc.Driver");
	  con=DriverManager.getConnection("jdbc:mysql://localhost:3307/details","root","subha12345");
	  st=con.createStatement();
	  rs=st.executeQuery("select * from new_user1 where user_id="+rcv_id);
	
	 while(rs.next())
	 {
	  temp=rs.getInt(13);
		out.print(temp);
	   rcv_firstname= rs.getString(3);
		rcv_lastname= rs.getString(4);
	 }
	 st=con.createStatement();
	String rcv_date=new java.util.Date().toLocaleString();
	 int i=st.executeUpdate("INSERT INTO user_chat(user_id,user_teacher,user_msg,user_time,user_firstname,user_lastname)VALUES("+rcv_id+","+temp+",'"+rcv_msg+"','"+rcv_date +"','"+rcv_firstname +"','"+rcv_lastname +"')");
	out.print("Successful");
	 con.close();
	st.cancel();
	response.sendRedirect("chat1.jsp");
}catch(Exception e)
{
	 out.write(e.getMessage());
}
%>
</body>
</html>
<%
}
%>