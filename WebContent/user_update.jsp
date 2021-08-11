<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"   import="java.sql.*"%>
     <%@page import="java.util.*" %>
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
else
{
	System.out.println(session.getAttribute("sess_id"));
int rcv_id=	(int)session.getAttribute("sess_id");
%>
<%
String rcv_reference = request.getParameter("reference");
String rcv_firstname = request.getParameter("first_name");
String rcv_lastname=request.getParameter("last_name");
String rcv_father=request.getParameter("father_name");
String rcv_mother=request.getParameter("mother_name");
String rcv_dob=request.getParameter("dob");
String rcv_address=request.getParameter("address");
int rcv_phone=Integer.parseInt(request.getParameter("phone"));
String rcv_state=request.getParameter("state");
String rcv_city=request.getParameter("city");
String rcv_gender=request.getParameter("gender");
String rcv_religion=request.getParameter("religion");
int i=0;
ResultSet rs;
 try{
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","suman013");
	 Statement st=con.createStatement();
	st.executeUpdate("UPDATE new_user1 SET user_reference ='"+rcv_reference+"',user_firstname ='"+rcv_firstname +"',user_lastname= '"+ rcv_lastname+"' ,user_father= '"+rcv_father +"',user_mother= '"+ rcv_mother+ "', user_dob='"+rcv_dob +"' ,user_address='"+ rcv_address+ "' ,user_phone= '"+rcv_phone+"',user_state='"+rcv_state+"',user_city='"+rcv_city+"',user_gender='"+rcv_gender +"',user_religion='"+rcv_religion +"'  WHERE user_id="+rcv_id);
	response.sendRedirect("profile_update.jsp");
	con.close();
	st.cancel();
	}catch(Exception e)
{
	 out.write(e.getMessage());
}
%>
<%
}
%>
</body>
</html>