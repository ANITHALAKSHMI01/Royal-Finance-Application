<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.util.ArrayList"%>
     <%@page import="com.chainsys.royalfinance.model.Payment"%>
     <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment History</title>
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
    position:relative;
	left:130px;
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
	left: 250px;
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
	bottom:5px;
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
	<table>
		<thead>
		<tr>
			<th>Payment Id</th>
			<th>User Id</th>
			<th>Payment Date</th>
			<th>From Account</th>
			<th>To Account</th>
			<th>Amount</th>
			</tr>
		</thead>
		<tbody>
		<%
			List<Payment> list=(ArrayList<Payment>)request.getAttribute("payment");
			 if (list != null && !list.isEmpty())
			  {
				  try
				  {
				  		for (Payment payment : list)
				  		{%>
		<tr>
			<td><%=payment.getPaymentId() %></td>
			<td><%=payment.getUserId() %></td>
			<td><%=payment.getDate() %></td>
			<td><%=payment.getFromAccount() %></td>
			<td><%=payment.getToAccount() %></td>
			<td><%=payment.getAmount() %></td>
		<%
			   }
				  		
				  }
				  catch (Exception e) 
				  { 
						e.printStackTrace();
				   }
			  } 
			else 
			{
        %>
        </tr>
        <tr>
            <td colspan="14">No Records found</td>
        </tr>
        <%
        }
        %>
				 
		</tbody>
	</table>
</body>
</html>