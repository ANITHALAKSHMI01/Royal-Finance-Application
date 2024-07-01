package com.chainsys.royalfinance.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.chainsys.royalfinance.dao.UserDAO;
import com.chainsys.royalfinance.model.User;

import jakarta.servlet.http.HttpSession;
@Controller
public class UserController
{
	@Autowired
	UserDAO userDAO;
	
	@RequestMapping("/home")
	public String home()
	{
		return "home.jsp";
	}
	@PostMapping("/register")
	public String register(@RequestParam("name") String name,@RequestParam("dateOfBirth") String dateOfBirth,@RequestParam("phoneNo") Long phoneNo,@RequestParam("emailId") String emailId,@RequestParam("password") String password,@RequestParam("location") String location)
	{
		User user=new User();
		String phoneNumber=phoneNo.toString();
		String id=name.substring(1,4)+phoneNumber.substring(3,5);
		user.setId(id);
		user.setName(name);
		user.setDateOfBirth(dateOfBirth);
		user.setEmail(emailId);
		user.setPassword(password);
		user.setPhoneNo(phoneNo);
		user.setLocation(location);
		user.setRole("Borrower");
		userDAO.saveUser(user);
		return "registrationSuccess.jsp";
	}
	@PostMapping("/login")
	public String login(@RequestParam("emailId") String emailId,@RequestParam("password") String password,HttpSession session)
	{
		User user=new User();
		user.setEmail(emailId);
		user.setStatus(0);
		String checkPassword=userDAO.checkUser(user);
		if(password.equals("Ad101@") && emailId.equals("anitha@admin.com"))
		{
			session.setAttribute("emailId",emailId);
			return "adminHomePage.jsp";
		}
		else if(password.equals(checkPassword))
		{
			session.setAttribute("emailId",emailId);
			return "borrowerHomePage.jsp";
		}
		else
		{
			return "login.jsp";
		}
	}
	@GetMapping("/userDetail")
	public String getUserById(HttpSession session,Model model)
	{
		User user=new User();
		String email=(String) session.getAttribute("emailId");
		user.setEmail(email);
		user.setStatus(0);
		String id=userDAO.getId(user);
		user.setId(id);
		if(id.equals("Ani65") && email.equals("anitha@admin.com"))
		{
			List<User> userDetail=userDAO.getUserDetail(user);
			model.addAttribute("userDetail",userDetail);
			return "adminProfile.jsp";
		}
		else
		{
			List<User> userDetail=userDAO.getUserDetail(user);
			model.addAttribute("userDetail",userDetail);
			return "borrowerProfile.jsp";
		}
	}
	@GetMapping("/updateAdminDetails")
	public String updateAdminDetail(@RequestParam("id") String id,@RequestParam("name") String name,@RequestParam("phoneNo") Long phoneNo,@RequestParam("location") String location,Model model)
	{
		User user=new User();
		user.setId(id);
		user.setPhoneNo(phoneNo);
		user.setLocation(location);
		userDAO.updateUser(user);
		List<User> userDetail=userDAO.getUserDetail(user);
		model.addAttribute("userDetail",userDetail);
		return "adminProfile.jsp";
	}
	@GetMapping("/listAllUsers")
	public String listAllUsers(Model model)
	{
		User user=new User();
		user.setRole("Borrower");
		List<User> users=userDAO.getAllUsers(user);
		model.addAttribute("users",users);
		return "registeredUsers.jsp";
	}
	@GetMapping("/removeUser")
	public String removeUser(@RequestParam("deleteId") String id,Model model)
	{
		User user=new User();
		user.setId(id);
		user.setStatus(1);
		userDAO.removeUser(user);
		user.setRole("Borrower");
		user.setStatus(0);
		List<User> users=userDAO.getAllUsers(user);
		model.addAttribute("users",users);
		return "registeredUsers.jsp";
	}
	
}
