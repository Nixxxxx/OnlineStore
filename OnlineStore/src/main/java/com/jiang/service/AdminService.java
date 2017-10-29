package com.jiang.service;

import java.util.List;

import com.jiang.entity.Admin;

public interface AdminService {

	/**
	 * 添加管理员
	 * @param admin
	 * @return
	 */
	public Integer add(Admin admin);
	
	/**
	 * 删除管理员
	 * @param id
	 * @return
	 */
	public Integer delete(Integer id);
	
	/**
	 * 更新管理员信息
	 * @param admin
	 * @return
	 */
	public Integer update(Admin admin);
	
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
}
