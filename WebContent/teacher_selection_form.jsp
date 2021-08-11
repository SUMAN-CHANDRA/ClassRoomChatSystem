<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.util.*" %>
  <%@page import="java.sql.*" %>
   <%@ page import="javax.servlet.http.HttpServletRequest" %> 
  <%@include file="navigation.jsp" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Knowledge Class-Room</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1"><!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>Sunshine Info Solutions</title>
	<!-- Bootstrap -->
	<link href="css/bootstrap.min.css" rel="stylesheet" />
	<link href="css/style.css" rel="stylesheet" />
	<link href="css/font-awesome.css" rel="stylesheet" />
	<link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet" />
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet" type="text/css" />
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
</head>
<body>
<header class="header">
<div class="container-fluid">
<div class="row mar-top">
<div class="col-sm-offset-2 col-sm-8">
<h3 class="transfer-text">TEACHER SELECTION</h3>
<div class="date-box2">
<form class="form-horizontal" role="form" method="post" action="teacher_selection.jsp"><!-- form start over here-->
<%
int rcv_id=Integer.parseInt(request.getParameter("send_id"));
int rcv_course=0;
 ResultSet rs,rs1;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","suman013");
	 Statement st=con.createStatement();
	  rs=st.executeQuery("select * from new_user1 where user_id= "+rcv_id);
	  if(rs.next())
		 {
		  rcv_id=rs.getInt(1);
		 rcv_course=rs.getInt(13);
%>
<input type="hidden" name="user_id_t" id="user_id_t" value="<%out.print(rcv_id); %>">
<div class="form-group"><label class="control-label col-sm-4">Course Selected *</label>
<div class="col-sm-8">
<div class="row">
<div class="col-sm-12"><input name="course_selected" id="course_selected" class="form-control" type="text" 
value="<%
switch(rs.getInt(13))
{
	case 1:out.print("History");
	break;
	case 2:out.print("Geography");
	break;
	case 3:out.print("Maths");
	break;
	case 4:out.print("Physics");
	break;
	case 5:out.print("Chemistry");
	break;
	case 6:out.print("Biology");
	break;
	default:out.print("error");
	break;
}
%>" readonly /></div>
</div>
</div>
</div>
<% 
} 
%>
<div class="form-group">
<label class="control-label col-sm-2" for="email">Teacher*</label>
<div class="col-sm-4"><select class="form-control" name="teacher_appoint" id="teacher_appoint">
<%
st=con.createStatement();
rs1=st.executeQuery("SELECT * FROM new_user1 WHERE user_course="+rcv_course+" AND user_category="+2);
if(!rs1.next())
{%>
<option value="" disabled selected>No Teacher Available</option>
<%
}
else
{
%>
<option value="" disabled selected>Select from option</option>
<%
while(rs1.next())
{	
%>
<option value="<%out.print(rs1.getInt(1));  %>"><%out.print(rs1.getString(3)+"  "+rs1.getString(4));  %></option>
<%
}
}
%>
</select></div>
</div>
<div class="form-group">
<div class="col-sm-offset-4 col-sm-8"><button class="btn btn-blue" type="submit">Submit</button></div>
</div>
</form>
</div>
</div>
</div>
</div>
</header>
<script src="js/jquery.min.js"></script><script src="js/bootstrap.min.js"></script><script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script><script>
    	 $(document).ready(function() {
			$("#datepicker").datepicker();
			$("#datepicker2").datepicker();
		  });
    </script>
    <%  
	  con.close();
		st.cancel();
	}
		  catch(Exception e)
	{
		 out.write(e.getMessage());
	}
    %>
</body>
</html>