package com.chainsys.royalfinance.dao;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.chainsys.royalfinance.mapper.BorrowerMapper;
import com.chainsys.royalfinance.mapper.EMIMapper;
import com.chainsys.royalfinance.mapper.EmailMapper;
import com.chainsys.royalfinance.mapper.FindUserIdMapper;
import com.chainsys.royalfinance.mapper.GetLoanByIdMapper;
import com.chainsys.royalfinance.mapper.LoanMapper;
import com.chainsys.royalfinance.mapper.PaymentMapper;
import com.chainsys.royalfinance.mapper.UserMapper;
import com.chainsys.royalfinance.model.Borrower;
import com.chainsys.royalfinance.model.Loan;
import com.chainsys.royalfinance.model.Payment;
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
	GetLoanByIdMapper getLoanMapper;
	EMIMapper emiMapper;
	PaymentMapper paymentMapper;
	
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
		String select="select application_id,borrower_id,account_no,pan,salary,city,state,pincode,proof,loan_amount,pay_slip,tenure,status from borrower_details where is_generate=0";
		List<Borrower> borrowers=jdbcTemplate.query(select,new BorrowerMapper());
		return borrowers;
	}
	@Override
	public List<Borrower> getBorrowerDetail(String id)
	{
		String select="select application_id,borrower_id,account_no,pan,salary,city,state,pincode,proof,loan_amount,pay_slip,tenure,status from borrower_details where borrower_id=?";
		List<Borrower> borrowers=jdbcTemplate.query(select,new BorrowerMapper(),id);
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
	public List<Borrower> searchBorrower(String searchData) 
	{
		String search=String.format("select application_id,borrower_id,account_no,pan,salary,city,state,pincode,proof,loan_amount,pay_slip,tenure,status from borrower_details where (application_id like '%%%s%%' or borrower_id like '%%%s%%' or status like '%%%s%%') and is_generate=0",searchData,searchData,searchData);
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
		String select="select borrower.application_id,borrower.borrower_id,borrower.account_no,borrower.pan,borrower.salary,borrower.city,borrower.state,borrower.pincode,borrower.proof,borrower.loan_amount,borrower.pay_slip,borrower.tenure,borrower.status from borrower_details borrower inner join user  on borrower.borrower_id=user.id && borrower.status=? && user.active=1";
		List<Borrower> borrowers=jdbcTemplate.query(select,new BorrowerMapper(),status);
		return borrowers;
	}
	@Override
	public void removeLender(String id)
	{
		String update="update user set active=? where id=?";
		jdbcTemplate.update(update,0,id);
	}
	@Override
	public void giveLoan(Loan loan)
	{
		String insert="insert into loan_details(borrower_id,date_issued,interest,distribusal_amount,reduction,is_paid)values(?,?,?,?,?,?)";
		Object[] params= {loan.getBorrowerId(),loan.getDate(),loan.getInterest(),loan.getDistribusalAmount(),loan.getReduction(),loan.getPaymentStatus()};
		jdbcTemplate.update(insert, params);
	}
	@Override
	public List<Loan> getApprovedLoan(String id) 
	{
		String select="select loan.loan_id,loan.borrower_id,loan.date_issued,loan.interest,loan.distribusal_amount,loan.reduction,borrower.tenure,loan.due_date,loan.is_paid from loan_details loan inner join borrower_details borrower on loan.borrower_id=borrower.borrower_id && borrower.borrower_id=?";
		List<Loan> loan=jdbcTemplate.query(select,new LoanMapper(),id);
		return loan;
	}
	@Override
	public List<Loan> getAllLoans() 
	{
		String select="select loan.loan_id,loan.borrower_id,loan.date_issued,loan.interest,loan.distribusal_amount,loan.reduction,borrower.tenure,loan.due_date,loan.is_paid from loan_details loan inner join borrower_details borrower on loan.borrower_id=borrower.borrower_id";
		List<Loan> loan=jdbcTemplate.query(select,new LoanMapper());
		return loan;
	}
	@Override
	public List<Loan> searchLoan(String searchData) 
	{
		String search=String.format("select loan.loan_id, loan.borrower_id, loan.date_issued, loan.interest, loan.distribusal_amount, loan.reduction, borrower.tenure, loan.due_date, loan.is_paid " +
                "from loan_details loan, borrower_details borrower " +
                "where (loan.borrower_id like '%%%s%%' OR loan.loan_id like '%%%s%%' or loan.is_paid like '%%%s%%') " +
                "and loan.borrower_id = borrower.borrower_id ", searchData, searchData, searchData);
		List<Loan> loan=jdbcTemplate.query(search,new LoanMapper());
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
	@Override
	public List<Loan> getLoanById(String id) 
	{
		String select="select loan.date_issued,borrower.loan_amount,borrower.tenure from loan_details loan inner join borrower_details borrower on loan.borrower_id=borrower.borrower_id && loan.borrower_id=?";
	    List<Loan> loan=jdbcTemplate.query(select,new GetLoanByIdMapper(),id);
	    return loan;
	}
	@Override
	public void updateEMI(String dueDate, String paymentStatus,int loanId)
	{
		String update="update loan_details set due_date=?,is_paid=? where loan_id=?";
		Object[] params= {dueDate,paymentStatus,loanId};
		jdbcTemplate.update(update,params);
	}
	@Override
	public void updatePaymentStatus(String paymentStatus,int loanId)
	{
		String update="update loan_details set is_paid=? where loan_id=?";
		jdbcTemplate.update(update,paymentStatus,loanId);
	}
	@Override
	public List<Loan> getEMI(String id,String paymentStatus) 
	{
		String select="select loan.loan_id,loan.date_issued,borrower.loan_amount,borrower.tenure,loan.due_date,borrower.account_no from loan_details loan inner join borrower_details borrower on loan.borrower_id=borrower.borrower_id && loan.borrower_id=? && loan.is_paid=?";
	    return jdbcTemplate.query(select,new EMIMapper(),id,paymentStatus);
	}
	@Override
	public void updatePenalty(int penalty, int loanId) 
	{
		String update="update loan_details set penalty=? where loan_id=?";
		jdbcTemplate.update(update,penalty,loanId);
	}
	@Override
	public int totalRegisteredUsers() 
	{
		String count="select count(*) from user where status=0 && role=?";
		return jdbcTemplate.queryForObject(count,Integer.class,"Borrower");
	}
	@Override
	public int totalLenders() 
	{
		String count="select count(*) from borrower_details";
		return jdbcTemplate.queryForObject(count,Integer.class);
	}
	@Override
	public int totalApprovedLenders()
	{
		String count="select count(*) from borrower_details where status=?";
		return jdbcTemplate.queryForObject(count,Integer.class,"Approved");
	}
	@Override
	public int calculateProfit()
	{
		String select="select sum(reduction) from loan_details";
		int interestAmount=jdbcTemplate.queryForObject(select,Integer.class);
		String retrive="select sum(penalty) from loan_details";
		int penaltyAmount=jdbcTemplate.queryForObject(retrive,Integer.class);
		return interestAmount+penaltyAmount;
	}
	@Override
	public int calculateTotalLoan() 
	{
		String totalLoan="select sum(distribusal_amount) from  loan_details";
		return jdbcTemplate.queryForObject(totalLoan,Integer.class);
	}
	@Override
	public void addPaymentHistory(Payment payment) 
	{
		String insert="insert into payment(user_id,payment_date,from_account,to_account,amount)values(?,?,?,?,?)";
		Object[] params= {payment.getUserId(),payment.getDate(),payment.getFromAccount(),payment.getToAccount(),payment.getAmount()};
		jdbcTemplate.update(insert, params);
	}
	@Override
	public List<Payment> getPaymentHistory(String id) 
	{
		String select="select payment_id,user_id,payment_date,from_account,to_account,amount from payment where user_id=?";
		return jdbcTemplate.query(select,new PaymentMapper(),id);
	}
}
