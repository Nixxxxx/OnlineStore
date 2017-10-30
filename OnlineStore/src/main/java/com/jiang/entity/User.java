package com.jiang.entity;

public class User {

	private Integer id;         //用户id
	private String userName;    //用户名
	private String password;    //密码
	private String name;        //真实姓名
	private String mobile;      //手机号
	private String email;       //邮箱
	private String college;     //学院专业班级
	private Integer bee;        //小蜜蜂认证(未认证：0  待审核：1 未通过：2 已认证：3)
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public Integer getBee() {
		return bee;
	}
	public void setBee(Integer bee) {
		this.bee = bee;
	}
}
