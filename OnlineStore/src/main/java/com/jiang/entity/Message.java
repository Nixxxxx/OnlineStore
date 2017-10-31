package com.jiang.entity;

/**
 * 商品留言类
 * @author JH
 *
 */
public class Message {

	private Integer id;         //商品留言id
	private Integer userId;     //用户id
	private Integer productId;  //商品id 
	private String message;     //留言信息
	
	
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
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}