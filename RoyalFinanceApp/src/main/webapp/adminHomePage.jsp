<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
   border: 2px solid #00008B; 
   height: 75px;
   width: 100%;
   display: flex;
    box-shadow: 2px 2px 2px 2px rgba(0,0,0,0.2);
   position: fixed;
   top: 0;
   z-index: 1;
  background-color: #00008B;
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
  background-color: orangered;
  opacity:0.7;
  color: black;
  font-size:25px;
}
.card-back
 {
  background-color: green;
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
			<form action="/getBorrowerByStatus" method="get">
	  			<select name="filter" id="approve">
				    	<option>Status</option> 
				      	<option>Approved</option>
				      	<option>On Progress</option>
		                <option>Rejected</option>
	                	<option>Unapproved</option>
	                 <input type="submit"  value="Filter" class="button1">
				      </select>
	 		</form>
	 		</aside>
			<aside>
				<a href="getAllLoans" style="color: transparent;"><p style="color:white; font-size:22px;">Loan Details</p></a>
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
				<% int total=0;
		/* 	try
			{
				AdminImplementation admin=new AdminImplementation();
				total=admin.totalRegisteredBorrowers();
			} 
			catch (ClassNotFoundException | SQLException e) 
			{
				e.printStackTrace();
			} */
			%>
			<p class="value"><%=total%></p>
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
				<% int total1=0;
		/* 	try
			{
				AdminImplementation admin=new AdminImplementation();
				total1=admin.totalLenders();
			} 
			catch (ClassNotFoundException | SQLException e) 
			{
				e.printStackTrace();
			} */
			%>
			<p class="value"><%=total1%></p>
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
				<% int total2=0;
		/* 	try
			{
				AdminImplementation admin=new AdminImplementation();
				total2=admin.totalApprovedLenders();
			} 
			catch (ClassNotFoundException | SQLException e) 
			{
				e.printStackTrace();
			} */
			%>
			<p class="value"><%=total2%></p>
			</div>
		</div>
	</div>
	</main>
	</div>
</body>
</html>