<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="com.chainsys.royalfinance.model.Loan" %>
    <%@ page import="java.util.List" %>
     <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bill Generation</title>
</head>
<style>
label
{
	font-size:20px;
}
div
{
	border:2px solid whitesmoke;
	box-shadow:1px 1px 1px 1px rgba(0,0,0,0.2);
	width:300px;
	height:350px;
	padding:10px;
	position:relative;
	left:500px;
	top:100px;
	background-color:whitesmoke;
}
button
	{
		width:100px;
		padding:3px;
		position:relative;
	    left:100px; 
	    top:20px;
		background-color:green;
		color:white;
		border-color:green;
		font-size:20px;
	}
	h4
	{
		color:green;
	}
	.out
	{
		display:inline;
		color:blue;
		position:relative;
		left:30px;
		font-size:20px;
	}
	#record
	{
	    border:2px solid #D3D3D3;
	    width:fit-content;
	    padding:50px;
		color:red;
		font-size:20px;
		position:relative;
		top:200px;
		left:500px;
		background-color:whiteSmoke;
		box-shadow:1px 1px 1px 1px rgba(0,0,0,0.2);
	}
</style>
<body>
	<%
	List<Loan> loan = (ArrayList<Loan>) request.getAttribute("loan");
	if (loan != null && !loan.isEmpty())
	  {
		%>
		 <div>
		 <% 
	for (Loan amount : loan) 
	{	
	%>
	<label><b>Loan Id   : </b></label><p class="out"><%=amount.getLoanId() %></p><br><br>
	<label><b>Borrower Id : </b></label><p class="out"><%=amount.getBorrowerId() %></p><br><br>
	<label><b>Date    : </b></label><p class="out"><%=amount.getDate() %></p><br><br>
	<label><b>Total Amount : </b></label><p class="out"><%=amount.getLoanAmount() %></p><br><br>
	<label><b>Interest : </b></label><p class="out"><%=amount.getInterest()%>%</p><br><br>
	<label><b>Tenure : </b></label><p class="out"><%=amount.getTenure() %>Months</p><br><br>
	<label><b>Distribusal Amount : </b></label><p class="out"><%=amount.getDistribusalAmount()%></p><br><br>
	<form action="/getLoanDetail" method="post">
		<input type="hidden" name="id" value="<%=amount.getBorrowerId() %>">
		<input type="hidden" name="loanId" value="<%=amount.getLoanId() %>">
		<input type="hidden" name="amount" value="<%=amount.getDistribusalAmount()%>">
		<button>Next</button>
	</form>
	 </div>
	<%} 
	
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
</body>
</html>