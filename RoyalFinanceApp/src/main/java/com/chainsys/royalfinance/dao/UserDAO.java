package com.chainsys.royalfinance.dao;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.chainsys.royalfinance.model.User;

import jakarta.servlet.http.HttpSession;
@Repository
public interface UserDAO 
{
	public void saveUser(User user);
	public String checkUser(User user);
	public List<User> getAllUsers(User user);
	public void removeUser(User user);
	public String getId(User user,HttpSession session);
	public List<User> getUserDetail(User user);
	public void updateUser(User user);
//	public List<List> getEmail();
}
