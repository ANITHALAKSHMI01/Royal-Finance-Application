<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.chainsys.royalfinance.model.Loan" %>
     <%@ page import="java.time.LocalDate" %>
    <%@ page import="java.util.List" %>
     <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pay EMI</title>
</head>
<style>
.button
	{
		width:80px;
		padding:2px;
		position:relative;
		left:560px;
		top:100px;
		background-color:green;
		color:white;
		border-color:green;
		font-size:20px;
	}
	#record
	{
	    border:2px solid #D3D3D3;
	    width:fit-content;
	    height:50px;
	    padding:60px;
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
 LocalDate dateToday = LocalDate.now(); 
		List<Loan> list=(ArrayList<Loan>)request.getAttribute("list");
		if (list != null && !list.isEmpty())
		{
			 try
			 {
				 for (Loan loan : list)
				 {		
						%>
 <label for="id">Borrower Id : </label>
	<p class="out"><%=loan.getBorrowerId()%></p><br>
	<label>Due Date    :  </label><p class="out" id="date"><%=loan.getDueDate()%></p><br>
	 <label>Date    :  </label><p class="out" id="dateToday"><%=dateToday%></p><br>
	 <label>Account No :  </label><p class="out"><%=loan.getAccountNo()%></p><br>
	 <label>Receiver Account No : </label><p class="out">6754321890765</p><br>
	 <label>Amount : </label><p class="out" id="emi"><%=loan.getEmi()%></p><br>
	 <form action="/updatePayment" method="post">
	     	<input type="hidden" name="id" value="<%=loan.getBorrowerId()%>">
	     	<input type="hidden" name="loanId" value="<%=loan.getLoanId()%>">
			<input type="hidden" name="account" value="<%=loan.getAccountNo()%>">
			<input type="hidden" name="amount" value="<%=loan.getEmi()%>">
			<button>Pay</button>
		</form>
		<%
	  }
			 }
			 catch(Exception e)
			 {
				 e.printStackTrace();
			 }
			 }
		else 
		{ 
    %>
    <p id="record">No Dues.</p>
     <a href="borrowerHomePage.jsp"><button class="button">Back</button></a>
    <%
     }
    %>
</body>
</html>