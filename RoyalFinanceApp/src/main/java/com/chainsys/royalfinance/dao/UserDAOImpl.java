package com.chainsys.royalfinance.dao;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.royalfinance.mapper.BorrowerMapper;
import com.chainsys.royalfinance.mapper.EmailMapper;
import com.chainsys.royalfinance.mapper.FindUserIdMapper;
import com.chainsys.royalfinance.mapper.LoanMapper;
import com.chainsys.royalfinance.mapper.UserMapper;
import com.chainsys.royalfinance.model.Borrower;
import com.chainsys.royalfinance.model.Loan;
import com.chainsys.royalfinance.model.User;
import jakarta.servlet.http.HttpSession;
@Repository
public class UserDAOImpl implements UserDAO
{
	@Autowired
	JdbcTemplate jdbcTemplate;
	UserMapper mapper;
	FindUserIdMapper userMapper;
	EmailMapper emailMapper;
	BorrowerMapper borrowerMapper;
	LoanMapper loanMapper;
	
	@Override
	public void saveUser(User user)
	{
		String insert="insert into user(id,name,role,date_of_birth,phone_no,email,password,location)values(?,?,?,?,?,?,?,?)";
		Object[] params={user.getId(),user.getName(),user.getRole(),user.getDateOfBirth(),user.getPhoneNo(),user.getEmail(),user.getPassword(),user.getLocation()};
		jdbcTemplate.update(insert, params);
	}
	@Override
	public List<User> getAllUsers(String role) 
	{
		String select="select id,name,date_of_birth,phone_no,email,location,active from user where status=? and role=?";
		Object[] params= {0,role};
		List<User> userList=jdbcTemplate.query(select, new UserMapper(),params);
		return userList;
	}
	@Override
	public void removeUser(String id)
	{
		String update="update user set status=? where id=?";
		Object[] params= {1,id};
		jdbcTemplate.update(update,params);
	}
	@Override
	public String getId(HttpSession session) 
	{
		String email=(String) session.getAttribute("emailId");
		String select="select id from user where email=? && status=? ";
		Object[] params= {email,0};
		String id=jdbcTemplate.queryForObject(select,new FindUserIdMapper(), params);
		return id;
	}
	@Override
	public List<User> getUserDetail(String id)
	{
		String select="select id,name,date_of_birth,phone_no,email,location,active from user where status=? and id=?";
		Object[] params= {0,id};
		List<User> userList=jdbcTemplate.query(select, new UserMapper(),params);
		return userList;
	}
	@Override
	public void updateUser(String id,long phoneNo,String location)
	{
		String update="update user set phone_no=?,location=? where id=?";
		Object[] params= {phoneNo,location,id};
		jdbcTemplate.update(update,params);
	}
	@Override
	public List<User> checkUserDetails(String email) 
	{
		String select="select email,password from user where email=? && status=? ";
		Object[] params= {email,0};
		List<User> userDetail=jdbcTemplate.query(select, new EmailMapper(),params);
		return userDetail;
	}
	@Override
	public List<User> searchUser(String searchData)
	{
		String select=String.format("select id,name,date_of_birth,phone_no,email,location,active from user where (id like '%%%s%%' or name like '%%%s%%' or email like '%%%s%%' or phone_no like '%%%s%%')  and status=0 and role='Borrower' ",searchData,searchData,searchData,searchData);
		List<User> userList=jdbcTemplate.query(select, new UserMapper());
		return userList;
	}
	@Override
	public void addAccount(long accountNo, int amount, String id) 
	{
		String insert="insert into account_details(user_id,account_no,total_balance)values(?,?,?)";
		Object[] params={id,accountNo,amount};
		jdbcTemplate.update(insert, params);
	}
	@Override
	public void addBorrower(Borrower borrower) 
	{
		String insert="insert into borrower_details(borrower_id,account_no,pan,salary,city,state,pincode,proof,loan_amount,pay_slip,tenure,status)values(?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params={borrower.getBorrowerId(),borrower.getAccountNo(),borrower.getPan(),borrower.getSalary(),borrower.getCity(),borrower.getState(),borrower.getPincode(),borrower.getProof(),borrower.getLoanAmount(),borrower.getPaySlip(),borrower.getTenure(),borrower.getStatus()};
		jdbcTemplate.update(insert, params);
	}
	@Override
	public List<Borrower> getAllBorrowers() 
	{
		String select="select application_id,borrower_id,account_no,pan,salary,city,state,pincode,proof,loan_amount,pay_slip,tenure,status,is_active from borrower_details where is_active=0 && is_generate=0";
		List<Borrower> borrowers=jdbcTemplate.query(select,new BorrowerMapper());
		return borrowers;
	}
	@Override
	public List<Borrower> getBorrowerDetail(String id)
	{
		String select="select application_id,borrower_id,account_no,pan,salary,city,state,pincode,proof,loan_amount,pay_slip,tenure,status,is_active from borrower_details where is_active=? && is_generate=0 && borrower_id=?";
		Object[] params= {0,id};
		List<Borrower> borrowers=jdbcTemplate.query(select,new BorrowerMapper(),params);
		return borrowers;
	}
	@Override
	public void updateUserActive(String id)
	{
		String update="update user set active=? where id=?";
		Object[] params= {1,id};
		jdbcTemplate.update(update,params);
	}
	@Override
	public int getBorrowerIsActive(String id) 
	{
		String select="select is_active from borrower_details where borrower_id=?";
		int active=jdbcTemplate.queryForObject(select, Integer.class,id);
		return active;
	}
	@Override
	public List<Borrower> searchBorrower(String searchData) 
	{
		String search=String.format("select application_id,borrower_id,account_no,pan,salary,city,state,pincode,proof,loan_amount,pay_slip,tenure,status,is_active from borrower_details where (application_id like '%%%s%%' or borrower_id like '%%%s%%' or status like '%%%s%%') and is_active=0 and is_generate=0",searchData,searchData,searchData);
		List<Borrower> borrowers=jdbcTemplate.query(search,new BorrowerMapper());
		return borrowers;
	}
	@Override
	public void updateLoanStatus(int applicationId,String status) 
	{
		String update="update borrower_details set status=? where application_id=?";
		Object[] params= {status,applicationId};
		jdbcTemplate.update(update,params);
	}
	@Override
	public List<Borrower> getBorrowerByStatus(String status)
	{
		String select="select application_id,borrower_id,account_no,pan,salary,city,state,pincode,proof,loan_amount,pay_slip,tenure,status,is_active from borrower_details where is_active=0 && is_generate=0 && status=?";
		Object[] params= {status};
		List<Borrower> borrowers=jdbcTemplate.query(select,new BorrowerMapper(),params);
		return borrowers;
	}
	@Override
	public void giveLoan(Loan loan)
	{
		String insert="insert into loan_details(borrower_id,date_issued,interest,distribusal_amount,reduction)values(?,?,?,?,?)";
		Object[] params= {loan.getBorrowerId(),loan.getDate(),loan.getInterest(),loan.getDistribusalAmount(),loan.getReduction()};
		jdbcTemplate.update(insert, params);
	}
	@Override
	public List<Loan> getApprovedLoan(String id) 
	{
		String select="select loan.loan_id,loan.borrower_id,loan.date_issued,loan.interest,loan.distribusal_amount,loan.reduction,borrower.tenure,loan.due_date from loan_details loan inner join borrower_details borrower on loan.borrower_id=borrower.borrower_id && borrower.borrower_id=? && loan.status=?";
		Object[] params= {id,0};
		List<Loan> loan=jdbcTemplate.query(select,new LoanMapper(),params);
		return loan;
	}
	@Override
	public List<Loan> getAllLoans() 
	{
		String select="select loan.loan_id,loan.borrower_id,loan.date_issued,loan.interest,loan.distribusal_amount,loan.reduction,borrower.tenure,loan.due_date from loan_details loan inner join borrower_details borrower on loan.borrower_id=borrower.borrower_id &&  loan.status=0";
		List<Loan> loan=jdbcTemplate.query(select,new LoanMapper());
		return loan;
	}
	@Override
	public void updateBillStatus(String id)
	{
		String update= "update borrower_details set is_generate=? where borrower_id=?";
		Object[] params= {1,id};
		jdbcTemplate.update(update, params);
	}
	@Override
	public int getTotalBalance(long accountNo)
	{
		String select="select total_balance from account_details where account_no=?";
		Object[] params= {accountNo};
		int totalBalance=jdbcTemplate.queryForObject(select,Integer.class,params);
		return totalBalance;
	}
	@Override
	public void updateBalance(long accountNo, int amount)
	{
		String update="update account_details set total_balance=? where account_no=?";
		Object[] params= {amount,accountNo};
		jdbcTemplate.update(update,params);
	}
}
