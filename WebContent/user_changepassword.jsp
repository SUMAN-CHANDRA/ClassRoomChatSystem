<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
  <%@page import="java.sql.*" %>
     <%@include file="navigation.jsp" %> 
    <%
    if(session.getAttribute("sess_id")==null)
    {
    	 response.sendRedirect("user_login.jsp");
    	}
    else
    {
    int rcv_id=	(int)session.getAttribute("sess_id");
    Statement st=null;
    Connection con=null;
    ResultSet rs;
    int temp=0; 
    try{
   	 Class.forName("com.mysql.cj.jdbc.Driver");
   	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","suman013");
    	  st=con.createStatement();
    	  rs=st.executeQuery("select * from new_user1 where user_id="+rcv_id);
     if(rs.next())
    {
  %>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1"><!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>Knowledge Class-Room</title>
	<!-- Bootstrap -->
	<link href="css/bootstrap.min.css" rel="stylesheet" />
	<link href="css/style.css" rel="stylesheet" />
	<link href="css/font-awesome.css" rel="stylesheet" />
	<link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet" />
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet" type="text/css" />
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<script src='http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js'></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/additional-methods.js"></script>
	<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<script src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/additional-methods.js"></script><!-- this is the letters only scrip to be included-->
</head>
<body>
<header class="header">
<div class="container-fluid">
<div class="row mar-top">
<div class="col-sm-offset-2 col-sm-8">
<h3 class="transfer-text">Change Password</h3>
<div class="date-box2">
<form name="check_password" id="check_password" class="form-horizontal" role="form" method="post" action="change_password.jsp"><!-- form start over here-->
<div class="form-group"><label class="control-label col-sm-4">Previous password*</label>
<div class="col-sm-8">
<div class="row">
<div class="col-sm-12"><input name="previous_password" id="previous_password" class="form-control" placeholder="Previous password" type="text" /></div>
</div>
</div>
</div>
<input type="hidden" id="orginal_password" name="orginal_password" value="<% out.print(rs.getString(17)); %>">
<div class="form-group"><label class="control-label col-sm-4">New password *</label>
<div class="col-sm-8">
<div class="row">
<div class="col-sm-12"><input name="new_password" id="new_password" class="form-control" placeholder="New Password" type="text"/></div>
</div>
</div>
</div>
<div class="form-group"><label class="control-label col-sm-4">Confirm new password *</label>
<div class="col-sm-8">
<div class="row">
<div class="col-sm-12"><input name="confirm_newpassword" id="confirm_newpassword" class="form-control" placeholder="Confirm new password" type="text"/></div>
</div>
</div>
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
<script>

		   $(function() {
	$("form[name='check_password']").validate({
    rules: {
	previous_password:{
			  required:true,
			  equalTo: "#orginal_password"
		  },
    new_password: {
        required: true,
        minlength: 5
      },
	confirm_newpassword: {
            required: true,
            minlength: 5,
            equalTo: "#new_password"
        }
    },
    messages: 
	{
	  previous_password:{
		  required:"*please enter your previous password",
		  equalTo: "*your previous password doesn't match"
	  },
       new_password: {
        required: "*Please provide a new password",
        minlength: "*Your new password must be at least 5 characters long"
      },
	  confirm_newpassword:{            
	        required: "*Please confirm your password",
            minlength: "*Your password must be at least 5 characters long ",
            equalTo: "Password doesn't matches "
		 }
    },
    submitHandler: function(form) {
      form.submit();
    }
  });

}); 		  
</script>
</body>
</html>
<%
    }
    }catch(Exception e)
    {
    	 out.write(e.getMessage());
    }
  }
  %>