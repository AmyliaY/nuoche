package com.pojo;

import java.sql.Timestamp;

/**
 * ProxyCash entity. @author MyEclipse Persistence Tools
 */

public class ProxyCash implements java.io.Serializable {

	// Fields

	//主键自增
	private Integer id;
	//代理人
	private Proxy proxy;
	//提现时间
	private Timestamp time;
	//提现金额
	private Double cash;
	//订单号
	private String orderId;
	//微信订单号
	private String orderWx;
	//0未审核，1已同意，2被拒绝
	private Short status;

	// Constructors

	/** default constructor */
	public ProxyCash() {
	}

	/** full constructor */
	public ProxyCash(Proxy proxy, Timestamp time, Double cash, String orderId, String orderWx, Short status) {
		this.proxy = proxy;
		this.time = time;
		this.cash = cash;
		this.orderId = orderId;
		this.orderWx = orderWx;
		this.status = status;
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

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public Double getCash() {
		return this.cash;
	}

	public void setCash(Double cash) {
		this.cash = cash;
	}

	public String getOrderId() {
		return this.orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getOrderWx() {
		return this.orderWx;
	}

	public void setOrderWx(String orderWx) {
		this.orderWx = orderWx;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

}