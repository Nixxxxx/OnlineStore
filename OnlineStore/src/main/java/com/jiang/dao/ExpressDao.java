package com.jiang.dao;

import java.util.List;

import com.jiang.entity.Express;
import com.jiang.entity.Message;

public interface ExpressDao {

	public Integer add(Express express);
	
	public Integer delete(Integer id);
	
	public Integer update(Express express);
	
	public Express findById(Integer id);
	
	public List<Message> findAll();
}
