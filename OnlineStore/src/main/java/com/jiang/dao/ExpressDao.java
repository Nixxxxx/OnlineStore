package com.jiang.dao;

import java.util.List;
import java.util.Map;

import com.jiang.entity.Express;

public interface ExpressDao {

	public Integer add(Express express);
	
	public Integer delete(Integer id);
	
	public Integer update(Express express);
	
	public Express findById(Integer id);
	
	public List<Express> findAll();

	public List<Express> findByPage(Map<String, Object> map);

	public Integer findAllByUser(Map<String, Object> map);

}
