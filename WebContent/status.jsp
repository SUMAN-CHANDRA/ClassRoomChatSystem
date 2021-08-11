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
ResultSet rs;
Statement st = null;
int temp=0;
 try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","suman013");
 	  st=con.createStatement();
 	 int rcv_id=Integer.parseInt(request.getParameter("pass_id"));
 	rs=st.executeQuery("SELECT * from new_user1 where user_id="+rcv_id);
		if(rs.next())
		{
			if(rs.getInt(18)==1)
			{
				 st.executeUpdate("UPDATE new_user1 SET user_status="+2+" WHERE user_id="+rcv_id);	
			}
			else
			{
				 st.executeUpdate("UPDATE new_user1 SET user_status="+1+" WHERE user_id="+rcv_id);	
			}
		}
		response.sendRedirect("student_listing.jsp");			
 }catch(Exception e)
 {
 	 out.write(e.getMessage());
 }
%>
</body>
</html>