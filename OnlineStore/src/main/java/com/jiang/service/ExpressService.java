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

	/**
	 * 用户分页查找（已认证和特定userId）
	 * @param map
	 * @return
	 */
	public List<Express> findVerifyByPage(Map<String, Object> map);
	
	/**
	 * 分页查找（所有）
	 * @param map
	 * @return
	 */
	public List<Express> findByPage(Map<String, Object> map);

	/**
	 * 查找某用户发布的订单
	 * @param map
	 * @return
	 */
	public Integer findAllByUser(Map<String, Object> map);
	
	/**
	 * 所以已认证和已被接单数量
	 * @return
	 */
	public Integer countVerify();

}
