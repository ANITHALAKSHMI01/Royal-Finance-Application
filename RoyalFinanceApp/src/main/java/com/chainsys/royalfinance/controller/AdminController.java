package com.chainsys.royalfinance.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.chainsys.royalfinance.dao.UserDAO;
import com.chainsys.royalfinance.model.Borrower;
@Controller
public class AdminController 
{
	@Autowired
	UserDAO userDAO;
	@GetMapping("/listAllBorrowers")
	public String listAllBorrowers(Model model)
	{
		List<Borrower> borrowers=userDAO.getAllBorrowers();
		model.addAttribute("borrowers",borrowers);
		return "lenders.jsp";
	}
}
