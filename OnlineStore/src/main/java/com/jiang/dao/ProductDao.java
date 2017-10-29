package com.jiang.dao;

import java.util.List;

import com.jiang.entity.Product;

public interface ProductDao {

	public Integer add(Product product);
	
	public Integer delete(Integer id);
	
	public Integer update(Product product);
	
	public Product findById(Integer id);
	
	public List<Product> findAll();
}
