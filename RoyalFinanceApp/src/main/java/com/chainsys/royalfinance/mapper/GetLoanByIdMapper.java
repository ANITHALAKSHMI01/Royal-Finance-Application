package com.chainsys.royalfinance.mapper;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.chainsys.royalfinance.model.Loan;
public class GetLoanByIdMapper implements RowMapper<Loan>
{
	@Override
	public Loan mapRow(ResultSet rs, int rowNum) throws SQLException 
	{
		Loan loan=new Loan();
		loan.setDate(rs.getString(1));
		loan.setLoanAmount(rs.getInt(2));
		loan.setTenure(rs.getInt(3));
		return loan;
	}
}
