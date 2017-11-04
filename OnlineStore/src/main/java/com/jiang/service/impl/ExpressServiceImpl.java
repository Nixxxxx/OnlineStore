package com.jiang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiang.dao.ExpressDao;
import com.jiang.entity.Express;
import com.jiang.service.ExpressService;

@Service("expressService")
public class ExpressServiceImpl implements ExpressService{

	@Autowired
	private ExpressDao expressDao;

	public boolean add(Express express) {
		return expressDao.add(express) == 1? true : false;
	}

	public boolean delete(Integer id) {
		return expressDao.delete(id) == 1? true : false;
	}

	public boolean update(Express express) {
		return expressDao.update(express) == 1? true : false;
	}

	public Express findById(Integer id) {
		return expressDao.findById(id);
	}

	public List<Express> findAll() {
		return expressDao.findAll();
	}
	
	public List<Express> findByPage(Map<String, Object> map) {
		return expressDao.findByPage(map);
	}

	public List<Express> findByUserId(Map<String, Object> map) {
		return expressDao.findByUserId(map);
	}
}
