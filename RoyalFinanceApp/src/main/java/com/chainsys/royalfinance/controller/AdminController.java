package com.chainsys.royalfinance.controller;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.royalfinance.dao.UserDAO;
import com.chainsys.royalfinance.model.Borrower;
import com.chainsys.royalfinance.model.Loan;
import com.chainsys.royalfinance.model.Payment;
import com.chainsys.royalfinance.model.User;
@Controller
public class AdminController 
{
	@Autowired
	UserDAO userDAO;
	
	@GetMapping("/listAllUsers")
	public String listAllUsers(Model model)
	{
		String role="Borrower";
		List<User> users=userDAO.getAllUsers(role);
		model.addAttribute("users",users);
		return "registeredUsers.jsp";
	}
	@GetMapping("/listAllBorrowers")
	public String listAllBorrowers(Model model)
	{
		List<Borrower> borrowers=userDAO.getAllBorrowers();
		model.addAttribute("borrowers",borrowers);
		return "lenders.jsp";
	}
	@PostMapping("/viewPaySlip")
	public String viewPaySlip(@RequestParam("viewId") String id,Model model)
	{
		List<Borrower> borrowers=userDAO.getBorrowerDetail(id);
		model.addAttribute("borrowers",borrowers);
		return "viewPaySlip.jsp";
	}
	@PostMapping("/viewProof")
	public String viewProof(@RequestParam("viewId") String id,Model model)
	{
		List<Borrower> borrowers=userDAO.getBorrowerDetail(id);
		model.addAttribute("borrowers",borrowers);
		return "viewProof.jsp";
	}
	@GetMapping("/searchBorrower")
	public String searchBorrower(@RequestParam("searchData") String searchData,Model model)
	{
		List<Borrower> borrowers=userDAO.searchBorrower(searchData);
		model.addAttribute("borrowers",borrowers);
		return "lenders.jsp";
	}
	@GetMapping("/updateStatus")
	public String updateStatus(@RequestParam("id") int applicationId,@RequestParam("approval") String approval,Model model)
	{
		userDAO.updateLoanStatus(applicationId, approval);
		List<Borrower> borrowers=userDAO.getAllBorrowers();
		model.addAttribute("borrowers",borrowers);
		return "lenders.jsp";
	}
	@GetMapping("/getBorrowerByStatus")
	public String getBorrowerByStatus(@RequestParam("filter") String status,Model model)
	{
		List<Borrower> borrowers=userDAO.getBorrowerByStatus(status);
		model.addAttribute("borrowers",borrowers);
		return "statusBasedBorrower.jsp";
	}
	@GetMapping("/searchBorrowerByStatus")
	public String searchBorrowerByStatus(@RequestParam("searchData") String searchData,Model model)
	{
		List<Borrower> borrowers=userDAO.searchBorrower(searchData);
		model.addAttribute("borrowers",borrowers);
		return "statusBasedBorrower.jsp";
	}
	@GetMapping("/removeLender")
	public String removeLender(@RequestParam("borrowerId") String id,@RequestParam("status") String status,Model model)
	{
		userDAO.removeLender(id);
		List<Borrower> borrowers=userDAO.getBorrowerByStatus(status);
		model.addAttribute("borrowers",borrowers);
		return "statusBasedBorrower.jsp";
	}
	@PostMapping("/giveLoan")
	public String giveLoan(@RequestParam("id") String borrowerId,@RequestParam("applicationId") int applicationId,@RequestParam("amount") int loanAmount,@RequestParam("tenure") int tenure,Model model)
	{
		Borrower borrower1=null;
		LocalDate dateToday = LocalDate.now(); 
		String dateString =dateToday.toString();
		int reduction=(loanAmount*10)/100;
		int distribusalAmount=loanAmount-reduction;
		String paymentStatus="Unpaid";
		Loan loan=new Loan(borrowerId,dateString,reduction,10,tenure,distribusalAmount,paymentStatus);
		List<Borrower> borrower=userDAO.getBorrowerDetail(borrowerId);
		if(!borrower.isEmpty())
		{
			borrower1=borrower.get(0);
		}
		if(borrower1.getStatus().equals("Approved"))
		{
			userDAO.giveLoan(loan);
			List<Loan> loanDetail=userDAO.getApprovedLoan(borrowerId);
			model.addAttribute("loan",loanDetail);
			return "loan.jsp";
		}
		else
		{
			List<Borrower> borrowers=userDAO.getAllBorrowers();
			model.addAttribute("borrowers",borrowers);
			return "lenders.jsp";
		}
	}
	@GetMapping("/getAllLoans")
	public String getAllLoans(Model model)
	{
		List<Loan> loans=userDAO.getAllLoans();
		model.addAttribute("loans",loans);
		return "loanDetails.jsp";
	}
	@GetMapping("/searchLoanDetail")
	public String searchLoanDetail(@RequestParam("searchData") String searchData,Model model)
	{
		List<Loan> loans=userDAO.searchLoan(searchData);
		model.addAttribute("loans",loans);
		return "loanDetails.jsp";
	}
	@PostMapping("/getLoanDetail")
	public String getLoanDetail(@RequestParam("id") String borrowerId,@RequestParam("loanId") int loanId,@RequestParam("amount") int amount,Model model)
	{
		Borrower borrower=null;
		List<Loan> list=new ArrayList<>();
		List<Borrower> borrowers=userDAO.getBorrowerDetail(borrowerId);
		if(!borrowers.isEmpty())
		{
			borrower=borrowers.get(0);
		}
		Loan loan=new Loan();
		loan.setAccountNo(borrower.getAccountNo());
		loan.setBorrowerId(borrowerId);
		loan.setLoanId(loanId);
		loan.setLoanAmount(amount);
		list.add(loan);
		model.addAttribute("list",list);
		return "payLoan.jsp";
	}
	@PostMapping("/payLoan")
	public String payLoan(@RequestParam("id") String borrowerId,@RequestParam("account") long accountNo,@RequestParam("amount") int amount,@RequestParam("date") String date,Model model)
	{
		long adminAccountNo=6754321890765l;
		String adminId="Ani65";
		userDAO.updateBillStatus(borrowerId);
		int adminTotalBalance=userDAO.getTotalBalance(adminAccountNo);
		int borrowerTotalBalance=userDAO.getTotalBalance(accountNo);
		int balance=adminTotalBalance-amount;
		int creditAmount=borrowerTotalBalance+amount;
		userDAO.updateBalance(adminAccountNo, balance);
		userDAO.updateBalance(accountNo, creditAmount);
		Payment payment=new Payment(adminId,date,adminAccountNo,accountNo,amount);
		userDAO.addPaymentHistory(payment);
		List<Borrower> borrowers=userDAO.getAllBorrowers();
		model.addAttribute("borrowers",borrowers);
		return "lenders.jsp";
	}
	@GetMapping("/updateEMI")
	public String updateEMI(@RequestParam("loanId") int loanId,@RequestParam("id") String borrowerId,Model model)
	{
		Loan loans=null;
		List<Loan> loanDetail=userDAO.getLoanById(borrowerId);
		List<Loan> list=new ArrayList<>();
		if(!loanDetail.isEmpty())
		{
			loans=loanDetail.get(0);
		}
		int emi=loans.getLoanAmount()/loans.getTenure();
		Loan loan=new Loan();
		loan.setLoanId(loanId);
		loan.setBorrowerId(borrowerId);
		loan.setDate(loans.getDate());
		loan.setEmi(emi);
		list.add(loan);
		model.addAttribute("list",list);
		return "updateEMI.jsp";
	}
	@PostMapping("/updateDueDate")
	public String updateDueDate(@RequestParam("loanId") int loanId,@RequestParam("id") String borrowerId,@RequestParam("dueDate") String dueDate,Model model)
	{
		String paymentStatus="Unpaid";
		userDAO.updateEMI(dueDate, paymentStatus, loanId);
		List<Loan> loans=userDAO.getAllLoans();
		model.addAttribute("loans",loans);
		return "loanDetails.jsp";
	}
}
