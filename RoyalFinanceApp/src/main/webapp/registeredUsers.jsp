<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.chainsys.royalfinance.model.User" %>
    <%@ page import="java.util.List" %>
     <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registered Users</title>
<style>
*
{
    box-sizing: border-box;
    padding: 0;
    margin: 0;
}
body
{
	 overflow-x:hidden;
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
button
	{
		width:100px;
		padding:5px;
		position:relative;
		left:550px;
		top:30px;
		background-color:green;
		color:white;
		border-color:green;
		font-size:20px;
	}
h1 
{
	text-align:center;
	color:#AA336A;
	position: relative;
	top:150px;
}
th
{
	background-color:#119ce7;
    color: white;
	font-size:20px;
}
td
{
	  color: grey;
	   font-size: 15px;
       font-family: Arial, Helvetica, sans-serif;
}
th, td
{
	padding: 15px;
	text-align: center;
}
table 
{
	position: relative;
	top:180px;
	left: 150px;
}
#button
{
	padding:10px;
	background-color:red;
	border-color:red;
	width:80px;
	color:white;
	font-size:15px;
}
.search
{
	position: relative;
	top:130px;
	left: 500px;
}</style>
</head>
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
				<a href="logout" style="color: transparent;"><p style="color:white; font-size:22px;">Logout</p></a>
			</aside>
		</section>
	</nav>
<form action="/searchUser" method="get" class="search">
	<input type="search" name="searchData" style="padding:8px; width:250px;" placeholder="Search">
</form>
 <table border="1px" cellspacing="0px">
	<thead>
		<tr>
	<th>Borrower Id</th>
	 <th>Name</th>
	 <th>Date Of Birth</th>
	 <th>Phone Number</th>
	 <th>Email Id</th>
	  <th>Location</th>
	 <th>Delete</th>
	   </tr>
	</thead>
	<tbody>
	  <%
	  List<User> users=(ArrayList<User>)request.getAttribute("users");
	  if (users != null && !users.isEmpty())
	  {
	  	  for(User user: users)
	  	  {
	  %>
	  <tr>
	  <td> <%=user.getId()%></td>
	   <td><%=user.getName()%></td>
	   <td><%=user.getDateOfBirth() %></td>
	   <td><%=user.getPhoneNo() %></td>
	   <td><%=user.getEmail() %></td>
	   <td><%=user.getLocation()%></td>
	    <td>
               <form action="/removeUser" method="get">
                     <input type="hidden" name="deleteId" value="<%=user.getId()%>">
                     <input type="submit" id="button" name="delete" value="Delete" class="button">
                </form>
          </td> 
	  </tr>
	   <%
			   }
			  } 
				else 
				{
	        %>
	        <tr>
	            <td colspan="15">No Records found</td>
	        </tr>
	         <%
	        }
	        %>
	</tbody>
</table> 
</body>
</html>