package com.chainsys.royalfinance.mapper;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.chainsys.royalfinance.model.Loan;
public class EMIMapper implements RowMapper<Loan>
{
	@Override
	public Loan mapRow(ResultSet rs, int rowNum) throws SQLException 
	{
		Loan loan=new Loan();
		loan.setLoanId(rs.getInt(1));
		loan.setDate(rs.getString(2));
		loan.setLoanAmount(rs.getInt(3));
		loan.setTenure(rs.getInt(4));
		loan.setDueDate(rs.getString(5));
		loan.setAccountNo(rs.getLong(6));
		return loan;
	}
}
