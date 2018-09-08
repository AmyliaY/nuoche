package com.pojo;

import java.sql.Timestamp;

/**
 * Top entity. @author MyEclipse Persistence Tools
 */

public class Top implements java.io.Serializable {

	// Fields

	//主键自增
	private Integer id;
	//代理
	private Proxy proxy;
	//服务
	private Service service;
	//置顶天数
	private Integer days;
	//创建时间
	private Timestamp created;
	//单价
	private Float danjia;
	//总金额
	private Float totalprice;

	// Constructors

	/** default constructor */
	public Top() {
	}

	/** full constructor */
	public Top(Proxy proxy, Service service, Integer days, Timestamp created, Float danjia, Float totalprice) {
		this.proxy = proxy;
		this.service = service;
		this.days = days;
		this.created = created;
		this.danjia = danjia;
		this.totalprice = totalprice;
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

	public Service getService() {
		return this.service;
	}

	public void setService(Service service) {
		this.service = service;
	}

	public Integer getDays() {
		return this.days;
	}

	public void setDays(Integer days) {
		this.days = days;
	}

	public Timestamp getCreated() {
		return this.created;
	}

	public void setCreated(Timestamp created) {
		this.created = created;
	}

	public Float getDanjia() {
		return this.danjia;
	}

	public void setDanjia(Float danjia) {
		this.danjia = danjia;
	}

	public Float getTotalprice() {
		return this.totalprice;
	}

	public void setTotalprice(Float totalprice) {
		this.totalprice = totalprice;
	}

}