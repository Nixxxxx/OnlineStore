package com.jiang.service;

import java.util.List;

import com.jiang.entity.User;

public interface UserService {

	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	public Integer add(User user);
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	public Integer delete(Integer id);
	
	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	public Integer update(User user);
	
	/**
	 * 根据id查找用户
	 * @param id
	 * @return
	 */
	public User findById(Integer id);
	
	/**
	 * 查找所有用户
	 * @return
	 */
	public List<User> findAll();
}
