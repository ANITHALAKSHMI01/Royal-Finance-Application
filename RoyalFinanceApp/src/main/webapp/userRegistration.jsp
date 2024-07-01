<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
</head>
<style>
    body
    {
  		background-color:skyblue;
    }
	h1
	{
		text-align:center;
		position:relative;
		top:50px;
	}
	div
	{
		border:2px solid white;
		box-shadow:1px 1px 1px 1px;
		background-color:white;
		width:fit-content;
		height:fit-content;
		padding:30px;
		position:relative;
		left:400px;
		top:50px;
		border-radius:10px;
	}
	label
	{
		font-size:20px;
	}
	#email
	{
		position:relative;
		left:40px;
	}
	#pass
	{
		position:relative;
		left:45px;
	}
	input
	{
		height:20px;
		width:200px;
		padding:5px;
	}
	button
	{
		position:relative;
		left:120px;
		padding:6px;
		width:100px;
		font-size:18px;
		background-color:green;
		color:white;
		border-radius:10px;
		border-color:green;
	}
</style>
<script>
	function validation()
	{
		var name=document.getElementById('name');
		var email=document.getElementById('email');
		var phoneNo=document.getElementById('phone');
		var password=document.getElementById('pass');
		if(!name.checkValidity())
		{
			alert("Name should be alphabet.");
			return;  
		}
		if(!email.checkValidity())
		{
			alert("Invalid Email(Ex. xyz01@gmail.com).");
			return;  
		}
		if(!phoneNo.checkValidity())
		{
			alert("Phone should start with 6-9 and 10 digits must.");
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
<h1>User Registration</h1>
<div>
	<form action="/register" method="post">
	<label for="name">Name</label>
	<input id="name" type="text" name="name" placeholder="Name" pattern="^[A-Za-z]*" required><br><br>
	<label for="dob">D.O.B</label>
	<input id="dob" type="date" name="dateOfBirth" max="2003-01-01" min="1967-01-01"><br><br>
	<label for="phone">Phone Number</label>
	<input id="phone" type="tel" name="phoneNo" placeholder="Phone Number" maxlength=10 pattern="[6789][0-9]{9}" required><br><br>
	<label for="email">Email</label>
	<input id="email" type="email" placeholder="Email Id" name="emailId" pattern="[a-z0-9_/-/.]+[@][a-z]+[/.][a-z]{2,}$" required><br><br>
	<label for="pass">Password</label>
	<input id="pass" type="password" placeholder="Password" name="password" pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@!#$%^&*]).{6}$" maxlength=6 required><br><br>
	<label for="loc">Location</label>
	<select name="location" required>
		<option>Tenkasi</option>
		<option>Tirunelveli</option>
		<option>Madurai</option>
		<option>Trichy</option>
		<option>Coimbatore</option>
		<option>Chennai</option>
	</select><br><br> 
	<button onclick="validation()">Register</button>
</form>
</div>
</body>
</html>