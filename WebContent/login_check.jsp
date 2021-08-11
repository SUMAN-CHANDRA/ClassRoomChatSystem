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
String rcv_email = request.getParameter("entered_email");
String rcv_password = request.getParameter("entered_password");
ResultSet rs;
 try{
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","suman013");
	 Statement st=con.createStatement();
	 rs=st.executeQuery("select * from new_user1 where user_email='"+rcv_email+"' and user_password='"+rcv_password+"'" );
	 if (!rs.next()) 
	 { 
      String redirectURL = "user_login.jsp";
    response.sendRedirect(redirectURL);
}
else {
	 if(rs.getInt(18)==1)
	 {
 		 session.setAttribute("sess_id",rs.getInt(1));
 		System.out.println(session.getAttribute("sess_id")+" in login check ");
		   response.sendRedirect("profile_update.jsp");
	 }
	 else
	 {
		 String redirectURL = "user_blocked.jsp";
	    response.sendRedirect(redirectURL);
	 }
}
	con.close();
	st.cancel();
 }catch(Exception e)
{
	 out.write(e.getMessage());
}
%>
</body>
</html>