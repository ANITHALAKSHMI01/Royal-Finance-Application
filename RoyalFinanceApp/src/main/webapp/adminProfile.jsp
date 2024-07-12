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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="icon" type="image/x-icon" href="images/flogo.jpg">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
    position:relative;
	left:130px;
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
		height:330px;
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
		position:relative;
		left:20px;
	}
	.but1
	{
		position:relative;
		left:150px;
		bottom:45px;
	}
	h4
   {
	 color:white;
	 position:relative;
	 left:100px;
	 bottom:40px;
	 font-size:25px;
   }
   .dropdown-menu 
{
    background-color: #F5F5F5;
    border: none;
    height:90px;
}
.dropdown-item:hover 
{
    background-color: #E8E5D7;
    border-radius: 12px; 
}
.dropdown:hover .dropdown-menu 
{

   display: block;
   margin-top: 0;
}
i
{
	position:relative;
	left:10px; 
	font-size:25px;
	color:white;
}
</style>
<body>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<nav id="navbar">
		<section id="left_nav">
			<img src="images/flogo.jpg" alt="image" id="image1">
			<h4>Royal Finance</h4>
		</section>
		<section id="right_nav">
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
			     <li class="nav-item dropdown" id ="profile" type="none">
                <i class="fa-regular fa-user"></i>
                   <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                     <a class="dropdown-item" href="userDetail">Profile</a>
                     <a class="dropdown-item" href="logout">Logout</a>
                    </div>
                 </li>
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
<label><b>Admin Id : </b></label><p><%= user.getId()%></p><br>
<label><b>Name   :   </b></label><p> <%= user.getName()%></p><br>
<label><b>Date Of Birth : </b></label><p> <%= user.getDateOfBirth() %></p><br>
<label><b>Phone Number : </b></label> <p> <%= user.getPhoneNo() %></p><br>
<label><b>Email Id : </b></label><p><%= user.getEmail() %></p><br>
<label><b>Location : </b></label><p><%= user.getLocation()%></p><br>
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