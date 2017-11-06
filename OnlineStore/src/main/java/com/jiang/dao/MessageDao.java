package com.jiang.dao;

import java.util.List;
import java.util.Map;

import com.jiang.entity.Message;

public interface MessageDao {

	public Integer add(Message message);
	
	public Integer delete(Integer id);
	
	public Integer update(Message message);
	
	public Message findById(Integer id);
	
	public List<Message> findAll();

	public List<Message> findByPage(Map<String, Object> map);

	public Integer findAllByUser(Map<String, Object> map);
}
