<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
     <%@page import="com.chainsys.royalfinance.model.Loan"%>
     <%@ page import="java.util.List" %>
    <%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pay For Borrower</title>
<style>
	p
	{
		display:inline;
		font-size:20px;
	}
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
	    left:100px; 
		top:20px;
		background-color:green;
		color:white;
		border-color:green;
		font-size:20px;
	}
	label
   {
	 font-size:20px;
   }
</style>
</head>
<body>
	<% 
		LocalDate dateToday = LocalDate.now();
		List<Loan> list=(ArrayList<Loan>) request.getAttribute("list");
		for(Loan loan:list)
		{
			%>
	<div>
	<label>Loan Id   : </label><p class="out"><%=loan.getLoanId()%></p><br><br>
	<label>Borrower Id : </label><p class="out"><%=loan.getBorrowerId()%></p><br><br>
	<label>Date    :  </label><p class="out"><%=dateToday%></p><br><br>
	<label>Account No : </label><p class="out">6754321890765</p><br><br>
	<label>Borrower Account No : </label><p class="out"><%=loan.getAccountNo()%></p><br><br> 
	<label> Amount : </label><p class="out"><%=loan.getLoanAmount()%></p><br><br>
	<form action="/payLoan" method="post">
     	<input type="hidden" name="id" value="<%=loan.getBorrowerId()%>">
		<input type="hidden" name="account" value="<%=loan.getAccountNo()%>"> 
		<input type="hidden" name="amount" value="<%=loan.getLoanAmount()%>">
		<button>Pay</button>
	</form>
	</div>
	<%} %>
</body>
</html>