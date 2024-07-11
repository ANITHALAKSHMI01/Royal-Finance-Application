<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="com.chainsys.royalfinance.dao.UserDAOImpl" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
main
{
	position:relative;
	top:200px;
}
.card 
{
  background-color: transparent;
  width: 300px;
  height: 200px;
  border: 1px solid #f1f1f1;
  perspective: 1000px; 
}
.card-inner 
{
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;
}
.card:hover .card-inner
 {
  transform: rotateY(180deg);
}
 .card-front, .card-back
 {
  position: absolute;
  width: 100%;
  height: 100%;
  backface-visibility: hidden;
}
.card-front 
{
  background-color: #188dcd;
  opacity:0.7;
  color: white;
  font-size:25px;
}
.card-back
 {
  background-color: #157cb4;
  color: white;
  transform: rotateY(180deg);
}
.main_block
{
	display:flex;
	justify-content:center;
	gap:40px;
}
.card-front  .head
{
	position:relative;
	top:70px;
}
.card-back .value
{
	position:relative;
	top:70px;
	font-size:40px;
}
.main_block1
{
	position:relative;
	top:100px;
	display:flex;
	justify-content:center;
	gap:40px;
}
</style>
<title>Admin Home</title>
</head>
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
				<a href="listAllUsers" style="color: transparent;"><p style="color:white; font-size:22px;">Registered Borrowers</p></a>
			</aside>
			<aside>
				<a href="listAllBorrowers" style="color: transparent;"><p style="color:white; font-size:22px;">Lenders</p></a>
			</aside>
			<aside>
				<a href="getAllLoans" style="color: transparent;"><p style="color:white; font-size:22px;">Loan Details</p></a>
			</aside>
			<aside>
				<a href="paymentHistory" style="color: transparent;"><p style="color:white; font-size:22px;">Payment History</p></a>
			</aside>
			<aside>
				<a href="logout" style="color: transparent;"><p style="color:white; font-size:22px;">Logout</p></a>
			</aside>
		</section>
	</nav>
	<div class="main_block">
		<main>
		<div class="card">
		<div class="card-inner">
			<div class="card-front">
				<p class="head">Current Registered Borrowers</p>
			</div>
			<div class="card-back">
				<% int totalUsers=0;
				ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
				UserDAOImpl userDAOImpl = (UserDAOImpl) context.getBean("userDAOImpl");
				try
				{
					totalUsers=userDAOImpl.totalRegisteredUsers(); 
				}
				catch(Exception e)
				{
					e.printStackTrace();
				} 
			    %>
			<p class="value"><%=totalUsers%></p>
			</div>
		</div>
	</div>
	</main>
	<main>
		<div class="card">
		<div class="card-inner">
			<div class="card-front">
			<p class="head">Current Lenders</p>
			</div>
			<div class="card-back">
				<% int totalLenders=0;
				try
				{
					totalLenders=userDAOImpl.totalLenders();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				%>
			<p class="value"><%=totalLenders%></p>
			</div>
		</div>
	</div>
	</main>
	<main>
		<div class="card">
		<div class="card-inner">
			<div class="card-front">
			<p class="head">Current Approved Lenders</p>
			</div>
			<div class="card-back">
				<%
				int totalApprovedLenders=0;
				try
				{
					totalApprovedLenders=userDAOImpl.totalApprovedLenders();;
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			    %>
			<p class="value"><%=totalApprovedLenders%></p>
			</div>
		</div>
	</div>
	</main>
	</div>
	<div class="main_block1">
		<main>
			<div class="card">
		<div class="card-inner">
			<div class="card-front">
			<p class="head">Check Balance</p>
			</div>
			<div class="card-back">
				<% 
				long accountNo=6754321890765l;
				int totalBalance=0;
				try
				{
					totalBalance=userDAOImpl.getTotalBalance(accountNo);
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			    %>
			<p class="value"><%=totalBalance%></p>
			</div>
		</div>
	</div>
		</main>
		<main>
			<div class="card">
		<div class="card-inner">
			<div class="card-front">
			<p class="head">Profit</p>
			</div>
			<div class="card-back">
				<% 
				int profit=0;
				try
				{
					profit=userDAOImpl.calculateProfit();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			    %>
			<p class="value"><%=profit%></p>
			</div>
		</div>
	</div>
		</main>
		<main>
			<div class="card">
		<div class="card-inner">
			<div class="card-front">
			<p class="head">Granted loan</p>
			</div>
			<div class="card-back">
				<% 
				int providedLoan=0;
				try
				{
					providedLoan=userDAOImpl.calculateTotalLoan();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			    %>
			<p class="value"><%=providedLoan%></p>
			</div>
		</div>
	</div>
		</main>
	</div>
</body>
</html>