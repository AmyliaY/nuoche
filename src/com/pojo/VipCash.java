package com.pojo;

import java.sql.Timestamp;

/**
 * VipCash entity. @author MyEclipse Persistence Tools
 */

public class VipCash implements java.io.Serializable {

	// Fields

	//主键，自增
	private Integer id;
	//会员
	private User user;
	//提现时间
	private Timestamp time;
	//提现金额
	private Double cash;
	//订单号
	private String orderId;
	//微信订单号
	private String orderWx;
	//状态，0未审核，1已同意，2被拒绝
	private Short status;
	
	private Float a1;
	private Float a2;
	private String b1;
	private String b2;

	// Constructors

	/** default constructor */
	public VipCash() {
	}

	/** full constructor */
	public VipCash(User user, Timestamp time, Double cash, String orderId, String orderWx, Short status, Float a1,
			Float a2, String b1, String b2) {
		this.user = user;
		this.time = time;
		this.cash = cash;
		this.orderId = orderId;
		this.orderWx = orderWx;
		this.status = status;
		this.a1 = a1;
		this.a2 = a2;
		this.b1 = b1;
		this.b2 = b2;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public Float getA1() {
		return this.a1;
	}

	public void setA1(Float a1) {
		this.a1 = a1;
	}

	public Float getA2() {
		return this.a2;
	}

	public void setA2(Float a2) {
		this.a2 = a2;
	}

	public String getB1() {
		return this.b1;
	}

	public void setB1(String b1) {
		this.b1 = b1;
	}

	public String getB2() {
		return this.b2;
	}

	public void setB2(String b2) {
		this.b2 = b2;
	}

}