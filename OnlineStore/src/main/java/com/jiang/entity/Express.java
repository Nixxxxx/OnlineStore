package com.jiang.entity;

/**
 * 快递订单类
 * @author JH
 *
 */
public class Express {

	private Integer id;        //快递单id
	private User user;         //发布用户
	private String message;    //快递单信息
	private Integer verify;    //审核（0：未审核 1：审核未通过 2：已审核 3：已被接单）
	private User sender; 	   //配送用户
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Integer getVerify() {
		return verify;
	}
	public void setVerify(Integer verify) {
		this.verify = verify;
	}
	public User getSender() {
		return sender;
	}
	public void setSender(User sender) {
		this.sender = sender;
	}
}