package com.chainsys.royalfinance.controller;
import java.io.IOException;
import java.util.ArrayList;
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
import com.chainsys.royalfinance.model.Loan;
import com.chainsys.royalfinance.model.User;
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
			borrower.setStatus("Unapproved");
			int amount=1000;
			userDAO.addBorrower(borrower);
			userDAO.addAccount(accountNo,amount , id);
			userDAO.updateUserActive(id);
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
		List<Borrower> borrowers=userDAO.getBorrowerDetail(id,0);
		model.addAttribute("borrowers",borrowers);
		return "appliedLoanDetails.jsp";
	}
	@GetMapping("/allowBorrower")
	public String allowBorrower(HttpSession session)
	{
		String id=(String) session.getAttribute("id");
		List<User> user=userDAO.getUserDetail(id);
		if(user!=null)
		{
			User existingUser=user.get(0);
			if(existingUser.getActive()==0)
			{
				return "loanApplication.jsp";
			}
			else
			{
				return "alreadyAppliedLoan.jsp";
			}
		}
		else
		{
			return "loanApplication.jsp";
		}
	}
	@GetMapping("/getReceipt")
	public String getReceipt(Model model,HttpSession session)
	{
		String borrowerId=(String) session.getAttribute("id");
		List<Loan> loanDetail=userDAO.getApprovedLoan(borrowerId);
		model.addAttribute("loan",loanDetail);
		return "loanReceipt.jsp";
	}
	@GetMapping("/payEMI")
	public String payEMI(HttpSession session,Model model)
	{
		String id=(String) session.getAttribute("id");
		Loan loans=null;
		List<Loan> loanDetail=userDAO.getEMI(id,"Unpaid");
		List<Loan> list=new ArrayList<>();
		if(!loanDetail.isEmpty())
		{
			loans=loanDetail.get(0);
		}
		if(loans!=null)
		{
			int emi=loans.getLoanAmount()/loans.getTenure();
			Loan loan=new Loan();
			loan.setLoanId(loans.getLoanId());
			loan.setBorrowerId(id);
			loan.setDueDate(loans.getDueDate());;
			loan.setEmi(emi);
			loan.setAccountNo(loans.getAccountNo());
			list.add(loan);
			model.addAttribute("list",list);
		}
		return "payEMI.jsp";
	}
	@PostMapping("/updatePayment")
	public String updatePayment(@RequestParam("id") String borrowerId,@RequestParam("loanId") int loanId,@RequestParam("amount") int amount,@RequestParam("account") long accountNo)
	{
		long adminAccountNo=6754321890765l;
		int adminTotalBalance=userDAO.getTotalBalance(adminAccountNo);
		int borrowerTotalBalance=userDAO.getTotalBalance(accountNo);
		int balance=borrowerTotalBalance-amount;
		int creditAmount=adminTotalBalance+amount;
		userDAO.updateBalance(adminAccountNo, creditAmount);
		userDAO.updateBalance(accountNo, balance);
		userDAO.updatePaymentStatus("Paid", loanId);
		return "paymentSuccessfull.jsp";
	}
}
