package com.jiang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiang.dao.AdminDao;
import com.jiang.entity.Admin;
import com.jiang.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adminDao;
	
	public Integer add(Admin admin) {
		return adminDao.add(admin);
	}
	
	public Integer delete(Integer id) {
		return adminDao.delete(id);
	}
	
	public Integer update(Admin admin) {
		return adminDao.update(admin);
	}
	
	public Admin findById(Integer id) {
		return adminDao.findById(id);
	}
	
	public List<Admin> findAll() {
		return adminDao.findAll();
	}
}
