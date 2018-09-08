package com.pojo;

/**
 * BaoxianBaodan entity. @author MyEclipse Persistence Tools
 */

public class BaoxianBaodan implements java.io.Serializable {

	// Fields

	private Integer id;
	private WeixinUser weixinUser;
	private String name;
	private Float money;
	private Integer nomianpei; //1不计  0计

	// Constructors

	/** default constructor */
	public BaoxianBaodan() {
	}

	/** full constructor */
	public BaoxianBaodan(WeixinUser weixinUser, String name, Float money,
			Integer nomianpei) {
		this.weixinUser = weixinUser;
		this.name = name;
		this.money = money;
		this.nomianpei = nomianpei;
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

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Float getMoney() {
		return this.money;
	}

	public void setMoney(Float money) {
		this.money = money;
	}

	public Integer getNomianpei() {
		return this.nomianpei;
	}

	public void setNomianpei(Integer nomianpei) {
		this.nomianpei = nomianpei;
	}

}