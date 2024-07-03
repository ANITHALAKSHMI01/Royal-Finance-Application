<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Application</title>
<style>
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
  		background-color:skyblue;
    }
	h1
	{
		text-align:center;
		position:relative;
		top:50px;
	}
	div
	{
		border:2px solid white;
		box-shadow:1px 1px 1px 1px;
		background-color:white;
		width:fit-content;
		height:600px;
		padding:40px;
		position:relative;
		left:400px;
		top:50px;
		border-radius:10px;
	}
	label
	{
		font-size:20px;
	}
	#id
	{
		position:relative;
		left:39px;
	}
	#purpose
	{
		width:210px;
	}
/* 	#sal
	{
		position:relative;
		left:85px;
	} */
	#loan
	{
		position:relative;
		left:25px;
	}
	#city
	{
		width:215px;
		padding:8px;
		position:relative;
		left:100px;
	}
	input
	{
		height:20px;
		width:200px;
		padding:5px;
	}
	button
	{
		position:relative;
		left:60px;
		padding:6px;
		width:100px;
		font-size:18px;
		background-color:green;
		color:white;
		border-radius:10px;
		border-color:green;
	}
	#state
	{
		position:relative;
		left:95px;
	}
	#pin
	{
		position:relative;
		left:72px;
	}
	#accNo
	{
		position:relative;
		left:40px;
	}
	#pan
	{
		position:relative;
		left:100px;
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
		padding:5px;
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
    <a href="borrowerHomePage.jsp"><button class="button">Back</button></a>
    </div>
</body>
</html>