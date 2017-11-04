package com.jiang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiang.dao.MessageDao;
import com.jiang.entity.Message;
import com.jiang.service.MessageService;

@Service("messageService")
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageDao messageDao;

	public boolean add(Message message) {
		return messageDao.add(message) == 1? true : false;
	}

	public boolean delete(Integer id) {
		return messageDao.delete(id) == 1? true : false;
	}

	public boolean update(Message message) {
		return messageDao.update(message) == 1? true : false;
	}

	public Message findById(Integer id) {
		return messageDao.findById(id);
	}

	public List<Message> findAll() {
		return messageDao.findAll();
	}

	public List<Message> findByPage(Map<String, Object> map) {
		return messageDao.findByPage(map);
	}

	public List<Message> findByUserId(Map<String, Object> map) {
		return messageDao.findByUserId(map);
	}
}
