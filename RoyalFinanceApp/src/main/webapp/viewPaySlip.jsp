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
<title>Pay Slip</title>
</head>
<style>
	img
	{
		width:900px;
		height:900px;
	}
	div
	{	
		display:flex;
		justify-content:center;
	}
	button
	{
		position:relative;
		top:1000px;
		right:400px;
		padding:10px;
		width:100px;
		background-color:green;
		border-color:green;
		color:white;
		font-size:20px;
	}
</style>
<body>
<div>
	<table border="2px" cellspacing="0px">
	<thead>
		<tr>
		<th>Proof</th>
		   </tr>
	</thead>
	<tbody>
			<%
			List<Borrower> borrowers=(ArrayList<Borrower>)request.getAttribute("borrowers");
			for (Borrower borrower : borrowers)
			{
					byte[] paySlipImage = borrower.getPaySlip();
					String paySlip = Base64.getEncoder().encodeToString(paySlipImage);
			%>
			<tr>
	               <td><img src="data:image/jpeg;base64,<%=paySlip%>"
					alt="PaySlip"></td>
					<%
			   }	  
			%>
			 </tr>
		</tbody>
</table>
<a href="listAllBorrowers"><button>Back</button></a>
</div>
</body>
</html>