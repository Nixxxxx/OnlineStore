package com.jiang.dao;

import java.util.List;
import java.util.Map;

import com.jiang.entity.User;

public interface UserDao {

	public Integer add(User user);
	
	public Integer delete(Integer id);
	
	public Integer update(User user);
	
	public User findById(Integer id);
	
	public List<User> findAll();

	public List<User> findByPage(Map<String, Object> map);

	public Integer getTotal();
}
