<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Details</title>
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
		top:100px;
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
		left:450px;
		top:120px;
		border-radius:10px;
	}
	label
	{
		font-size:25px;
	}
	#name
	{
		position:relative;
		left:90px;
	}
	#email
	{
		position:relative;
		left:90px;
	}
	#loc
	{
		position:relative;
		left:63px;
	}
	input
	{
		height:20px;
		width:200px;
		padding:5px;
	}
	#loc
	{
		position:relative;
		left:63px;
		padding:7px;
		width:214px;
		font-size:15px;
	}
	button
	{
		position:relative;
		left:140px;
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
		var location=document.getElementById('loc');
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
		if(!location.checkValidity())
		{
			alert("Location should be alphabet.");
			return;  
		}
	}
</script>
<body>
<div>
	<form action="/updateUserDetails" method="get">
   <label for="name">Name</label>
    <input id="name" type="text" name="name" value="<%=request.getParameter("name")%>" readonly><br><br> 
   <label for="phone">Phone Number</label>
	<input id="phone" type="tel" name="phoneNo" placeholder="Phone Number" maxlength=10 pattern="[6789][0-9]{9}" required><br><br>
    <label for="email">Email</label>
	<input id="email" type="email" value="<%=request.getParameter("email")%>" name="emailId" readonly><br><br>
	<label for="loc">Location</label>
	<select name="location" id="loc" required>
		<option>Tenkasi</option>
		<option>Tirunelveli</option>
		<option>Madurai</option>
		<option>Trichy</option>
		<option>Coimbatore</option>
		<option>Chennai</option>
	</select><br><br> 
	<input type="hidden" name="id" value="<%= request.getParameter("id") %>">
	<button  onclick="validation()">Update</button></form>
</div>
</body>
</html>