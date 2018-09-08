package com.pojo;

/**
 * TelParam entity. @author MyEclipse Persistence Tools
 */

public class TelParam implements java.io.Serializable {

	// Fields

	//主键自增
	private Integer id;
	//被叫电话号码
	private String callednumber;
	//主叫电话号码
	private String callingnumber;
	//加密
	private String md5key;
	//状态，0禁用，1启用
	private Short status;
	//
	private String appid;
	//
	private String returnUrl;
	
	private Float a1;
	private Float a2;
	private String b1;
	private String b2;

	// Constructors

	/** default constructor */
	public TelParam() {
	}

	/** full constructor */
	public TelParam(String callednumber, String callingnumber, String md5key, Short status, String appid,
			String returnUrl, Float a1, Float a2, String b1, String b2) {
		this.callednumber = callednumber;
		this.callingnumber = callingnumber;
		this.md5key = md5key;
		this.status = status;
		this.appid = appid;
		this.returnUrl = returnUrl;
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

	public String getCallednumber() {
		return this.callednumber;
	}

	public void setCallednumber(String callednumber) {
		this.callednumber = callednumber;
	}

	public String getCallingnumber() {
		return this.callingnumber;
	}

	public void setCallingnumber(String callingnumber) {
		this.callingnumber = callingnumber;
	}

	public String getMd5key() {
		return this.md5key;
	}

	public void setMd5key(String md5key) {
		this.md5key = md5key;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public String getAppid() {
		return this.appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
	}

	public String getReturnUrl() {
		return this.returnUrl;
	}

	public void setReturnUrl(String returnUrl) {
		this.returnUrl = returnUrl;
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