package com.jiang.service;

import java.util.List;
import java.util.Map;

import com.jiang.entity.User;

/**
 * 用户业务类
 * @author JH
 *
 */
public interface UserService {

	/**
	 * 检查用户名是否已存在
	 * @param userName
	 * @param id
	 * @return
	 */
	public boolean checkUserName(String userName, int id);
	
	/**
	 * 检查邮箱是否已存在
	 * @param email
	 * @param id
	 * @return
	 */
	public boolean checkEmail(String email, int id);
	
	/**
	 * 登录
	 * @param user
	 * @return
	 */
	public User login(User user);
	
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	public boolean add(User user);
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	public boolean delete(Integer id);
	
	/**
	 * 更新用户信息
	 * @param user
	 * @return
	 */
	public boolean update(User user);
	
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

	/**
	 * 分页查询
	 * @param map
	 * @return
	 */
	public List<User> findByPage(Map<String, Object> map);
	

	public Integer getTotal();
	
}
