<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="com.chainsys.royalfinance.model.User" %>
 <%@ page import="java.util.List" %>
 <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
</head>
<style>
*
{
    box-sizing: border-box;
    padding: 0;
    margin: 0;
}
#navbar
{
   border: 2px solid #0077b6; 
   height: 75px;
   width: 100%;
   display: flex;
    box-shadow: 2px 2px 2px 2px rgba(0,0,0,0.2);
   position: fixed;
   top: 0;
   z-index: 1;
  background-color: #0077b6;
} 
#left_nav
{
   width: 30%;
   height: 100%; 
}
#right_nav
{
    width: 70%;
    height: 100%;  
    display: flex;
    justify-content: flex-end; 
    align-items: center; 
    gap: 30px;
    margin-right:25px;
}
#image1
{
	border-radius:50%;
	width:55px;
	height:55px;
	position:relative;
	top:10px;
	left:10px;
}
	div
	{
		border:2px solid #D3D3D3;
		width:fit-content;
		height:340px;
		padding:30px;
		position:relative;
		left:450px;
		top:130px;
		background-color:#D3D3D3;
		box-shadow:1px 1px 1px 1px rgba(0,0,0,0.2);
	}
	label
	{
		font-size:20px;
	}
	p
	{
		display:inline;
		font-size:20px;
		/* color:white; */
		position:relative;
		left:20px;
	}
	button
	{
		width:100px;
		padding:5px;
		background-color:#0077b6;
		color:white;
		border-radius:10px;
		border-color:#0077b6;
		font-size:20px;
	}
	.but1
	{
		position:relative;
		left:120px;
		bottom:35px;
	}
</style>
<body>
<nav id="navbar">
		<section id="left_nav">
			<img src="images/flogo.jpg" alt="image" id="image1">
		</section>
		<section id="right_nav">
			<aside>
				<a href="userDetail" style="color: transparent;"><p style="color:white; font-size:22px;">Profile<p></a>
			</aside>
			<aside>
				<a href="listAllUsers" style="color: transparent;"><p style="color:white; font-size:22px;">Registered Borrowers</p></a>
			</aside>
			<aside>
				<a href="listAllBorrowers" style="color: transparent;"><p style="color:white; font-size:22px;">Lenders</p></a>
			</aside>
			<aside>
				<a href="getAllLoans" style="color: transparent;"><p style="color:white; font-size:22px;">Loan Details</p></a>
			</aside>
			<aside>
				<a href="paymentHistory" style="color: transparent;"><p style="color:white; font-size:22px;">Payment History</p></a>
			</aside>
			<aside>
				<a href="logout" style="color: transparent;"><p style="color:white; font-size:22px;">Logout</p></a>
			</aside>
		</section>
	</nav>
<div>
 <%
 List<User> userDetail=(ArrayList<User>)request.getAttribute("userDetail");
 if (userDetail != null && !userDetail.isEmpty())
 {
 	  for(User user: userDetail)
 	  {
 %>
<label><b>Admin Id : </b></label><p><%= user.getId()%></p><br><br>
<label><b>Name   :   </b></label><p> <%= user.getName()%></p><br><br>
<label><b>Date Of Birth : </b></label><p> <%= user.getDateOfBirth() %></p><br><br>
<label><b>Phone Number : </b></label> <p> <%= user.getPhoneNo() %></p><br><br>
<label><b>Email Id : </b></label><p><%= user.getEmail() %></p><br><br>
<label><b>Location : </b></label><p><%= user.getLocation()%></p><br><br>
<form action="updateUser.jsp">
<input type="hidden" name="id" value="<%= user.getId() %>">
<input type="hidden" name="name" value="<%= user.getName() %>">
<input type="hidden" name="email" value="<%= user.getEmail() %>">
<button>Edit</button>
</form>
<%
			   }
			  } 
				else 
				{
	        %>
	            <p>No Records found</p>
	         <%
	        }
	        %>
<a href="adminHomePage.jsp"><button class="but1">Back</button></a>
</div>
</body>
</html>