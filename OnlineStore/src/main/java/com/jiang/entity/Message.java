package com.jiang.entity;

/**
 * 商品留言类
 * @author JH
 *
 */
public class Message {

	private Integer id;         //商品留言id
	private User user;          //用户
	private Product product;    //商品 
	private String message;     //留言信息
	
	
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
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}