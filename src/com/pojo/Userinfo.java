package com.pojo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Userinfo entity. @author MyEclipse Persistence Tools
 */

public class Userinfo implements java.io.Serializable {

	// Fields

	private Integer usersId;
	private String usersName;
	private String usersPhone;
	private String usersArea;
	private String usersHeadimg;
	private Integer usersStatus;
	private Integer usersGender;
	private String usersReferrer;
	private String usersRemark;
	private Timestamp usersCreatetime;
	private Double usersIntegral;
	private Integer usersType;
	private String usersPassword;
	private String usersCode;
	private String usersPaypwd;
	
	
	
	

	private Set systemmessageses = new HashSet(0);
	private Set weixinusers = new HashSet(0);
	private Set shoppingcats = new HashSet(0);
	private Set goodsorderses = new HashSet(0);
	private Set integralrecordses = new HashSet(0);
	private Set uamessageses = new HashSet(0);
	private Set collectionses = new HashSet(0);
	private Set payrecordses = new HashSet(0);
	private Set addresses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Userinfo() {
	}

	/** minimal constructor */
	public Userinfo(String usersName, String usersPhone, String usersArea, Integer usersStatus, Integer usersGender,
			Double usersIntegral, Integer usersType, String usersPassword) {
		this.usersName = usersName;
		this.usersPhone = usersPhone;
		this.usersArea = usersArea;
		this.usersStatus = usersStatus;
		this.usersGender = usersGender;
		this.usersIntegral = usersIntegral;
		this.usersType = usersType;
		this.usersPassword = usersPassword;
	}

	/** full constructor */
	public Userinfo(String usersName, String usersPhone, String usersArea, String usersHeadimg, Integer usersStatus,
			Integer usersGender, String usersReferrer, String usersRemark, Timestamp usersCreatetime,
			Double usersIntegral, Integer usersType, String usersPassword, String usersCode, String usersPaypwd,
			Set systemmessageses, Set weixinusers, Set shoppingcats, Set goodsorderses, Set integralrecordses,
			Set uamessageses, Set collectionses, Set payrecordses, Set addresses) {
		this.usersName = usersName;
		this.usersPhone = usersPhone;
		this.usersArea = usersArea;
		this.usersHeadimg = usersHeadimg;
		this.usersStatus = usersStatus;
		this.usersGender = usersGender;
		this.usersReferrer = usersReferrer;
		this.usersRemark = usersRemark;
		this.usersCreatetime = usersCreatetime;
		this.usersIntegral = usersIntegral;
		this.usersType = usersType;
		this.usersPassword = usersPassword;
		this.usersCode = usersCode;
		this.usersPaypwd = usersPaypwd;
		this.systemmessageses = systemmessageses;
		this.weixinusers = weixinusers;
		this.shoppingcats = shoppingcats;
		this.goodsorderses = goodsorderses;
		this.integralrecordses = integralrecordses;
		this.uamessageses = uamessageses;
		this.collectionses = collectionses;
		this.payrecordses = payrecordses;
		this.addresses = addresses;
	}

	// Property accessors

	public Integer getUsersId() {
		return this.usersId;
	}

	public void setUsersId(Integer usersId) {
		this.usersId = usersId;
	}

	public String getUsersName() {
		return this.usersName;
	}

	public void setUsersName(String usersName) {
		this.usersName = usersName;
	}

	public String getUsersPhone() {
		return this.usersPhone;
	}

	public void setUsersPhone(String usersPhone) {
		this.usersPhone = usersPhone;
	}

	public String getUsersArea() {
		return this.usersArea;
	}

	public void setUsersArea(String usersArea) {
		this.usersArea = usersArea;
	}

	public String getUsersHeadimg() {
		return this.usersHeadimg;
	}

	public void setUsersHeadimg(String usersHeadimg) {
		this.usersHeadimg = usersHeadimg;
	}

	public Integer getUsersStatus() {
		return this.usersStatus;
	}

	public void setUsersStatus(Integer usersStatus) {
		this.usersStatus = usersStatus;
	}

	public Integer getUsersGender() {
		return this.usersGender;
	}

	public void setUsersGender(Integer usersGender) {
		this.usersGender = usersGender;
	}

	public String getUsersReferrer() {
		return this.usersReferrer;
	}

	public void setUsersReferrer(String usersReferrer) {
		this.usersReferrer = usersReferrer;
	}

	public String getUsersRemark() {
		return this.usersRemark;
	}

	public void setUsersRemark(String usersRemark) {
		this.usersRemark = usersRemark;
	}

	public Timestamp getUsersCreatetime() {
		return this.usersCreatetime;
	}

	public void setUsersCreatetime(Timestamp usersCreatetime) {
		this.usersCreatetime = usersCreatetime;
	}

	public Double getUsersIntegral() {
		return this.usersIntegral;
	}

	public void setUsersIntegral(Double usersIntegral) {
		this.usersIntegral = usersIntegral;
	}

	public Integer getUsersType() {
		return this.usersType;
	}

	public void setUsersType(Integer usersType) {
		this.usersType = usersType;
	}

	public String getUsersPassword() {
		return this.usersPassword;
	}

	public void setUsersPassword(String usersPassword) {
		this.usersPassword = usersPassword;
	}

	public String getUsersCode() {
		return this.usersCode;
	}

	public void setUsersCode(String usersCode) {
		this.usersCode = usersCode;
	}

	public String getUsersPaypwd() {
		return this.usersPaypwd;
	}

	public void setUsersPaypwd(String usersPaypwd) {
		this.usersPaypwd = usersPaypwd;
	}

	public Set getSystemmessageses() {
		return this.systemmessageses;
	}

	public void setSystemmessageses(Set systemmessageses) {
		this.systemmessageses = systemmessageses;
	}

	public Set getWeixinusers() {
		return this.weixinusers;
	}

	public void setWeixinusers(Set weixinusers) {
		this.weixinusers = weixinusers;
	}

	public Set getShoppingcats() {
		return this.shoppingcats;
	}

	public void setShoppingcats(Set shoppingcats) {
		this.shoppingcats = shoppingcats;
	}

	public Set getGoodsorderses() {
		return this.goodsorderses;
	}

	public void setGoodsorderses(Set goodsorderses) {
		this.goodsorderses = goodsorderses;
	}

	public Set getIntegralrecordses() {
		return this.integralrecordses;
	}

	public void setIntegralrecordses(Set integralrecordses) {
		this.integralrecordses = integralrecordses;
	}

	public Set getUamessageses() {
		return this.uamessageses;
	}

	public void setUamessageses(Set uamessageses) {
		this.uamessageses = uamessageses;
	}

	public Set getCollectionses() {
		return this.collectionses;
	}

	public void setCollectionses(Set collectionses) {
		this.collectionses = collectionses;
	}

	public Set getPayrecordses() {
		return this.payrecordses;
	}

	public void setPayrecordses(Set payrecordses) {
		this.payrecordses = payrecordses;
	}

	public Set getAddresses() {
		return this.addresses;
	}

	public void setAddresses(Set addresses) {
		this.addresses = addresses;
	}

}