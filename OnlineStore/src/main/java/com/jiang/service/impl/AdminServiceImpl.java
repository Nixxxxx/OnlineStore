package com.jiang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiang.dao.AdminDao;
import com.jiang.entity.Admin;
import com.jiang.service.AdminService;
import com.jiang.util.MD5Util;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adminDao;
	
	public Admin login(Admin admin) {
		List<Admin> admins = adminDao.findAll();
		for(Admin a:admins){
			if(a.getUserName().equals(admin.getUserName()) && MD5Util.getMD5Code(admin.getPassword()).equals(a.getPassword())){
				return a;
			}
		}
		return null;
	}
	
	public boolean checkUserName(String userName, Integer id) {
		List<Admin> admins = adminDao.findAll();
		for(Admin admin:admins){
			if(admin.getUserName().equals(userName) && admin.getId() != id)
				return false;
		}
		return true;
	}
	
	public boolean add(Admin admin) {
		return adminDao.add(admin) == 1? true : false;
	}
	
	public boolean delete(Integer id) {
		return adminDao.delete(id) == 1? true : false;
	}
	
	public boolean update(Admin admin) {
		return adminDao.update(admin) == 1? true : false;
	}
	
	public Admin findById(Integer id) {
		return adminDao.findById(id);
	}
	
	public List<Admin> findAll() {
		return adminDao.findAll();
	}

	public List<Admin> findByPage(Map<String, Object> map) {
		return adminDao.findByPage(map);
	}
}
