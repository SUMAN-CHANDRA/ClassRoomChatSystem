<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
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
int rcv_id=(int)session.getAttribute("sess_id");
String rcv_status =request.getParameter("user_text");
Connection con=null;
Statement st = null;
ResultSet rs=null;
try{
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","suman013");
st=con.createStatement();
st.executeUpdate("UPDATE user_images SET user_status='"+rcv_status+"' WHERE user_id="+rcv_id);
response.sendRedirect("showimage.jsp");
}
catch(Exception ex)
{
ex.printStackTrace();
}
}
%>
</body>
</html>