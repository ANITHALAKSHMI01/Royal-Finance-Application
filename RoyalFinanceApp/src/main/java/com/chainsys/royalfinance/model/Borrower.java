package com.chainsys.royalfinance.model;
import java.util.Arrays;
public class Borrower 
{
	private int applicationId;
	private String borrowerId;
	private int salary;
	private int loanAmount;
	private int tenure;
	private String city;
	private String state;
	private int pincode;
	private long accountNo;
	private String pan;
	private byte[] paySlip;
	private byte[] proof;
	private String status;
	private int isActive;
	public Borrower()
	{
		
	}
	public int getApplicationId()
	{
		return applicationId;
	}
	public void setApplicationId(int applicationId)
	{
		this.applicationId = applicationId;
	}
	public String getBorrowerId()
	{
		return borrowerId;
	}
	public void setBorrowerId(String borrowerId)
	{
		this.borrowerId = borrowerId;
	}
	public int getSalary()
	{
		return salary;
	}
	public void setSalary(int salary)
	{
		this.salary = salary;
	}
	public int getLoanAmount()
	{
		return loanAmount;
	}
	public void setLoanAmount(int loanAmount)
	{
		this.loanAmount = loanAmount;
	}
	public int getTenure()
	{
		return tenure;
	}
	public void setTenure(int tenure) 
	{
		this.tenure = tenure;
	}
	public String getCity()
	{
		return city;
	}
	public void setCity(String city) 
	{
		this.city = city;
	}
	public String getState()
	{
		return state;
	}
	public void setState(String state)
	{
		this.state = state;
	}
	public int getPincode()
	{
		return pincode;
	}
	public void setPincode(int pincode) 
	{
		this.pincode = pincode;
	}
	public long getAccountNo() 
	{
		return accountNo;
	}
	public void setAccountNo(long accountNo) 
	{
		this.accountNo = accountNo;
	}
	public String getPan() 
	{
		return pan;
	}
	public void setPan(String pan) 
	{
		this.pan = pan;
	}
	public byte[] getProof() 
	{
		return proof;
	}
	public void setProof(byte[] proof) 
	{
		this.proof = proof;
	}
	public byte[] getPaySlip() 
	{
		return paySlip;
	}
	public void setPaySlip(byte[] paySlip)
	{
		this.paySlip = paySlip;
	}
	public String getStatus()
	{
		return status;
	}
	public void setStatus(String status) 
	{
		this.status = status;
	}
	public int getIsActive()
	{
		return isActive;
	}
	public void setIsActive(int isActive)
	{
		this.isActive = isActive;
	}
	@Override
	public String toString() 
	{
		return "Borrower [applicationId=" + applicationId + ", borrowerId=" + borrowerId + ", salary=" + salary
				+ ", loanAmount=" + loanAmount + ", tenure=" + tenure + ", city=" + city + ", state=" + state
				+ ", pincode=" + pincode + ", accountNo=" + accountNo + ", pan=" + pan + ", paySlip="
				+ Arrays.toString(paySlip) + ", proof=" + Arrays.toString(proof) + ", status=" + status + ", isActive="
				+ isActive + "]";
	}
}
