package com.jiang.dao;

import com.jiang.entity.Admin;

public interface AdminDao {

	public Integer delete(Integer id);
	
	public Admin findById(Integer id);
}
