package com.chainsys.royalfinance.model;
public class Loan 
{
	private int loanId;
	private String borrowerId;
	private int loanAmount;
	private int reduction;
	private String date;
	private int interest;
	private int tenure;
	private int distribusalAmount;
	private int emi;
	private long accountNo;
	private int status;
	private String dueDate;
	private String paymentStatus;
	public Loan(String borrowerId,String date,int reduction,int interest,int tenure,int distribusalAmount,String paymentStatus)
	{
		this.borrowerId=borrowerId;
		this.date=date;
		this.reduction=reduction;
		this.interest=interest;
		this.tenure=tenure;
		this.distribusalAmount=distribusalAmount;
		this.paymentStatus=paymentStatus;
	}
	public Loan()
	{
		
	}
	public int getLoanId()
	{
		return loanId;
	}
	public void setLoanId(int loanId)
	{
		this.loanId = loanId;
	}
	public String getBorrowerId()
	{
		return borrowerId;
	}
	public void setBorrowerId(String borrowerId)
	{
		this.borrowerId = borrowerId;
	}
	public int getLoanAmount()
	{
		return loanAmount;
	}
	public void setLoanAmount(int loanAmount)
	{
		this.loanAmount = loanAmount;
	}
	public String getDate()
	{
		return date;
	}
	public void setDate(String date)
	{
		this.date = date;
	}
	public int getInterest() 
	{
		return interest;
	}
	public void setInterest(int interest) 
	{
		this.interest = interest;
	}
	public int getTenure()
	{
		return tenure;
	}
	public void setTenure(int tenure)
	{
		this.tenure = tenure;
	}
	public int getDistribusalAmount()
	{
		return distribusalAmount;
	}
	public void setDistribusalAmount(int distribusalAmount) 
	{
		this.distribusalAmount = distribusalAmount;
	}
	public int getReduction()
	{
		return reduction;
	}
	public void setReduction(int reduction) 
	{
		this.reduction = reduction;
	}
	public int getEmi() 
	{
		return emi;
	}
	public void setEmi(int emi)
	{
		this.emi = emi;
	}
	public long getAccountNo() 
	{
		return accountNo;
	}
	public void setAccountNo(long accountNo)
	{
		this.accountNo = accountNo;
	}
	public int getStatus() 
	{
		return status;
	}
	public void setStatus(int status) 
	{
		this.status = status;
	}
	public String getDueDate()
	{
		return dueDate;
	}
	public void setDueDate(String dueDate) 
	{
		this.dueDate = dueDate;
	}
	public String getPaymentStatus() 
	{
		return paymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) 
	{
		this.paymentStatus = paymentStatus;
	}
	@Override
	public String toString() 
	{
		return "Loan [loanId=" + loanId + ", borrowerId=" + borrowerId + ", loanAmount=" + loanAmount + ", reduction="
				+ reduction + ", date=" + date + ", interest=" + interest + ", tenure=" + tenure
				+ ", distribusalAmount=" + distribusalAmount + ", emi=" + emi + ", accountNo=" + accountNo + ", status="
				+ status + ", dueDate=" + dueDate + ", paymentStatus=" + paymentStatus + "]";
	}
}
