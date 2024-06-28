package com.chainsys.royalfinance.model;
public class Payment 
{
	int paymentId;
	String userId;
	String date;
	long fromAccount;
	long toAccount;
	int amount;
	public Payment()
	{
		
	}
	public Payment(String userId,String date,long fromAccount,long toAccount,int amount)
	{
		this.userId=userId;
		this.date=date;
		this.fromAccount=fromAccount;
		this.toAccount=toAccount;
		this.amount=amount;
	}
	public int getPaymentId()
	{
		return paymentId;
	}
	public void setPaymentId(int paymentId)
	{
		this.paymentId = paymentId;
	}
	public String getUserId()
	{
		return userId;
	}
	public void setUserId(String userId)
	{
		this.userId = userId;
	}
	public String getDate()
	{
		return date;
	}
	public void setDate(String date)
	{
		this.date = date;
	}
	public long getFromAccount() 
	{
		return fromAccount;
	}
	public void setFromAccount(long fromAccount)
	{
		this.fromAccount = fromAccount;
	}
	public long getToAccount()
	{
		return toAccount;
	}
	public void setToAccount(long toAccount)
	{
		this.toAccount = toAccount;
	}
	public int getAmount() 
	{
		return amount;
	}
	public void setAmount(int amount)
	{
		this.amount = amount;
	}
	@Override
	public String toString()
	{
		return "PaymentDetails [paymentId=" + paymentId + ", userId=" + userId + ", date=" + date + ", fromAccount="
				+ fromAccount + ", toAccount=" + toAccount + ", amount=" + amount + "]";
	}
}
