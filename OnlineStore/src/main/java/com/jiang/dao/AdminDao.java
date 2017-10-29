package com.jiang.dao;

import java.util.List;

import com.jiang.entity.Admin;

public interface AdminDao {
	
	public Integer add(Admin admin);
	
	public Integer delete(Integer id);
	
	public Integer update(Admin admin);

	public List<Admin> findAll();
	
	public Admin findById(Integer id);
}
