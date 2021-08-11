<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="java.util.*" %>
  <%@page import="java.sql.*" %>
   
<%@ page import="javax.servlet.http.HttpServletRequest" %> 
  <%@include file="navigation.jsp" %>  
 <% 
if(session.getAttribute("sess_id")==null)
{
	 response.sendRedirect("user_login.jsp");
	}
else
{
System.out.println(session.getAttribute("sess_id")+" in profile update");
int rcv_id=	(int)session.getAttribute("sess_id");
%>   
<!DOCTYPE html>
<html lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1"><!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>Knowledge Class-Room</title>
	<link href="css/bootstrap.min.css" rel="stylesheet" />
	<link href="css/style.css" rel="stylesheet" />
	<link href="css/font-awesome.css" rel="stylesheet" />
	<link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet" />
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet" type="text/css" /><!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries --><!-- WARNING: Respond.js doesn't work if you view the page via file:// --><!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
    <![endif]-->
<script src='http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js'></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/additional-methods.js"></script>
	<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<script src="http://ajax.microsoft.com/ajax/jquery.validate/1.7/additional-methods.js"></script><!-- this is the letters only scrip to be included-->
<script src="http://docs.jquery.com/Plugins/Validation/Methods/digits"></script>
</head>
<body>
<% ResultSet rs;
try{
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","suman013");
	 Statement st=con.createStatement();
	  rs=st.executeQuery("select * from new_user1 where user_id="+rcv_id);
       if(rs.next())
		 {
%>
<header class="header">
<div class="container-fluid">
<div class="row mar-top">
<div class="col-sm-offset-2 col-sm-8">
<h3 class="transfer-text">PROFILE VIEW</h3>
<div class="date-box2">
<form class="form-horizontal" role="form" name="registration" id="registration" method="post" action="user_update.jsp"><!-- form start over here-->
<div class="form-group"><label class="control-label col-sm-4">Reference*</label>
<div class="col-sm-8">
<div class="row">
<div class="col-sm-12"><input name="reference" id="reference" class="form-control" placeholder="Reference" type="text" value="<% out.print(rs.getString(2)); %>"/></div>
</div>
</div>
</div>
<div class="form-group">
<label class="control-label col-sm-2" for="email">First Name *</label>
<div class="col-sm-4"><input name="first_name" id="first_name" class="form-control" type="text" value="<% out.print(rs.getString(3)); %>" /></div>
<label class="control-label col-sm-2" for="email"> &nbsp&nbsp&nbspLast Name *</label>
<div class="col-sm-4"><input name="last_name" id="last_name" class="form-control" type="text"value="<% out.print(rs.getString(4)); %>" /></div>
</div>
<div class="form-group"><label class="control-label col-sm-4">Father's Name *</label>
<div class="col-sm-8">
<div class="row">
<div class="col-sm-12"><input name="father_name" id=="father_name" class="form-control" placeholder="Name" type="text"value="<% out.print(rs.getString(5)); %>" /></div>
</div>
</div>
</div>
<div class="form-group"><label class="control-label col-sm-4">Mother's Name *</label>
<div class="col-sm-8">
<div class="row">
<div class="col-sm-12"><input name="mother_name" id="mother_name" class="form-control" placeholder="Name" type="text" value="<% out.print(rs.getString(6)); %>" /></div>
</div>
</div>
</div>
<div class="form-group"><label class="control-label col-sm-4">Date Of Birth *</label>
<div class="col-sm-8">
<div class="row">
<div class="col-sm-12"><input name="dob" id="dob" class="form-control" type="date"value="<% out.print(rs.getDate(7)); %>" /></div>
</div>
</div>
</div>
<div class="form-group"><label class="control-label col-sm-4">Address *</label>
<div class="col-sm-8">
<div class="row">
<div class="col-sm-12"><input name="address" id="address" class="form-control" placeholder="***,abc road.kolkata:***" type="text"value="<% out.print(rs.getString(8)); %>" /></div>
</div>
</div>
</div>
<div class="form-group">
<label class="control-label col-sm-2" for="email">Phone *</label>
<div class="col-sm-4"><input name="phone" id="phone" class="form-control" type="phone"value="<% out.print(rs.getInt(9)); %>" /></div>
<label class="control-label col-sm-2" for="email">Email *</label>
<div class="col-sm-4"><input name="email" id="email" class="form-control" type="email"value="<% out.print(rs.getString(10)); %>"readonly /></div>
</div>
<div class="form-group"><label class="control-label col-sm-2" for="email">State *</label>
<div class="col-sm-4"><input id="state" name="state" class="form-control" type="text" placeholder="West-bengal"value="<% out.print(rs.getString(11)); %>" /></div>
<label class="control-label col-sm-2" for="email">City *</label>
<div class="col-sm-4"><input name="city" id="city" class="form-control" type="text" placeholder="Kolkata" value="<% out.print(rs.getString(12)); %>" /></div>
</div>
<% 
int v=rs.getInt(13);
%>
<div class="form-group">
<label class="control-label col-sm-2" for="email">Course Offered*</label>
<div class="col-sm-4"><select class="form-control" name="course" id="course" disabled="true">
   <% if(v==1)
     out.print("<option value='1' >History</option>");
   if(v==2)
	out.print("<option>Geography</option>");
   if(v==3)
	   out.print("<option>Maths</option>");
   if(v==4)
	   out.print("<option>Physics</option>");
   if(v==5)	
	   out.print("<option>Chemistry</option>");
  if(v==6)	
	  out.print("<option>Biology</option>");
  else
  {out.print("<option value='1' >History</option>");
  out.print("<option>Geography</option>"); 
  out.print("<option>Maths</option>");
  out.print("<option>Physics</option>");
  out.print("<option>Chemistry</option>");
  out.print("<option>Biology</option>");
  }
  %>
</select></div>

<% String f=rs.getString(14); 
%>
<label class="control-label col-sm-2" for="email">gender*</label>
<div class="col-sm-4"><select class="form-control" name="gender" id="gender">
  <% if(f=="M")
    out.print("<option> Male</option>");
	 if(f=="F")	
	out.print("<option>Female</option>");
	if(f=="O")
	 out.print("<option>Others</option>");
	else
	{out.print("<option> Male</option>");
	out.print("<option>Female</option>");
	out.print("<option>Others</option>");
	}
  %>
</select></div>
</div>
<% 
int i=rs.getInt(13);
%>
<div class="form-group">
<label class="control-label col-sm-2" for="email">category*</label>
<div class="col-sm-4"><select class="form-control" name="category" id="category" disabled="true"  >
    <%
    if(i==1)
    out.print("<option value=1>Student</option>");
    if(i==2)
	out.print("<option>Teacher</option>");
    else
    {
    	out.print("<option value=1>Student</option>");
    	out.print("<option>Teacher</option>");
    }
	%>
</select></div>
<label class="control-label col-sm-2" for="email">Religion*</label>
<div class="col-sm-4"><input name="religion" id="religion" class="form-control" type="text"value="<% out.print(rs.getString(16)); %>" /></div>
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
	$("form[name='registration']").validate({
    rules: {

    first_name: {
		  required: true,
		  lettersonly:true
		  },
	last_name: {
		  required: true,
		  lettersonly:true
		  },
	phone : { 
		required : true,
		digits:true },
	father_name: {
		  required: true,
		  },
	mother_name: {
		  required: true,
		  },

         dob:{
			  required:true
		  },
	address:{
			  required:true
		  },
	gender:{
			  required:true
		  },
        course:{
			  required:true
		  },
          state:{
			  required:true
		  },
           city:{
			  required:true
		  },
      
      email: {
        required: true,
        email: true
      },
    password: {
        required: true,
        minlength: 5
      },
	repassword: {
            required: true,
            minlength: 5,
            equalTo: "#password"
        }
    },
    messages: 
	{
      first_name:{required: "*Please enter your firstname",
	  lettersonly:"*Please enter a valid name "
	  },
	  last_name:{required: "*Please enter your lastname",
	  lettersonly:"*Please enter a valid name "
	  },
	  father_name:{required: "*Please enter your father name",
	  lettersonly:"*Please enter a valid name "
	  },
	  mother_name:{required: "*Please enter your mother name",
	  lettersonly:"*Please enter a valid name "
	  },
	  address:{
		  required:"*please enter your address"
	  },
	  gender:{
		  required:"*please enter your gender"
	  },
           dob:{
		  required:"*please enter your dob"
	  },
         course:{
		  required:"*please enter your course"
	  },
          phone : { 
		required : "*please enter your phone number",
		digits: "*please enter your valid phone number" },
         state:{
		  required:"*please enter your state"
	  },
         city:{
		  required:"*please enter your city<"
	  },
      password: {
        required: "*Please provide a password",
        minlength: "*Your password must be at least 5 characters long"
      },
	  repassword:{            
	        required: "*Please confirm your password",
            minlength: "*Your password must be at least 5 characters long ",
            equalTo: "Password doesn't matches "
		  
	  },
      email: "*Please enter a valid email address"
    },
    submitHandler: function(form) {
      form.submit();
    }
  });
}); 
</script>
    <%
    }
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
    <% 
    }
    %>
    
    
    
    
    
    
 