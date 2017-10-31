package com.jiang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiang.dao.ProductDao;
import com.jiang.service.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao prodcutDao;
}
