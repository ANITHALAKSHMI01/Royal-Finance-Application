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
 <label for="id">Loan Id : </label><p class="out"><%=loan.getLoanId()%></p><br>
	 <label for="id">Borrower Id : </label><p class="out"><%=loan.getBorrowerId()%></p><br>
	<label>Loan Approved Date : </label><p class="out"><%=loan.getDate()%></p><br>
	 <label>Date    :  </label><p class="out"><%=dateToday%></p><br>
	 <label>Amount : </label><p class="out"><%=loan.getEmi()%></p><br>
	 <form action="/updateDueDate" method="post">
	        <label for="due">Due Date:</label><input type="date" name="dueDate" id="due" required>
	     	<input type="hidden" name="id" value="<%=loan.getBorrowerId()%>">
			<input type="hidden" name="loanId" value="<%=loan.getLoanId()%>">
			<button>Send</button>
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
    <tr>
        <td colspan="15">No Records found</td>
    </tr>
    <%
     }
    %>
</body>
</html>