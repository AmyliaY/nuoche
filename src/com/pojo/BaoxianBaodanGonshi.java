package com.pojo;

import java.sql.Timestamp;

/**
 * BaoxianBaodanGonshi entity. @author MyEclipse Persistence Tools
 */

public class BaoxianBaodanGonshi implements java.io.Serializable {

	// Fields

	private Integer id;
	private BaoxianGonshi baoxianGonshi;
	private WeixinUser weixinUser;
	public String getPayid() {
		return payid;
	}

	public void setPayid(String payid) {
		this.payid = payid;
	}

	private Float money;    //报价
	private Integer status; //0申请，1已报价  2已付款
	private Timestamp  time; //申请时间
	private String payid;    //微信支付订单号

	// Constructors

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	/** default constructor */
	public BaoxianBaodanGonshi() {
	}

	/** full constructor */
	public BaoxianBaodanGonshi(BaoxianGonshi baoxianGonshi,
			WeixinUser weixinUser, Float money, Integer status) {
		this.baoxianGonshi = baoxianGonshi;
		this.weixinUser = weixinUser;
		this.money = money;
		this.status = status;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public BaoxianGonshi getBaoxianGonshi() {
		return this.baoxianGonshi;
	}

	public void setBaoxianGonshi(BaoxianGonshi baoxianGonshi) {
		this.baoxianGonshi = baoxianGonshi;
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

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}