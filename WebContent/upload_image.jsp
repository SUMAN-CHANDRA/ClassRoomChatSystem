<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
 <%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
    <%@page import="java.util.*" %>
    <%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
   <%@ page import="javax.servlet.http.HttpServletRequest" %>   
 <%@include file="navigation.jsp" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
 %>   
 <%
         Statement st=null;
         byte[] b=null;
Connection con=null;
PreparedStatement pstmt = null;
ResultSet rs=null;
String url="jdbc:mysql://localhost:3307/details";
FileInputStream fis=null;
String myloc=request.getParameter("user_image");
out.print(myloc);
try{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection(url, "root", "subha12345");
String sqlimage= "UPDATE user_images SET user_image=? WHERE user_id="+rcv_id;
pstmt=con.prepareStatement( sqlimage);
DiskFileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload sfu = new ServletFileUpload(factory);
List items = sfu.parseRequest(request);
Iterator iter = items.iterator();
while(iter.hasNext()) {
   FileItem item = (FileItem) iter.next();
   if (!item.isFormField()) {
        b = item.get();
    }
}
pstmt.setBytes(1, b);
int k=pstmt.executeUpdate();
response.sendRedirect("showimage.jsp");
}
catch(Exception ex)
{
ex.printStackTrace();
}
%>
    </body>
</html>
<%
}
%>
