package com.pojo;

import java.sql.Timestamp;

/**
 * Movecar entity. @author MyEclipse Persistence Tools
 */

public class Movecar implements java.io.Serializable {

	// Fields

	//主键自增
	private Integer id;
	//申请挪车的openid
	private WeixinUser userByUser;
	//被挪车
	private User userByCar;
	//挪车时间
	private Timestamp time;
	//地址
	private String addr;
	//状态，0成功，2挪车中
	private Short status;

	// Constructors

	/** default constructor */
	public Movecar() {
	}

	/** full constructor */
	public Movecar(WeixinUser userByUser, User userByCar, Timestamp time, String addr, Short status) {
		this.userByUser = userByUser;
		this.userByCar = userByCar;
		this.time = time;
		this.addr = addr;
		this.status = status;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public WeixinUser getUserByUser() {
		return this.userByUser;
	}

	public void setUserByUser(WeixinUser userByUser) {
		this.userByUser = userByUser;
	}

	public User getUserByCar() {
		return this.userByCar;
	}

	public void setUserByCar(User userByCar) {
		this.userByCar = userByCar;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getAddr() {
		return this.addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

}