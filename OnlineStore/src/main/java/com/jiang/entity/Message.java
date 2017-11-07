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
	private Integer verify;     //审核（0：待审核 1：未通过 2：已通过)
	
	
	public Message() {
		super();
	}

	public Message(User user, Product product, String message, Integer verify) {
		super();
		this.user = user;
		this.product = product;
		this.message = message;
		this.verify = verify;
	}

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
	public Integer getVerify() {
		return verify;
	}
	public void setVerify(Integer verify) {
		this.verify = verify;
	}
}