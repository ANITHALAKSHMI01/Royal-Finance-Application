<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
     <%@page import="com.chainsys.royalfinance.model.Payment"%>
     <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment History</title>
</head>
<style>
*
{
    box-sizing: border-box;
    padding: 0;
    margin: 0;
}
 body
{
overflow-x:hidden;
}
#navbar
{
   border: 2px solid #0077b6; 
   height: 75px;
   width: 100%;
   display: flex;
    box-shadow: 2px 2px 2px 2px rgba(0,0,0,0.2);
   position: fixed;
   top: 0;
   z-index: 1;
  background-color: #0077b6;
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
th
{
	background-color:#119ce7;
    color: white;
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
	padding: 15px;
	text-align: center;
}
table 
{
	position: relative;
	top:180px;
	left: 250px;
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
				<a href="allowBorrower" style="color: transparent;"><p style="color:white; font-size:22px;">Apply</p></a>
			</aside>
			<aside>
				<a href="appliedLoanDetail" style="color: transparent;"><p style="color:white; font-size:22px;">Status</p></a>
			</aside>
			<aside>
				<a href="getReceipt" style="color: transparent;"><p style="color:white; font-size:22px;">Invoice</p></a>
			</aside>
			<aside>
				<a href="payEMI" style="color: transparent;"><p style="color:white; font-size:22px;">Pay EMI</p></a>
			</aside>
			<aside>
				<a href="paymentHistory" style="color: transparent;"><p style="color:white; font-size:22px;">Payment History</p></a>
			</aside>
			<aside>
				<a href="logout" style="color: transparent;"><p style="color:white; font-size:22px;">Logout</p></a>
			</aside>
		</section>
	</nav>
	<table>
		<thead>
		<tr>
			<th>Payment Id</th>
			<th>User Id</th>
			<th>Payment Date</th>
			<th>From Account</th>
			<th>To Account</th>
			<th>Amount</th>
			</tr>
		</thead>
		<tbody>
		<%
			List<Payment> list=(ArrayList<Payment>)request.getAttribute("payment");
			 if (list != null && !list.isEmpty())
			  {
				  try
				  {
				  		for (Payment payment : list)
				  		{%>
		<tr>
			<td><%=payment.getPaymentId() %></td>
			<td><%=payment.getUserId() %></td>
			<td><%=payment.getDate() %></td>
			<td><%=payment.getFromAccount() %></td>
			<td><%=payment.getToAccount() %></td>
			<td><%=payment.getAmount() %></td>
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
            <td colspan="14">No Records found</td>
        </tr>
        <%
        }
        %>
				 
		</tbody>
	</table>
</body>
</html>