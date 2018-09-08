package com.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * BaoxianGonshi entity. @author MyEclipse Persistence Tools
 */

public class BaoxianGonshi implements java.io.Serializable {

	// Fields

	private Integer id;
	public int getCheck() {
		return check;
	}

	public void setCheck(int check) {
		this.check = check;
	}

	private String name;
	private String logo;
	private int    check; //1选中
	public String getOpenid1() {
		return openid1;
	}

	public void setOpenid1(String openid1) {
		this.openid1 = openid1;
	}

	public String getOpenid2() {
		return openid2;
	}

	public void setOpenid2(String openid2) {
		this.openid2 = openid2;
	}

	public String getOpenid3() {
		return openid3;
	}

	public void setOpenid3(String openid3) {
		this.openid3 = openid3;
	}

	public String getOpenid4() {
		return openid4;
	}

	public void setOpenid4(String openid4) {
		this.openid4 = openid4;
	}

	public String getOpenid5() {
		return openid5;
	}

	public void setOpenid5(String openid5) {
		this.openid5 = openid5;
	}

	private Integer status;
	
	private String openid1; //发新保险通知openid
	private String openid2;
	private String openid3;
	private String openid4;
	private String openid5;
	
	
	private Set baoxianBaodanGonshis = new HashSet(0);
    
	// Constructors

	/** default constructor */
	public BaoxianGonshi() {
	}

	/** full constructor */
	public BaoxianGonshi(String name, String logo, Integer status,
			Set baoxianBaodanGonshis) {
		this.name = name;
		this.logo = logo;
		this.status = status;
		this.baoxianBaodanGonshis = baoxianBaodanGonshis;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLogo() {
		return this.logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Set getBaoxianBaodanGonshis() {
		return this.baoxianBaodanGonshis;
	}

	public void setBaoxianBaodanGonshis(Set baoxianBaodanGonshis) {
		this.baoxianBaodanGonshis = baoxianBaodanGonshis;
	}

}