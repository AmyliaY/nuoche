package com.pojo;

import java.sql.Timestamp;

/**
 * Proxychongzhi entity. @author MyEclipse Persistence Tools
 */

public class Proxychongzhi implements java.io.Serializable {

	// Fields

	//主键自增
	private Integer id;
	//代理
	private Proxy proxy;
	//充值金额
	private Double fee;
	//状态，0失败，1成功
	private Short status;
	//创建时间
	private Timestamp time;
	//订单号
	private String orderid;
	//微信订单号
	private String orderwx;

	// Constructors

	/** default constructor */
	public Proxychongzhi() {
	}

	/** full constructor */
	public Proxychongzhi(Proxy proxy, Double fee, Short status, Timestamp time, String orderid, String orderwx) {
		this.proxy = proxy;
		this.fee = fee;
		this.status = status;
		this.time = time;
		this.orderid = orderid;
		this.orderwx = orderwx;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Proxy getProxy() {
		return this.proxy;
	}

	public void setProxy(Proxy proxy) {
		this.proxy = proxy;
	}

	public Double getFee() {
		return this.fee;
	}

	public void setFee(Double fee) {
		this.fee = fee;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getOrderid() {
		return this.orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getOrderwx() {
		return this.orderwx;
	}

	public void setOrderwx(String orderwx) {
		this.orderwx = orderwx;
	}

}