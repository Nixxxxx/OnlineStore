package com.jiang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiang.dao.UserDao;
import com.jiang.entity.User;
import com.jiang.service.UserService;
import com.jiang.util.CryptographyUtil;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	

	public boolean checkUserName(String userName, int id){
		List<User> users = userDao.findAll();
		for (User user : users) {
			if (user.getUserName().equals(userName) && user.getId() != id)
				return false;
		}
		return true;
	}
	
	public boolean checkEmail(String email, int id){
		List<User> users = userDao.findAll();
		for(User user:users){
			if(user.getEmail().equals(email) && user.getId() != id)
				return false;
		}
		return true;
	}
	
	public User login(User user) {
		List<User> users = userDao.findAll();
		for(User u:users){
			if(u.getUserName().equals(user.getUserName()) && CryptographyUtil.md5(user.getPassword(), "jiang").equals(u.getPassword())){
				return user;
			}
		}
		return null;
	}
	
	public boolean add(User user) {
		return userDao.add(user) == 1? true : false;
	}
	
	public boolean delete(Integer id) {
		return userDao.delete(id) == 1? true : false;
	}
	
	public boolean update(User user) {
		return userDao.update(user) == 1? true : false;
	}
	
	public User findById(Integer id) {
		return userDao.findById(id);
	}
	
	public List<User> findAll() {
		return userDao.findAll();
	}
	
	public List<User> findByPage(Map<String, Object> map) {
		return userDao.findByPage(map);
	}
	
	public Integer getTotal() {
		return userDao.getTotal();
	}
	
}
