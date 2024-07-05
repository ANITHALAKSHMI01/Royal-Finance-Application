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
	<label>Loan Id   : </label><p class="out"><%=loan.getLoanId()%></p><br>
	<label>Borrower Id : </label><p class="out"><%=loan.getBorrowerId()%></p><br>
	<label>Date    :  </label><p class="out"><%=dateToday%></p><br>
	<label>Account No : </label><p class="out">6754321890765</p><br>
	<label>Borrower Account No : </label><p class="out"><%=loan.getAccountNo()%></p><br> 
	<label> Amount : </label><p class="out"><%=loan.getLoanAmount()%></p><br>
	<form action="/payLoan" method="post">
     	<input type="hidden" name="id" value="<%=loan.getBorrowerId()%>">
		<input type="hidden" name="account" value="<%=loan.getAccountNo()%>"> 
		<input type="hidden" name="amount" value="<%=loan.getLoanAmount()%>">
		<button>Pay</button>
	</form>
	<%} %>
</body>
</html>