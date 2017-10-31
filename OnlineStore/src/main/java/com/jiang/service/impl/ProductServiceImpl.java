package com.jiang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiang.dao.ProductDao;
import com.jiang.entity.Product;
import com.jiang.service.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao prodcutDao;

	public boolean add(Product product) {
		return prodcutDao.add(product) == 1? true : false;
	}

	public boolean delete(Integer id) {
		return prodcutDao.delete(id) == 1? true : false;
	}

	public boolean update(Product product) {
		return prodcutDao.update(product) == 1? true : false;
	}

	public Product findById(Integer id) {
		return prodcutDao.findById(id);
	}

	public List<Product> findAll() {
		return prodcutDao.findAll();
	}

	public List<Product> findByPage(Map<String, Object> map) {
		return prodcutDao.findByPage(map);
	}
}
