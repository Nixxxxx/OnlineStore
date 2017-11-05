package com.jiang.service;

import java.util.List;
import java.util.Map;

import com.jiang.entity.Express;

public interface ExpressService {

	/**
	 * 添加取件单
	 * @param user
	 * @return
	 */
	public boolean add(Express express);
	
	/**
	 * 删除取件单
	 * @param id
	 * @return
	 */
	public boolean delete(Integer id);
	
	/**
	 * 更新取件单信息
	 * @param user
	 * @return
	 */
	public boolean update(Express express);
	
	/**
	 * 根据id查找取件单
	 * @param id
	 * @return
	 */
	public Express findById(Integer id);
	
	/**
	 * 查找所有取件单
	 * @return
	 */
	public List<Express> findAll();

	public List<Express> findByPage(Map<String, Object> map);

}
