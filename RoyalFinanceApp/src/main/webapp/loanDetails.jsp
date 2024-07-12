<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.chainsys.royalfinance.model.Loan" %>
    <%@ page import="java.util.List" %>
     <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loan Details</title>
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
	padding: 5px;
	text-align: center;
}
 table 
{
	position: relative;
	top: 150px;
	left:90px;
} 
#search
{
	position:relative;
	left:550px;
	top:120px; 
	padding:5px;
}
button
{
	padding:5px;
	background-color:#0077b6;
	border-color:#0077b6;
	color:white;
	fon-size:25px;
	width:80px;
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
	<form action="/searchLoanDetail" method="get">
		<input type="text" placeholder="Search" id="search" name="searchData">
	</form>
<table border="1px" cellspacing="0px">
	<thead>
		<tr>
	<th>Loan Id</th>
	<th>Borrower Id</th>
	<th>Loan Issued</th>
	<th>Interest(%)</th>
	<th>Tenure(In Months)</th>
	<th>Total Amount</th>
	<th>Distribusal Amount</th>
	<th>Interest Amount</th>
	<th>Due Date</th>
	<th>Payment Status</th>
	<th>Send EMI Bill</th>
	 </tr>
	</thead>
	<tbody>
	<%
		List<Loan> loans=(ArrayList<Loan>)request.getAttribute("loans");
		if (loans != null && !loans.isEmpty())
		{
			 try
			 {
				 for (Loan amount : loans)
				 {		
			%>
	<tr>
		<td><%=amount.getLoanId() %></td>
		<td><%=amount.getBorrowerId() %></td>
		<td><%=amount.getDate() %></td>
		<td><%=amount.getInterest()%></td>
		<td><%=amount.getTenure()%></td>
		<td><%=amount.getDistribusalAmount()+amount.getReduction()%></td>
		<td><%=amount.getDistribusalAmount()%></td>
		<td><%=amount.getReduction() %></td>
		<td><%=amount.getDueDate() %></td>
		<td><%=amount.getPaymentStatus() %></td>
		<td>
			<form action="/updateEMI" method="get">
				<input type="hidden" name="id" id="borrower" value="<%=amount.getBorrowerId() %>">
				<input type="hidden" name="loanId" id="loan" value="<%=amount.getLoanId() %>">
				<button>Send</button>
			</form>
		</td>
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
	            <td colspan="15">No Records found</td>
	        </tr>
	        <%
	        }
	        %>
	</tbody>
</table>
</body>
</html>