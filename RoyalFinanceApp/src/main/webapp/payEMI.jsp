<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.chainsys.royalfinance.model.Loan" %>
     <%@ page import="java.time.LocalDate" %>
    <%@ page import="java.util.List" %>
     <%@ page import="java.util.ArrayList" %>
     <%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
     <%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="com.chainsys.royalfinance.dao.UserDAOImpl" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pay EMI</title>
</head>
<style>
.out
{
	display:inline;
	font-size:20px;
}
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
	#button
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
	div
   {
	border:2px solid whitesmoke;
	box-shadow:1px 1px 1px 1px rgba(0,0,0,0.2);
	width:300px;
	height:400px;
	padding:15px;
	position:relative;
	left:500px;
	top:100px;
	background-color:whitesmoke;
   }
	label
   {
	 font-size:20px;
   }
</style>
<body>
<%
		List<Loan> list=(ArrayList<Loan>)request.getAttribute("list");
		if (list != null && !list.isEmpty())
		{
			 try
			 {
				 for (Loan loan : list)
				 {		
						if(loan.getDueDate()!=null)
						{
							 LocalDate dueDate =  LocalDate.parse(loan.getDueDate());
			                 int daysOverdue =dueDate.until(LocalDate.now()).getDays(); 
			                 int monthsOverdue=dueDate.until(LocalDate.now()).getMonths();
			                 int previousPendingAmount=0;
			                 int penaltyAmount=0; 
			                 if(daysOverdue>0)
			                 {
			                	 int penaltyPerDay = 50;
			                	 penaltyAmount=daysOverdue * penaltyPerDay;
			                 }
			                 else
			                 {
			                	  penaltyAmount = 0; 
			                 } 
			                 if(monthsOverdue>0)
			                 {
			                	 previousPendingAmount+=monthsOverdue*loan.getEmi();
			                	 int penaltyPerMonth = 1550;
			                	 penaltyAmount+= monthsOverdue * penaltyPerMonth;
			                 }
			                 else
			                 {
			                	  penaltyAmount += 0; 
			                 } 
			                 ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
			 				UserDAOImpl userDAOImpl = (UserDAOImpl) context.getBean("userDAOImpl");
			 				userDAOImpl.updatePenalty(penaltyAmount, loan.getLoanId());
						%>
	<div>
    <label for="id"><b>Borrower Id : </b></label><p class="out"><%=loan.getBorrowerId()%></p><br><br>
	<label><b>Due Date    :  </b></label><p class="out" id="date"><%=dueDate%></p><br><br>
	 <label><b>Date    :  </b></label><p class="out" id="dateToday"><%=LocalDate.now()%></p><br><br>
	 <label><b>Acc.No :  </b></label><p class="out"><%=loan.getAccountNo()%></p><br><br>
	 <label><b>Receiver Acc.No : </b></label><p class="out">6754321890765</p><br><br>
	 <label><b>Amount : </b></label><p class="out" id="emi"><%=loan.getEmi()+previousPendingAmount%></p><br><br>
	 <label><b>Penalty Amount : </b></label><p class="out" id="penalty"><%= penaltyAmount %></p><br><br>
	 <label><b>Total Amount : </b></label><p class="out" id="penalty"><%= loan.getEmi()+ previousPendingAmount + penaltyAmount %></p><br><br>
	 <form action="/updatePayment" method="post">
	     	<input type="hidden" name="id" value="<%=loan.getBorrowerId()%>">
	     	<input type="hidden" name="loanId" value="<%=loan.getLoanId()%>">
			<input type="hidden" name="account" value="<%=loan.getAccountNo()%>">
			<input type="hidden" name="amount" value="<%= loan.getEmi()+ previousPendingAmount + penaltyAmount %>">
			<button id="button">Pay</button>
		</form>
		</div>
		<%
	  }
						else 
						{ 
				    %>
				    <p id="record">No Dues.</p>
				     <a href="borrowerHomePage.jsp"><button class="button">Back</button></a>
				    <%
				     }
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