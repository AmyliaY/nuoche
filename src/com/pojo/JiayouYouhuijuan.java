package com.pojo;

import java.sql.Timestamp;

/**
 * JiayouYouhuijuan entity. @author MyEclipse Persistence Tools
 */

public class JiayouYouhuijuan implements java.io.Serializable {

	// Fields

	private Integer id;
	private WeixinUser weixinUser;
	private Float money;
	private Float youmoney;
	private Timestamp time;
	private int  status; //0未使用 1已使用  2已过期
	private int  type;   //1柴油  2汽油

	// Constructors

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	/** default constructor */
	public JiayouYouhuijuan() {
	}

	/** full constructor */
	public JiayouYouhuijuan(WeixinUser weixinUser, Float money, Float youmoney,
			Timestamp time) {
		this.weixinUser = weixinUser;
		this.money = money;
		this.youmoney = youmoney;
		this.time = time;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public WeixinUser getWeixinUser() {
		return this.weixinUser;
	}

	public void setWeixinUser(WeixinUser weixinUser) {
		this.weixinUser = weixinUser;
	}

	public Float getMoney() {
		return this.money;
	}

	public void setMoney(Float money) {
		this.money = money;
	}

	public Float getYoumoney() {
		return this.youmoney;
	}

	public void setYoumoney(Float youmoney) {
		this.youmoney = youmoney;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

}