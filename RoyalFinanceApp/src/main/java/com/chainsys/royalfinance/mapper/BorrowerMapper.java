package com.chainsys.royalfinance.mapper;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.chainsys.royalfinance.model.Borrower;
public class BorrowerMapper implements RowMapper<Borrower> 
{

	@Override
	public Borrower mapRow(ResultSet rs, int rowNum) throws SQLException 
	{
		Borrower borrower=new Borrower();
		borrower.setApplicationId(rs.getInt(1));
		borrower.setBorrowerId(rs.getString(2));
		borrower.setAccountNo(rs.getLong(3));
		borrower.setPan(rs.getString(4));
		borrower.setSalary(rs.getInt(5));
		borrower.setCity(rs.getString(6));
		borrower.setState(rs.getString(7));
		borrower.setPincode(rs.getInt(8));
		borrower.setProof(rs.getBytes(9));
		borrower.setLoanAmount(rs.getInt(10));
		borrower.setPaySlip(rs.getBytes(11));
		borrower.setTenure(rs.getInt(12));
		borrower.setStatus(rs.getString(13));
		return borrower;
	}

}
