<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>ApnaCMS :: Login</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>

	 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    
    <link rel="stylesheet" href="assets/css/login.css">
    
    <!-- jquery-ui CSS -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>	
	<div class="container">
			<div class = "login-container">
			<div class = "login-header text-center">
				<h6>ApnaCMS</h6> 
			</div>
			<div class = "login-body p-3">
				<div class = "text-center ">
					<b class = "p-3">Log In</b>
				</div>
				<hr> 
				<form action="./AdminPanel" method = "POST"> 
					<div class="form-group">
						<label for="email_id">Email address</label> <input type="email"
								class="form-control" name="email_id"
								style="font-size: 10px; color: black"
								placeholder="Enter email address">
					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							class="form-control" name="password"
							style="font-size: 10px; color: black"
							placeholder="Enters password">
					</div>
					<div class="text-right">
						<a href="javascript:void(0)"
							onclick="location.href='ForgotPassword'"
							style="font-weight:bolder;color: black; text-decoration: none;">Forgot Password?</a>
					</div>
					<div class="text-center mt-2">
						<button type="submit" class="btn formsubmitbtn form-control">Submit</button>
					</div>
					<hr>
				</form>


			</div>
			
		</div>
		</div>

	
    
    <script src="assets/js/jquery-3.5.1.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>