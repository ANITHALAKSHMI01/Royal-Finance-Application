<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Application</title>
<style>
*
{
    box-sizing: border-box;
    padding: 0;
    margin: 0;
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
.button
{
	position:relative;
	left:190px;
	bottom:38px;
	background-color:gray;
	border-color:gray;
}
    body 
    {
	background-image: url("images/login.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 100%;
    }
	h1
	{
		text-align:center;
		position:relative;
		top:100px;
	}
	div
	{
		border:2px solid #157cb4;
		box-shadow:1px 1px 1px 1px;
		background-color:#157cb4;
		width:fit-content;
		height:600px;
		padding:40px;
		position:relative;
		left:400px;
		top:125px;
		border-radius:10px;
		color:white;
	}
	label
	{
		font-size:20px;
	}
	#id
	{
		position:relative;
		left:39px;
		padding:5px;
	}
	#loan
	{
		position:relative;
		left:25px;
		padding:5px;
	}
	#city
	{
		width:215px;
		padding:8px;
		position:relative;
		left:100px;
		padding:5px;
	}
	input
	{
		height:20px;
		width:200px;
	}
	button
	{
		position:relative;
		top:25px;
		left:140px;
		padding:6px;
		width:100px;
		font-size:18px;
		background-color:rgb(88, 171, 199);
		color:white;
		border-radius:10px;
		border-color:rgb(88, 171, 199);
	}
	button:hover
    {
	  box-shadow: 5px 5px 20px rgb(19, 19, 21);
    }
	#state
	{
		position:relative;
		left:95px;
		padding:5px;
	}
	#pin
	{
		position:relative;
		left:72px;
		padding:5px;
	}
	#accNo
	{
		position:relative;
		left:40px;
		padding:5px;
	}
	#pan
	{
		position:relative;
		left:100px;
		padding:5px;
	}
	#pay
	{
		position:relative;
		left:70px;
	}
	#proof
	{
		position:relative;
		left:90px;
	}
</style>
<script>
	function validation()
	{
		var salary=document.getElementById('sal');
		var loanAmount=document.getElementById('loan');
		var tenure=document.getElementById('repay');
		var pincode=document.getElementById('pin');
		var accNo=document.getElementById('accNo');
		var pan=document.getElementById('pan');
		if(sal<0)
		{
			alert("Salary should be Positive.");
			return;  
		}
		if(loanAmount<0)
		{
			alert("LoanAmount should be Positive.");
			return;  
		}
		if(tenure<0)
		{
			alert("Tenure should be Positive.");
			return;  
		}
		if(!pincode.checkValidity())
		{
			alert("Pincode should be Numeric.");
			return;  
		}
		if(!accNo.checkValidity())
		{
			alert("Account Number should be Numeric and 13 digits must.");
			return;  
		}
		if(!pan.checkValidity())
		{
			alert("PAN should be Alphanumeric.(Ex.ABCDE1234T) 10 characters must.");
			return;  
		}
	}
</script>
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
    <h1>Application Form</h1>
    <div>
    	<form action="/applyLoan" method="post" enctype="multipart/form-data">
        <label for="id">Borrower Id</label>
        <input id="id" type="text" name="id" value="<%= session.getAttribute("id")%>" readonly><br><br> 
        <label for="sal">Salary(In Months)</label>
        <input id="sal" type="number" name="salary" min=0 placeholder="Salary" required><br><br>
        <label for="loan">Loan Amount</label>
        <input id="loan" type="number" name="amount" min=0 placeholder="loan" required><br><br>
        <label for="repay">Tenure(In Months)</label>
        <input id="repay" type="number" name="repayment" min=0 placeholder="Repayment Period" required><br><br>
        <label for="city">City</label>
        <select name="city" id="city" required>
		<option>Tenkasi</option>
		<option>Tirunelveli</option>
		<option>Madurai</option>
		<option>Trichy</option>
		<option>Coimbatore</option>
		<option>Chennai</option>
	   </select><br><br>
        <label for="state">State</label>
        <input id="state" type="text" name="state" value="Tamilnadu" readonly required><br><br>
        <label for="pin">Pincode</label>
        <input id="pin" type="text" name="pincode" maxlength=6 placeholder="Pincode" pattern="^[0-9]{6}$" required><br><br>
        <label for="accNo">Account No</label>
        <input id="accNo" type="text" maxlength=13 name="accountNo" placeholder="Account No" pattern="^[0-9]{13}$"><br><br>
        <label for="pan">PAN</label>
        <input id="pan" type="text" maxlength=10 name="pan" placeholder="PAN" pattern="[A-Z]{5}[0-9]{4}[A-Z]{1}"><br><br>
        <label for="pay">Pay Slip</label>
        <input id="pay" type="file" name="paySlip"><br><br>  
        <label for="proof">Proof</label>
        <input id="proof" type="file" name="proof"><br><br>
        <button>Apply</button>
    </form>
    <!-- <a href="borrowerHomePage.jsp"><button class="button">Back</button></a> -->
    </div>
</body>
</html>