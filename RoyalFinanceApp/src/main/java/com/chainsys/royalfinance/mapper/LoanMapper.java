package com.chainsys.royalfinance.mapper;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.chainsys.royalfinance.model.Loan;
public class LoanMapper implements RowMapper<Loan>
{

	@Override
	public Loan mapRow(ResultSet rs, int rowNum) throws SQLException
	{
		Loan loan=new Loan();
		loan.setLoanId(rs.getInt(1));
		loan.setBorrowerId(rs.getString(2));
		loan.setDate(rs.getString(3));
		loan.setInterest(rs.getInt(4));
		loan.setDistribusalAmount(rs.getInt(5));
		loan.setReduction(rs.getInt(6));
		loan.setTenure(rs.getInt(7));
		loan.setDueDate(rs.getString(8));
		loan.setPaymentStatus(rs.getString(9));
		loan.setLoanAmount(loan.getDistribusalAmount()+loan.getReduction());
		return loan;
	}

}
