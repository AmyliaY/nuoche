package com.pojo;

import java.sql.Timestamp;

/**
 * ProxyCard entity. @author MyEclipse Persistence Tools
 */

public class ProxyCard implements java.io.Serializable {

	// Fields

	//主键自增
	private Integer id;
	//代理id
	private Integer proxyId;
	//领卡时间
	private String takeTime;
	//领卡数量
	private Integer num;
	//领卡费用
	private Float fee;
	//操作的管理员
	private Integer admin;
	//创建时间
	private Timestamp created;

	// Constructors

	/** default constructor */
	public ProxyCard() {
	}

	/** full constructor */
	public ProxyCard(Integer proxyId, String takeTime, Integer num, Float fee, Integer admin, Timestamp created) {
		this.proxyId = proxyId;
		this.takeTime = takeTime;
		this.num = num;
		this.fee = fee;
		this.admin = admin;
		this.created = created;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getProxyId() {
		return this.proxyId;
	}

	public void setProxyId(Integer proxyId) {
		this.proxyId = proxyId;
	}

	public String getTakeTime() {
		return this.takeTime;
	}

	public void setTakeTime(String takeTime) {
		this.takeTime = takeTime;
	}

	public Integer getNum() {
		return this.num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Float getFee() {
		return this.fee;
	}

	public void setFee(Float fee) {
		this.fee = fee;
	}

	public Integer getAdmin() {
		return this.admin;
	}

	public void setAdmin(Integer admin) {
		this.admin = admin;
	}

	public Timestamp getCreated() {
		return this.created;
	}

	public void setCreated(Timestamp created) {
		this.created = created;
	}

}