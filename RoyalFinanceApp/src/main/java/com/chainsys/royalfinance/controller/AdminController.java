package com.chainsys.royalfinance.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.royalfinance.dao.UserDAO;
import com.chainsys.royalfinance.model.Borrower;
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
}
