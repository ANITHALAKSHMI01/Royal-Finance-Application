<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
</head>
<style>
body 
{
	background-image: url("images/login.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 100%;
	overflow: hidden;
}

h1
 {
	text-align: center;
	position: relative;
	top: 100px;
	left: 20px;
}

div 
{
	border: 2px solid #157cb4;
	box-shadow: 1px 1px 1px 1px;
	background-color: #157cb4;
	width: fit-content;
	height: fit-content;
	padding: 30px;
	position: relative;
	color: white;
	left: 450px;
	top: 120px;
	border-radius: 10px;
}

label 
{
	font-size: 25px;
}

#email 
{
	position: relative;
	left: 40px;
}

#pass
 {
	position: relative;
	left: 7px;
}

input
 {
	height: 20px;
	width: 200px;
	padding: 5px;
}

button
 {
	position: relative;
	left: 120px;
	padding: 6px;
	width: 100px;
	font-size: 18px;
	background-color: rgb(88, 171, 199);
	color: white;
	border-radius: 10px;
	border-color: rgb(88, 171, 199);
}

p
{
	font-size: 20px;
}
</style>
<script>
	function validation()
	{
		var email=document.getElementById('email');
		var password=document.getElementById('pass');
		if(!email.checkValidity())
		{
			alert("Invalid Email(Ex. xyz01@gmail.com).");
			return;  
		}
		if(!password.checkValidity())
		{
			alert("Password should contain atleast one lowercase,uppercase,number,special character and 6 digits must.");
			return;  
		}
	}
</script>
<body>
<h1>Login</h1>
<div>
	<form action="/login" method="post">
	<label for="email">Email</label>
	<input id="email" type="email" placeholder="Email Id" name="emailId" pattern="[a-z0-9_/-/.]+[@][a-z]+[/.][a-z]{2,}$" required><br><br>
	<label for="pass">Password</label>
	<input id="pass" type="password" placeholder="Password" name="password" pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@!#$%^&*]).{6}$" maxlength=6 required><br><br>
	<button onclick="validation()">Login</button>
	<p>Don't have an account?<a  href="userRegistration.jsp" style="text-decoration:none; color:black; font-weight:bold;">Register</a></p>
</form>
</div>
</body>
</html>