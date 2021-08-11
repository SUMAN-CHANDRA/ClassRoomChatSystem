<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="navigation1.jsp" %> 
     <%@page import="java.util.*" %>
        <%@page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Knowledge Class-Room</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Knowledge Class-Room</title>
   <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
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
%>
<p class="blue-bg">TEACHER LISTING</p>
    <section class="list-wrap">
    	<div class="container-fluid">
        	<table class="table-bordered" width="100%" border="1" cellspacing="1" cellpadding="2">
              <tbody>
                <tr class="blue-bg">
                 <th scope="col">First-Name</th>
                    <th scope="col">Last-Name</th>				  
                  <th scope="col">Phone</th>
                  <th scope="col">Email</th>
                  <th scope="col">Address</th>
                  <th scope="col">State</th>
				  <th scope="col">Subject</th>
				  <th scope="col">Teacher</th>
				  <th scope="col">Active/In-active</th>
                </tr>
				<%
				rs=st.executeQuery("select* from new_user1 ");
				while(rs.next())
				{
				if(rs.getInt(15)==2)
				{
        		%>	
				<tr>
                  <td><% out.print(rs.getString(3)); %></td>
                  <td><% out.print(rs.getString(4)); %></td>
	              <td><% out.print(rs.getInt(9)); %></td>
                  <td><% out.print(rs.getString(10)); %></td>
                  <td><% out.print(rs.getString(8)); %></td>
                  <td><% out.print(rs.getString(11)); %></td>
				  <td><% out.print(rs.getInt(13)); %></td>
				  <td><% out.print(rs.getString(19)); %></td>
				     <td><a href="status.jsp?pass_id=<%out.print(rs.getInt(1));%>" <% if(rs.getInt(18)==1){out.print("class='call-btn'");}else{out.print("class='red'");} %>>Status</a></td>
				</tr>
<%
	}
 }
}catch(Exception e)
{
	 out.write(e.getMessage());
}
%>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
				  <td>&nbsp;</td>
                  <td>&nbsp;</td>
				  <td>&nbsp;</td>
                </tr>
              </tbody>
            </table>
        </div>
    </section>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
    <script>
    	 $(document).ready(function() {
			$("#datepicker").datepicker();
			$("#datepicker2").datepicker();
		  });
		  function func_delete(delid)
		  {
			 if(confirm("DO YOU WANT TO DELETE"))
			 {
				 window.location.href='user_delete.php?del_id='+delid+'';
				 return true;
			 
			 }				 
		  }
    </script>
</body>
</html>