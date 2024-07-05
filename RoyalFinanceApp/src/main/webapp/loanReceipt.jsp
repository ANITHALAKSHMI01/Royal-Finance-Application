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
div
{
	border:2px solid whitesmoke;
	box-shadow:1px 1px 1px 1px rgba(0,0,0,0.2);
	width:300px;
	height:300px;
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
		left:590px;
		top:200px;
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
		left:20px;
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
	.button
	{
		width:100px;
		padding:3px;
		position:relative;
		left:100px; 
		top:100px;
		background-color:green;
		color:white;
		border-color:green;
		font-size:20px;
	}
</style>
<body>
	<%
	List<Loan> loan = (ArrayList<Loan>) request.getAttribute("loan");
	if (loan != null && !loan.isEmpty())
	  { %>
		 <div>
		 <h2>Pay the installment every month.</h2>
		 <h4>There will be 50rs charge per day of delay in monthly payments</h4>
		 <%
	for (Loan amount : loan) 
	{	
	%>
	<label>Loan Id   :</label><p class="out"><%=amount.getLoanId() %></p><br>
	<label>Borrower Id :</label><p class="out"><%=amount.getBorrowerId() %></p><br>
	<label>Date    : </label><p class="out"><%=amount.getDate() %></p><br>
	<label>Total Amount : </label><p class="out"><%=amount.getLoanAmount() %></p><br>
	<label>Interest :</label><p class="out"><%=amount.getInterest()%>%</p><br>
	<label>Tenure :</label><p class="out"><%=amount.getTenure() %>Months</p><br>
	<label>Distribusal Amount :</label><p class="out"><%=amount.getDistribusalAmount()%></p><br>
	<%}   %>
		 <a href="borrowerHomePage.jsp"><button class="button">Back</button></a>
		 </div>
	<% }
			else 
			{
        %>
            <p id="record">No Records found</p>
            <a href="borrowerHomePage.jsp"><button>Back</button></a>
        <%
        }
        %>
      </body>
</html>