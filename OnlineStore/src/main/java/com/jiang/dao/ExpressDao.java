package com.jiang.dao;

import java.util.List;

import com.jiang.entity.Express;

public interface ExpressDao {

	public Integer add(Express express);
	
	public Integer delete(Integer id);
	
	public Integer update(Express express);
	
	public Express findById(Integer id);
	
	public List<Express> findAll();
}
