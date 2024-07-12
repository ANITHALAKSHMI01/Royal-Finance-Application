<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.chainsys.royalfinance.model.Borrower" %>
    <%@ page import="java.util.List" %>
     <%@ page import="java.util.ArrayList" %>
     <%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lenders</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="icon" type="image/x-icon" href="images/flogo.jpg">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<style>
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
button
	{
		width:100px;
		padding:5px;
		position:relative;
		left:550px;
		top:300px;
		background-color:green;
		color:white;
		border-color:green;
		font-size:20px;
	}
h1 
{
	text-align:center;
	color:#AA336A;
}
th
{
	background-color:#119ce7;
    color: white;
	opacity:0.7;
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
} 
.button
{
	padding:8px;
	background-color:green;
	border-color:green;
	width:90px;
	color:white;
	font-size:15px;
}
#search
{
	position:relative;
	left:150px;
	top:30px;
}
#approve
{
	padding:10px;
}
.delete
{
    padding:5px;
	background-color:red;
	border-color:red;
	width:70px;
	color:white;
	font-size:15px;
	position:relative;
	top:20px;
}
 .back
{
	position:relative;
	top:1000px;
} 
#filter
{
	position:relative;
	top:110px;
	left:900px;
	padding:5px;
}
.button1
{
	position:relative;
	top:110px;
	left:950px;
	padding:5px;
	width:100px;
}
#search
{
	position:relative;
	left:550px;
	top:140px; 
	padding:5px;
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
	<form action="/searchBorrowerByStatus" method="get">
		<input type="text" placeholder="Search" id="search" name="searchData">
	</form>
	<form action="/getBorrowerByStatus" method="get">
	  			<select name="filter" id="filter">
				    	<option>Status</option> 
				      	<option>Approved</option>
				      	<option>On Progress</option>
		                <option>Rejected</option>
	                	<option>Unapproved</option>
	                 <input type="submit"  value="Filter" class="button1">
				   </select>
	 		</form>
	<table border="2px" cellspacing="0px">
	<thead>
		<tr>
	<th>Application Id</th>
	<th>Borrower Id</th>
	 <th>Salary</th>
	 <th>Loan Amount</th>
	 <th>Tenure</th>
	 <th>Account No</th>
	 <th>PAN</th>
	  <th>City</th>
	  <th>State</th>
	  <th>Pincode</th>
	  <th>Pay Slip</th>
	 <th>Proof</th>
	 <th>Status</th>
	 <th>Remove Lender</th>
	   </tr>
	</thead>
	<tbody>
			<%
			List<Borrower> borrowers=(ArrayList<Borrower>)request.getAttribute("borrowers");
			 if (borrowers != null && !borrowers.isEmpty())
			  {
				  try
				  {
				  		for (Borrower borrower : borrowers)
				  		{
					byte[] proofImage = borrower.getProof();
					String proof = Base64.getEncoder().encodeToString(proofImage);
					byte[] paySlipImage=borrower.getPaySlip();
					String paySlip = Base64.getEncoder().encodeToString(paySlipImage);
			%>
			<tr>
				<td><%=borrower.getApplicationId()%></td>
				<td><%=borrower.getBorrowerId()%></td>
				<td><%=borrower.getSalary()%></td>
				<td><%=borrower.getLoanAmount()%></td>
				<td><%=borrower.getTenure() %></td>
				<td><%=borrower.getAccountNo()%></td>
				<td><%=borrower.getPan()%></td>
				<td><%=borrower.getCity()%></td>
				<td><%=borrower.getState()%></td>
				<td><%=borrower.getPincode()%></td>
				<td><img src="data:image/jpeg;base64,<%=paySlip%>"
					alt="Pay Slip" style="width:200px; height:200px;"><br><br>
					<form action="/viewPaySlip" method="post">
						<input type="hidden" name="viewId" value="<%=borrower.getBorrowerId()%>">
				        <input type="submit" name="view" value="View" class="button">
					</form>
					</td>
				<td><img src="data:image/jpeg;base64,<%=proof%>"
					alt="Proof" style="width:200px; height:200px;"><br><br>
					<form action="/viewProof" method="post">
						<input type="hidden" name="viewId" value="<%= borrower.getBorrowerId()%>">
				        <input type="submit" name="view" value="View" class="button">
					</form> 
					</td>
					<td><%=borrower.getStatus()%></td>
					<td>
					<form action="/removeLender" method="get">
						 <input type="hidden" name="borrowerId" value="<%= borrower.getBorrowerId()%>"> 
						<input type="hidden" name="status" value="<%=borrower.getStatus()%>">
						 <input type="submit" class="delete" name="delete" value="Delete">
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
	            <td colspan="14">No Records found</td>
	        </tr>
	        <%
	        }
	        %>
		</tbody>
</table>
</body>
</html>