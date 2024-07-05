package com.chainsys.royalfinance.dao;
import java.util.List;
import org.springframework.stereotype.Repository;

import com.chainsys.royalfinance.model.Borrower;
import com.chainsys.royalfinance.model.Loan;
import com.chainsys.royalfinance.model.User;

import jakarta.servlet.http.HttpSession;
@Repository
public interface UserDAO 
{
	public void saveUser(User user);
	public List<User> getAllUsers(String role);
	public void removeUser(String id);
	public String getId(HttpSession session);
	public List<User> getUserDetail(String id);
	public void updateUser(String id,long phoneNo,String location);
	public List<User> checkUserDetails(String email);
	public List<User> searchUser(String searchData);
	public void addAccount(long accountNo,int amount,String id);
	public void addBorrower(Borrower borrower);
	public List<Borrower> getAllBorrowers();
	public List<Borrower> getBorrowerDetail(String id);
	public int getBorrowerIsActive(String id);
	public void updateUserActive(String id);
	public List<Borrower> searchBorrower(String searchData);
	public void updateLoanStatus(int applicationId,String status);
	public List<Borrower> getBorrowerByStatus(String status);
	public void giveLoan(Loan loan);
	public List<Loan> getApprovedLoan(String id);
	public List<Loan> getAllLoans();
	public void updateBillStatus(String id);
	public int getTotalBalance(long accountNo);
	public void updateBalance(long accountNo,int amount);
}
