package com.chainsys.royalfinance.controller;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.chainsys.royalfinance.dao.UserDAO;
import com.chainsys.royalfinance.model.Borrower;
import com.chainsys.royalfinance.validation.Validation;

import jakarta.servlet.http.HttpSession;
@Controller
public class BorrowerController 
{
	@Autowired
	UserDAO userDAO;
	@Autowired
	Validation validation;
	
	@PostMapping("/applyLoan")
	public String applyLoan(@RequestParam("id") String id,@RequestParam("salary") int salary,@RequestParam("amount") int loanAmount,@RequestParam("repayment") int tenure,@RequestParam("city") String city,@RequestParam("state") String state,@RequestParam("pincode") int pincode,@RequestParam("accountNo") long accountNo,@RequestParam("pan") String pan,@RequestParam("paySlip") MultipartFile paySlip,@RequestParam("proof") MultipartFile proof,Model model) throws IOException
	{
		if(paySlip!= null && proof!=null || Boolean.FALSE.equals(validation.checkPincode(String.valueOf(pincode),model)) || Boolean.FALSE.equals(validation.checkAccountNo(String.valueOf(accountNo),model)) || Boolean.FALSE.equals(validation.checkPAN(pan,model)) )
		{
			 byte[] slip = paySlip.getBytes();
			 byte[] proofImage = proof.getBytes();
			Borrower borrower=new Borrower();
			borrower.setBorrowerId(id);
			borrower.setSalary(salary);
			borrower.setLoanAmount(loanAmount);
			borrower.setTenure(tenure);
			borrower.setCity(city);
			borrower.setState(state);
			borrower.setPincode(pincode);
			borrower.setAccountNo(accountNo);
			borrower.setPan(pan);
			borrower.setPaySlip(slip);
			borrower.setProof(proofImage);
			borrower.setStatus("UnApproved");
			int amount=1000;
			userDAO.addBorrower(borrower);
			userDAO.addAccount(accountNo,amount , id);
			return "applicationSuccess.jsp" ;
		}
		else
		{
			return "loanApplication.jsp" ;
		}
	}
	@GetMapping("/appliedLoanDetail")
	public String appliedLoanDetail(Model model,HttpSession session)
	{
		String id=(String) session.getAttribute("id");
		List<Borrower> borrowers=userDAO.getBorrowerDetail(id);
		model.addAttribute("borrowers",borrowers);
		return "appliedLoanDetails.jsp";
	}
}