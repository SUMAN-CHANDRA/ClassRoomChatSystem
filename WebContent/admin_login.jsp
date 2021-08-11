<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="admin_login.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src='http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js'></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/additional-methods.js"></script>
<title>Knowledge Class-Room</title>
</head>
<body>
<div class="container" style="margin-top:40px">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong>Welcome To ClassRoom Admin</strong>
					</div>
					<div class="panel-body">
						<form role="form" action="admin_session.jsp" method="POST" name="login" id="login">
							<fieldset>
								<div class="row">
									<div class="center-block">
										<img class="profile-img"
											src="admin.jpg" alt="">
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 col-md-10  col-md-offset-1 ">
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">
													<i class="glyphicon glyphicon-user"></i>
												</span> 
												<input class="form-control" placeholder="Username" name="login_name" id="login_name" type="text" autofocus>
												<input type="hidden" name="hide_name" id="hide_name" value="admin">
												<input type="hidden" name="hide_password" id="hide_password" value="admin@123">
											</div>
										</div>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">
													<i class="glyphicon glyphicon-lock"></i>
												</span>
												<input class="form-control" placeholder="Password" name="login_password" id="login_password" type="password" value="">
											</div>
										</div>
										<div class="form-group">
											<input type="submit" class="btn btn-lg btn-primary btn-block" value="Sign in">
										</div>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
                </div>
			</div>
		</div>
	</div>
<script>
$(function() {
	$("form[name='login']").validate({
    rules: {
    	login_name: {
		  required: true,
		  equalTo: "#hide_name"
		  },
		  login_password: {
            required: true,
            equalTo: "#hide_password"
        }
    },
    messages: 
	{
    	login_name:{
      required: "*Please enter name",
      equalTo: "Name doesn't matches "
	  },
	  login_password:{            
	        required: "*Please enter password",
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
