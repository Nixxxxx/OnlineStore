package com.jiang.service;

import java.util.List;
import java.util.Map;

import com.jiang.entity.Product;

public interface ProductService {

	/**
	 * 添加商品
	 * @param user
	 * @return
	 */
	public boolean add(Product product);
	
	/**
	 * 删除商品
	 * @param id
	 * @return
	 */
	public boolean delete(Integer id);
	
	/**
	 * 更新商品信息
	 * @param user
	 * @return
	 */
	public boolean update(Product product);
	
	/**
	 * 根据id查找商品
	 * @param id
	 * @return
	 */
	public Product findById(Integer id);
	
	/**
	 * 查找所有商品
	 * @return
	 */
	public List<Product> findAll();

	/**
	 * 分页查找
	 * @param map
	 * @return
	 */
	public List<Product> findByPage(Map<String, Object> map);
}
