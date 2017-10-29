package com.jiang.dao;

import java.util.List;

import com.jiang.entity.User;

public interface UserDao {

	public Integer add(User user);
	
	public Integer delete(Integer id);
	
	public Integer update(User user);
	
	public User findById(Integer id);
	
	public List<User> findAll();
}
