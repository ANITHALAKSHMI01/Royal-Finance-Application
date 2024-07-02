package com.chainsys.royalfinance.dao;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.royalfinance.mapper.EmailMapper;
import com.chainsys.royalfinance.mapper.FindUserIdMapper;
import com.chainsys.royalfinance.mapper.UserMapper;
import com.chainsys.royalfinance.model.User;

import jakarta.servlet.http.HttpSession;
@Repository
public class UserDAOImpl implements UserDAO
{
	@Autowired
	JdbcTemplate jdbcTemplate;
	UserMapper mapper;
	FindUserIdMapper userMapper;
	
	
	@Override
	public void saveUser(User user)
	{
		String insert="insert into user(id,name,role,date_of_birth,phone_no,email,password,location)values(?,?,?,?,?,?,?,?)";
		Object[] params={user.getId(),user.getName(),user.getRole(),user.getDateOfBirth(),user.getPhoneNo(),user.getEmail(),user.getPassword(),user.getLocation()};
		jdbcTemplate.update(insert, params);
	}
	@Override
	public String checkUser(User user)
	{
		String select="select password from user where email=? && status=? ";
		Object[] params= {user.getEmail(),user.getStatus()};
		String password=jdbcTemplate.queryForObject(select,String.class, params);
		return password;
	}
	@Override
	public List<User> getAllUsers(User user) 
	{
		String select="select id,name,date_of_birth,phone_no,email,location from user where status=? and role=?";
		Object[] params= {user.getStatus(),user.getRole()};
		List<User> userList=jdbcTemplate.query(select, new UserMapper(),params);
		return userList;
	}
	@Override
	public void removeUser(User user)
	{
		String update="update user set status=? where id=?";
		Object[] params= {user.getStatus(),user.getId()};
		jdbcTemplate.update(update,params);
	}
	@Override
	public String getId(User user,HttpSession session) 
	{
		String email=(String) session.getAttribute("emailId");
		user.setEmail(email);
		user.setStatus(0);
		String select="select id from user where email=? && status=? ";
		Object[] params= {user.getEmail(),user.getStatus()};
		String id=jdbcTemplate.queryForObject(select,new FindUserIdMapper(), params);
		return id;
	}
	@Override
	public List<User> getUserDetail(User user)
	{
		String select="select id,name,date_of_birth,phone_no,email,location from user where status=? and id=?";
		Object[] params= {user.getStatus(),user.getId()};
		List<User> userList=jdbcTemplate.query(select, new UserMapper(),params);
		return userList;
	}
	@Override
	public void updateUser(User user)
	{
		String update="update user set phone_no=?,location=? where id=?";
		Object[] params= {user.getPhoneNo(),user.getLocation(),user.getId()};
		jdbcTemplate.update(update,params);
	}
//	@Override
//	public  List<String> getEmail()
//	{
//		User user=new User();
//		user.setStatus(0);
//		String select="select email from user where status=? ";
//		Object[] params= {user.getStatus()};
//		List<List> email=jdbcTemplate.query(select, new EmailMapper(),params);
//		System.out.println(email);
//		return email;
//	}
	
}
