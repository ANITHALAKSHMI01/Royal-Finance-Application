package com.chainsys.royalfinance.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.chainsys.royalfinance.dao.UserDAO;
import com.chainsys.royalfinance.model.Payment;
import com.chainsys.royalfinance.model.User;
import com.chainsys.royalfinance.validation.Validation;
import jakarta.servlet.http.HttpSession;
@Controller
public class UserController
{
	@Autowired
	UserDAO userDAO;
	@Autowired
	Validation validation;
	
	@RequestMapping("/home")
	public String home()
	{
		return "home.jsp";
	}
	@PostMapping("/register")
	public String register(@RequestParam("name") String name,@RequestParam("dateOfBirth") String dateOfBirth,@RequestParam("phoneNo") Long phoneNo,@RequestParam("emailId") String emailId,@RequestParam("password") String password,@RequestParam("location") String location,Model model)
	{
		BCryptPasswordEncoder bcrypt=new BCryptPasswordEncoder();
		String encryptedPassword=bcrypt.encode(password);
		User user=new User();
		String phoneNumber=phoneNo.toString();
		String id=name.substring(2,5)+phoneNumber.substring(4,6);
		user.setId(id);
		user.setName(name);
		user.setDateOfBirth(dateOfBirth);
		user.setEmail(emailId);
		user.setPassword(encryptedPassword);
		user.setPhoneNo(phoneNo);
		user.setLocation(location);
		user.setRole("Borrower");
		if(!userDAO.getEmail(emailId))
		{
			if(Boolean.FALSE.equals(validation.checkName(name,model)) || Boolean.FALSE.equals(validation.checkEmail(emailId,model)) || Boolean.FALSE.equals(validation.checkPhoneNo(phoneNumber,model)) || Boolean.FALSE.equals(validation.checkPassword(password,model)))
			{
				userDAO.saveUser(user);
				return "registrationSuccess.jsp";
			}
			else
			{
				return "userRegistration.jsp";
			}
		}
		else
		{
			return "userRegistration.jsp";
		}
	}
	@PostMapping("/login")
	public String login(@RequestParam("emailId") String emailId,@RequestParam("password") String password,HttpSession session,Model model)
	{
		BCryptPasswordEncoder bcrypt=new BCryptPasswordEncoder();
		User existingUser=null;
		List<User> userDetail=userDAO.checkUserDetails(emailId);
		if(userDetail!=null || Boolean.FALSE.equals(validation.checkEmail(emailId,model)) || Boolean.FALSE.equals(validation.checkPassword(password,model)))
		{
			try
			{
				existingUser= userDetail.get(0);
			}
			catch(IndexOutOfBoundsException e)
			{
				return "login.jsp";
			}
			if(password.equals("Ad101@") && emailId.equals("anitha@admin.com"))
			{
				session.setAttribute("emailId",emailId);
				session.setAttribute("id",userDAO.getId(session));
				return "adminHomePage.jsp";
			}
			else if(emailId.equals(existingUser.getEmail()) && bcrypt.matches(password,existingUser.getPassword()))
			{
				session.setAttribute("emailId",emailId);
				session.setAttribute("id",userDAO.getId(session));
				return "borrowerHomePage.jsp";
			}
			else
			{
				return "login.jsp";
			}
		}
		else
		{
			return "login.jsp";
		}
	}
	@GetMapping("/userDetail")
	public String getUserById(HttpSession session,Model model)
	{
		String id=(String) session.getAttribute("id");
		if(id.equals("Ani65"))
		{
			List<User> userDetail=userDAO.getUserDetail(id);
			model.addAttribute("userDetail",userDetail);
			return "adminProfile.jsp";
		}
		else
		{
			List<User> userDetail=userDAO.getUserDetail(id);
			model.addAttribute("userDetail",userDetail);
			return "borrowerProfile.jsp";
		}
	}
	@GetMapping("/updateUserDetails")
	public String updateAdminDetail(@RequestParam("id") String id,@RequestParam("name") String name,@RequestParam("phoneNo") Long phoneNo,@RequestParam("location") String location,Model model)
	{
		userDAO.updateUser(id,phoneNo,location);
		List<User> userDetail=userDAO.getUserDetail(id);
		model.addAttribute("userDetail",userDetail);
		if(id.equals("Ani65"))
		{
			return "adminProfile.jsp";
		}
		else
		{
			return "borrowerProfile.jsp";
		}
	}
	@GetMapping("/removeUser")
	public String removeUser(@RequestParam("deleteId") String id,Model model)
	{
		userDAO.removeUser(id);
		String role="Borrower";
		List<User> users=userDAO.getAllUsers(role);
		model.addAttribute("users",users);
		return "registeredUsers.jsp";
	}
	@GetMapping("/searchUser")
	public String searchUser(@RequestParam("searchData") String search,Model model)
	{
		List<User> users=userDAO.searchUser(search);
		model.addAttribute("users",users);
		return "registeredUsers.jsp";
	}
	@GetMapping("/paymentHistory")
	public String paymentHistory(HttpSession session,Model model)
	{
		String id=(String) session.getAttribute("id");
		List<Payment> payment=userDAO.getPaymentHistory(id);
		model.addAttribute("payment",payment);
		if(id.equals("Ani65"))
		{
			return "paymentHistory1.jsp";
		}
		else
		{
			return "paymentHistory.jsp";
		}
	}
	@GetMapping("/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "home.jsp";
	}
}
