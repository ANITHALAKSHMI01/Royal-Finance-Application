package com.chainsys.royalfinance.validation;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
@Repository
public class Validation
{
	public boolean checkName(String name,Model model)
	{
		String regex="^[a-zA-Z\\s.]*$";
		if(name.matches(regex))
		{
			return false;
		}
		else
		{
			String errorMessage="Name should contain alphabet";
			model.addAttribute("errorName",errorMessage);
			return true;
		}
	}
	public boolean checkEmail(String email,Model model)
	{
		String regex="(^[a-z])[a-z0-9]+[@][a-z0-9]+\\\\.[a-zA-Z]{2,}";
		if(email.matches(regex))
		{
			return false;
		}
		else
		{
			String errorMessage="Email must contain @ and .";
			model.addAttribute("errorEmail",errorMessage);
			return true;
		}
	}
	public boolean checkPhoneNo(String phoneNo,Model model)
	{
		String regex="[6789][0-9]{9}";
		if(phoneNo.matches(regex))
		{
			return false;
		}
		else
		{
			String errorMessage="Phone Number should start 6-9 & 10 digits  must";
			model.addAttribute("errorPhoneNo",errorMessage);
			return true;
		}
	}
	public boolean checkPassword(String password,Model model)
	{
		String regex="(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@!#$%^&*]).{6}$";
		if(password.matches(regex))
		{
			return false;
		}
		else
		{
			String errorMessage="Password should contain atleast one UpperCase,LowerCase,Number and Special Character ,Password must be 6 characters.";
			model.addAttribute("errorPassword",errorMessage);
			return true;
		}
	}
	public boolean checkPincode(String pincode,Model model)
	{
		String regex="^[0-9]{6}$";
		if(pincode.matches(regex))
		{
			return false;
		}
		else
		{
			String errorMessage="Pincode should be Numeric and 6 digits must.";
			model.addAttribute("errorPincode",errorMessage);
			return true;
		}
	}
	public boolean checkAccountNo(String accountNo,Model model)
	{
		String regex="^[0-9]{13}$";
		if(accountNo.matches(regex))
		{
			return false;
		}
		else
		{
			String errorMessage="Account Number should be Numeric and 13 digits must.";
			model.addAttribute("errorAccountNo",errorMessage);
			return true;
		}
	}
	public boolean checkPAN(String pan,Model model)
	{
		String regex="[A-Z]{5}[0-9]{4}[A-Z]{1}";
		if(pan.matches(regex))
		{
			return false;
		}
		else
		{
			String errorMessage="PAN should be Numeric and 10 digits must.";
			model.addAttribute("errorPAN",errorMessage);
			return true;
		}
	}
}