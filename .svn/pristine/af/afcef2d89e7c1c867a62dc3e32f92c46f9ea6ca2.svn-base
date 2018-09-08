package com.pojo;

import java.sql.Timestamp;

/**
 * Payrecords entity. @author MyEclipse Persistence Tools
 */

public class Payrecords implements java.io.Serializable {

	// Fields

	private Integer prId;
	private Userinfo userinfo;   //会员
	private Double prMoney;      //金额
	private Integer prType;      //1支付宝  2微信  3.现场
	private Timestamp prTime;    //时间
	private String prDingdanhao; //订单号
	private Integer prStatus;    //状态 0未付款  1成功
	private Integer prPresent;   //赠送积分

	// Constructors

	/** default constructor */
	public Payrecords() {
	}

	/** minimal constructor */
	public Payrecords(Userinfo userinfo, Double prMoney, Integer prType,
			Integer prStatus) {
		this.userinfo = userinfo;
		this.prMoney = prMoney;
		this.prType = prType;
		this.prStatus = prStatus;
	}

	/** full constructor */
	public Payrecords(Userinfo userinfo, Double prMoney, Integer prType,
			Timestamp prTime, String prDingdanhao, Integer prStatus,
			Integer prPresent) {
		this.userinfo = userinfo;
		this.prMoney = prMoney;
		this.prType = prType;
		this.prTime = prTime;
		this.prDingdanhao = prDingdanhao;
		this.prStatus = prStatus;
		this.prPresent = prPresent;
	}

	// Property accessors

	public Integer getPrId() {
		return this.prId;
	}

	public void setPrId(Integer prId) {
		this.prId = prId;
	}

	public Userinfo getUserinfo() {
		return this.userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public Double getPrMoney() {
		return this.prMoney;
	}

	public void setPrMoney(Double prMoney) {
		this.prMoney = prMoney;
	}

	public Integer getPrType() {
		return this.prType;
	}

	public void setPrType(Integer prType) {
		this.prType = prType;
	}

	public Timestamp getPrTime() {
		return this.prTime;
	}

	public void setPrTime(Timestamp prTime) {
		this.prTime = prTime;
	}

	public String getPrDingdanhao() {
		return this.prDingdanhao;
	}

	public void setPrDingdanhao(String prDingdanhao) {
		this.prDingdanhao = prDingdanhao;
	}

	public Integer getPrStatus() {
		return this.prStatus;
	}

	public void setPrStatus(Integer prStatus) {
		this.prStatus = prStatus;
	}

	public Integer getPrPresent() {
		return this.prPresent;
	}

	public void setPrPresent(Integer prPresent) {
		this.prPresent = prPresent;
	}

}