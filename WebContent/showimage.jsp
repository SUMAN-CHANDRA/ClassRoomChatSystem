<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"   import="java.sql.*"%>
    <%@include file="navigation.jsp" %> 
    <%@ page import="javax.servlet.http.HttpServletRequest" %>    <%@page import="java.util.*" %>
    <%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
 <%   
    if(session.getAttribute("sess_id")==null)
{
	 response.sendRedirect("user_login.jsp");
	}
else
{
int rcv_id=	(int)session.getAttribute("sess_id");
     %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Knowledge Class-Room</title>
<style type="text/css">
   #content{
   	width: 50%;
   	margin: 20px auto;
   	border: 1px solid #cbcbcb;
   }
   form{
   	width: 50%;
   	margin: 20px auto;
   }
   form div{
   	margin-top: 5px;
   }
   #img_div{
   	width: 60%;
   	padding: 5px;
   	margin: 15px auto;
   	border: 1px solid #cbcbcb;
   	text-align: center;
   }
   #img_div:after{
   	content: "";
   	display: block;
   	clear: both;
   }
   img{
   	float: bottom;
   	margin: 5px;
   	width: 200px;
   	height: 200px;
   	border-radius: 50%;
   }
</style>
</head>
<body>
<div id="content">
     <div id='img_div'>
<%
  Statement st=null;
Connection con=null;
ResultSet rs;
int temp=0; 
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","suman013");
	  st=con.createStatement();
   rs=st.executeQuery("select * from user_images where user_id="+rcv_id);
 if(rs.next())
 {
	String imgDataBase64=null;
	imgDataBase64=new String(Base64.getEncoder().encode(rs.getBytes(2)));
out.print("<img src='data:image/jpeg;base64,"+imgDataBase64+"' style='border-radius:50%;'/>");
 %>
<p><% out.print(rs.getString(3));} %></p>
   </div>
   <form method="POST" action="upload_image.jsp" enctype="multipart/form-data">
 	<div>
  	  <input type="file" name="user_image">
  	</div>
  	<div>
       <input type="hidden" name="user" value="Say something about this image...">
  	</div>
  	<div>
  		<input type="submit" name="upload" value="UPLOAD">
  	</div>
  </form>
   <form method="POST" action="upload_status.jsp">
  	
  	<div>
  	  <!-- <input type="file" name="user_image"> -->
  	</div>
  	<div>
       <input type="text" name="user_text" id="user_text" placeholder="Say something about your status...">
     <!--   <input type="hidden" name="user" value="Say something about this image..."> -->
  	</div>
  	<div>
  		<input type="submit" name="upload" value="UPLOAD">
  	</div>
  </form>  
</div>
</body>
</html>
<%
con.close();
	st.cancel();
	}catch(Exception e)
{
	 out.write(e.getMessage());
}  }
%>