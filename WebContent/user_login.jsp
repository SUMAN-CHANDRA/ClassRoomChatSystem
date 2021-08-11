<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="user_login.css">
<script type="text/javascript" src="user_loginl.js" ></script>
</head>
<body>
<div class="container">
            </div> 
            <div class="wrap">
                <p class="form-title">
                    Login Page</p>
               <form class="login" name="login_form" id="login_form" method="post" action="login_check.jsp">
                <input name="entered_email" id="entered_email" type="email" placeholder="email" />
                <input name="entered_password" id="entered_password" type="password" placeholder="Password" />
                <input type="submit" value="Sign In" class="btn btn-success btn-sm" />
				<a href="dashboard_form.jsp">Sign up</a>
                </form>
			</div>
        </div>
    </div>
</div>
</body>
</html>
