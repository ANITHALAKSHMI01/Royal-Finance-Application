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
   border: 2px solid #00008B; 
   height: 75px;
   width: 100%;
   display: flex;
    box-shadow: 2px 2px 2px 2px rgba(0,0,0,0.2);
   position: fixed;
   top: 0;
   z-index: 1;
  background-color: #00008B;
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
		left:750px;
		top:70px;
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
	background-color:blue;
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
	left:550px;
	top:120px; 
	padding:5px;
}
#approve
{
	padding:3px;
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
			<form action="/getBorrowerByStatus" method="get">
	  			<select name="filter" id="approve">
				    	<option>Status</option> 
				      	<option>Approved</option>
				      	<option>On Progress</option>
		                <option>Rejected</option>
	                	<option>Unapproved</option>
	                 <input type="submit"  value="Filter" class="button1">
				   </select>
	 		</form>
	 		</aside>
			<aside>
				<a href="getAllLoans" style="color: transparent;"><p style="color:white; font-size:22px;">Loan Details</p></a>
			</aside>
			<aside>
				<a href="logout" style="color: transparent;"><p style="color:white; font-size:22px;">Logout</p></a>
			</aside>
		</section>
	</nav>
	<form action="/searchBorrower" method="get">
		<input type="text" placeholder="Search" id="search" name="searchData">
	</form>
<table border="1px" cellspacing="0px">
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
	<th>Approval</th>
	<th>Generate Bill</th>
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
						<input type="hidden" name="viewId" value="<%= borrower.getBorrowerId()%>">
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
					<td><%=borrower.getStatus() %></td>
				<td>
					<form action="/updateStatus" method="get">
						<input type="hidden" name="id" value="<%= borrower.getApplicationId()%>">
				      	<select name="approval" id="approve">
				    	<option>Select</option> 
				      	<option>Approved</option>
				      	<option>On Progress</option>
		                <option>Rejected</option>
	                	<option>Unapproved</option>
				      </select>
				      <input type="submit" name="approve" value="Update" class="button" style="position:relative;top:20px;">
					</form>
				</td>
				<td>
					<form action="/giveLoan"method="post">
					   	<input type="hidden" name="id" value="<%= borrower.getBorrowerId()%>">
						<input type="hidden" name="applicationId" value="<%= borrower.getApplicationId()%>">
						<input type="hidden" name="amount" value="<%=borrower.getLoanAmount()%>">
						<input type="hidden" name="tenure" value="<%=borrower.getTenure()%>">
						<input type="submit" name="pay" value="Pay Now" class="button">
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