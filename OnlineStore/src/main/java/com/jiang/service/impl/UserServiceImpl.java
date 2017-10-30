package com.jiang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiang.dao.UserDao;
import com.jiang.entity.User;
import com.jiang.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	public Integer add(User user) {
		return userDao.add(user);
	}
	
	public Integer delete(Integer id) {
		return userDao.delete(id);
	}
	
	public Integer update(User user) {
		return userDao.update(user);
	}
	
	public User findById(Integer id) {
		return userDao.findById(id);
	}
	
	public List<User> findAll() {
		return userDao.findAll();
	}
	
}
