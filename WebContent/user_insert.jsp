<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"   %>
    <%@page import="java.util.*" %>
    <%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Knowledge Class-Room</title>
</head>
<body>
<%
String rcv_reference = request.getParameter("reference");
String rcv_firstname = request.getParameter("first_name");
String rcv_lastname=request.getParameter("last_name");
String rcv_father=request.getParameter("father_name");
String rcv_mother=request.getParameter("mother_name");
String rcv_dob=request.getParameter("dob");
String rcv_address=request.getParameter("address");
int rcv_phone=Integer.parseInt(request.getParameter("phone"));
String rcv_email=request.getParameter("email");
String rcv_state=request.getParameter("state");
String rcv_city=request.getParameter("city");
String rcv_course=request.getParameter("course");
String rcv_gender=request.getParameter("gender");
int rcv_category=Integer.parseInt(request.getParameter("category"));
String rcv_religion=request.getParameter("religion");
String rcv_password=request.getParameter("password"); 
String rcv_status="ClassRoom Is Fun...!!!";
ResultSet rs,rs1;
PreparedStatement pstmt = null;
FileInputStream fis = null;
int temp=0;
int id=0;
 try{
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","suman013");
 	 Statement st=con.createStatement();
	int i=st.executeUpdate("INSERT INTO new_user1(user_reference,user_firstname,user_lastname,user_father,user_mother,user_dob,user_address,user_phone,user_email,user_state,user_city,user_course,user_gender,user_category,user_religion,user_password)VALUES('"+rcv_reference+"','"+rcv_firstname+"','"+rcv_lastname+"','"+rcv_father+"','"+rcv_mother+"','"+rcv_dob+"','"+rcv_address+"',"+rcv_phone+",'"+rcv_email+"','"+rcv_state+"','"+rcv_city+"','"+rcv_course+"','"+rcv_gender+"',"+rcv_category+",'"+rcv_religion+"','"+rcv_password+"')");
	rs=st.executeQuery("select* from new_user1 where user_email='"+rcv_email+"' and user_password='"+rcv_password+"'");
	if(rs.next())
	{
	temp=rs.getInt(1);
	}
    File image = new File("F:/eclipse-workspace/CLASSROOM_CHAT_SYSTEM/WebContent/pic.jpg");
    pstmt = con.prepareStatement("INSERT INTO user_images VALUES(?,?,?)");
    fis = new FileInputStream(image);
    pstmt.setInt(1, temp);
    pstmt.setBinaryStream(2, (InputStream) fis, (int) (image.length()));
    pstmt.setString(3,rcv_status);
    int count = pstmt.executeUpdate();
    if(rcv_category==1)
    {
    	out.print("category 1");
    	st=con.createStatement();
    rs1=st.executeQuery("select* from new_user1 where user_email= '"+rcv_email+"' and user_password ='"+rcv_password+"'");
	  if(rs1.next())
		 {
		  out.print("id print");
		  id=rs1.getInt(1);
		  %>
		  <form name="hidden_form" id="hidden_form" method="post" action="teacher_selection_form.jsp">
		  <input type="text" name="send_id" id="send_id" value="<% out.print(id); %>"> 
		  <input type="submit" name="searchButton" value="Search" />
		  </form> 
		  <script>
   window.onload = function() {
        document.getElementById("hidden_form").submit();
    }
</script>
<% 
		 }
    }
    if(rcv_category!=1)
    {
   response.sendRedirect("user_login.jsp");
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