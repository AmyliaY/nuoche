package com.pojo;

import java.sql.Timestamp;

/**
 * Applybusiness entity. @author MyEclipse Persistence Tools
 */

public class Applybusiness implements java.io.Serializable {

	// Fields

	private Integer id;
	private Area area;
	private String openid;
	private Float a1;
	private Float a2;
	private String b1;
	private String b2;
	private String shoptype;
	private String shopname;
	private String shoplogo;
	private String shopaddr;
	private String shopDesc;
	private String realname;
	private Short gender;
	private String tel;
	private Timestamp applytime;
	private Short status;
	private String email;
	private Double longitude;
	private Double latitude;

	// Constructors

	/** default constructor */
	public Applybusiness() {
	}

	/** full constructor */
	public Applybusiness(Area area, String openid, Float a1, Float a2, String b1, String b2, String shoptype,
			String shopname, String shoplogo, String shopaddr, String shopDesc, String realname, Short gender,
			String tel, Timestamp applytime, Short status, String email, Double longitude, Double latitude) {
		this.area = area;
		this.openid = openid;
		this.a1 = a1;
		this.a2 = a2;
		this.b1 = b1;
		this.b2 = b2;
		this.shoptype = shoptype;
		this.shopname = shopname;
		this.shoplogo = shoplogo;
		this.shopaddr = shopaddr;
		this.shopDesc = shopDesc;
		this.realname = realname;
		this.gender = gender;
		this.tel = tel;
		this.applytime = applytime;
		this.status = status;
		this.email = email;
		this.longitude = longitude;
		this.latitude = latitude;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Area getArea() {
		return this.area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public String getOpenid() {
		return this.openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
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

	public String getShoptype() {
		return this.shoptype;
	}

	public void setShoptype(String shoptype) {
		this.shoptype = shoptype;
	}

	public String getShopname() {
		return this.shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public String getShoplogo() {
		return this.shoplogo;
	}

	public void setShoplogo(String shoplogo) {
		this.shoplogo = shoplogo;
	}

	public String getShopaddr() {
		return this.shopaddr;
	}

	public void setShopaddr(String shopaddr) {
		this.shopaddr = shopaddr;
	}

	public String getShopDesc() {
		return this.shopDesc;
	}

	public void setShopDesc(String shopDesc) {
		this.shopDesc = shopDesc;
	}

	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public Short getGender() {
		return this.gender;
	}

	public void setGender(Short gender) {
		this.gender = gender;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Timestamp getApplytime() {
		return this.applytime;
	}

	public void setApplytime(Timestamp applytime) {
		this.applytime = applytime;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Double getLongitude() {
		return this.longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Double getLatitude() {
		return this.latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

}