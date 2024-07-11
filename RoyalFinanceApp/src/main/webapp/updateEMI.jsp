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
<title>Update EMI</title>
<style>
p
{
	display:inline;
	font-size:20px;
}
label
{
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
</style>
</head>
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
		<div>
 <label for="id">Loan Id : </label><p class="out"><%=loan.getLoanId()%></p><br><br>
	 <label for="id">Borrower Id : </label><p class="out"><%=loan.getBorrowerId()%></p><br><br>
	<label>Loan Approved Date : </label><p class="out"><%=loan.getDate()%></p><br><br>
	 <label>Date    :  </label><p class="out"><%=dateToday%></p><br><br>
	 <label>Amount : </label><p class="out"><%=loan.getEmi()%></p><br><br>
	 <form action="/updateDueDate" method="post">
 	        <label for="due">Due Date:</label><input type="date" min=<%=dateToday%> name="dueDate" id="due" required><br><br>
<!-- 		   <label for="due">Due Date:</label><input type="date"  name="dueDate" id="due" required><br><br>  -->
	     	<input type="hidden" name="id" value="<%=loan.getBorrowerId()%>">
			<input type="hidden" name="loanId" value="<%=loan.getLoanId()%>">
			<button>Send</button>
	</form>
	</div>
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
    <tr>
        <td colspan="15">No Records found</td>
    </tr>
    <%
     }
    %>
</body>
</html>