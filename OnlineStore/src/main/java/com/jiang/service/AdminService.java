package com.jiang.service;

import java.util.List;
import java.util.Map;

import com.jiang.entity.Admin;

public interface AdminService {
	
	public boolean checkUserName(String userName, Integer id);

	/**
	 * 添加管理员
	 * @param admin
	 * @return
	 */
	public boolean add(Admin admin);
	
	/**
	 * 删除管理员
	 * @param id
	 * @return
	 */
	public boolean delete(Integer id);
	
	/**
	 * 更新管理员信息
	 * @param admin
	 * @return
	 */
	public boolean update(Admin admin);
	
	/**
	 * 根据id查找管理员
	 * @param id
	 * @return
	 */
	public Admin findById(Integer id);
	
	/**
	 * 查找所有管理员
	 * @return
	 */
	public List<Admin> findAll();

	public List<Admin> findByPage(Map<String, Object> map);

	public Admin login(Admin admin);
}
