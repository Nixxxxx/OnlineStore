package com.jiang.entity;

/**
 * 快递订单类
 * @author JH
 *
 */
public class Express {

	private Integer id;        //快递单id
	private Integer userId;    //用户id
	private String message;    //快递单信息
	private Integer verify;    //审核（0：未审核 1：审核未通过 2：已审核 3：已被接单）
	private Integer senderId;  //配送用户id
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
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
	public Integer getSenderId() {
		return senderId;
	}
	public void setSenderId(Integer senderId) {
		this.senderId = senderId;
	}
}