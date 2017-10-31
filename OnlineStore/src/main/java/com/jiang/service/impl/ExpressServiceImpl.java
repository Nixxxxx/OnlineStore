package com.jiang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiang.dao.ExpressDao;
import com.jiang.service.ExpressService;

@Service("expressService")
public class ExpressServiceImpl implements ExpressService{

	@Autowired
	private ExpressDao expressDao;
}
