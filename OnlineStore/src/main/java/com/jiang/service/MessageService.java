package com.jiang.service;

import java.util.List;
import java.util.Map;

import com.jiang.entity.Message;

public interface MessageService {

	/**
	 * 添加留言
	 * @param user
	 * @return
	 */
	public boolean add(Message message);
	
	/**
	 * 删除留言
	 * @param id
	 * @return
	 */
	public boolean delete(Integer id);
	
	/**
	 * 更新留言信息
	 * @param user
	 * @return
	 */
	public boolean update(Message message);
	
	/**
	 * 根据id查找留言
	 * @param id
	 * @return
	 */
	public Message findById(Integer id);
	
	/**
	 * 查找所有留言
	 * @return
	 */
	public List<Message> findAll();

	public List<Message> findByPage(Map<String, Object> map);

}
