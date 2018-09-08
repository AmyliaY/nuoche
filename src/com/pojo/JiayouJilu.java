package com.pojo;

import java.sql.Timestamp;

/**
 * JiayouJilu entity. @author MyEclipse Persistence Tools
 */

public class JiayouJilu implements java.io.Serializable {

	// Fields

	private Integer id;
	private JiayouZhekou jiayouZhekou; //折扣表
	private WeixinUser weixinUser;   //加油用户
	private Float price;   //原价
	private Float zhekou;  //折扣 
	private Float yinfu;   //应付=原价*折扣
	private Float shifu;   //实付
	private Timestamp time;
	private Float yuer; //余额支付
	private int   status; //0未付款   1已付款
	private Float youhuijuan_money; //优惠卷金额（可叠加）
	private String youhuijuan_ids;  //优惠卷编号（用,隔开)
	private JiayouEmp  emp;           //员工编号
	private String orderid;//支付订单
	private int    payType;//1折扣  2.余额  3.红包
	// 实付+余额-应付--》下期余额
	
	
	public JiayouEmp getEmp() {
		return emp;
	}

	public int getPayType() {
		return payType;
	}

	public void setPayType(int payType) {
		this.payType = payType;
	}

	public int getStatus() {
		return status;
	}

	public void setEmp(JiayouEmp emp) {
		this.emp = emp;
	}

	public Float getYouhuijuan_money() {
		return youhuijuan_money;
	}

	public void setYouhuijuan_money(Float youhuijuanMoney) {
		youhuijuan_money = youhuijuanMoney;
	}

	public String getYouhuijuan_ids() {
		return youhuijuan_ids;
	}

	public void setYouhuijuan_ids(String youhuijuanIds) {
		youhuijuan_ids = youhuijuanIds;
	}


	public void setStatus(int status) {
		this.status = status;
	}

	

	// Constructors

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	/** default constructor */
	public JiayouJilu() {
	}

	/** full constructor */
	public JiayouJilu(JiayouZhekou jiayouZhekou, WeixinUser weixinUser,
			Float price, Float zhekou, Float yinfu, Float shifu,
			Timestamp time, Float yuer) {
		this.jiayouZhekou = jiayouZhekou;
		this.weixinUser = weixinUser;
		this.price = price;
		this.zhekou = zhekou;
		this.yinfu = yinfu;
		this.shifu = shifu;
		this.time = time;
		this.yuer = yuer;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public JiayouZhekou getJiayouZhekou() {
		return this.jiayouZhekou;
	}

	public void setJiayouZhekou(JiayouZhekou jiayouZhekou) {
		this.jiayouZhekou = jiayouZhekou;
	}

	public WeixinUser getWeixinUser() {
		return this.weixinUser;
	}

	public void setWeixinUser(WeixinUser weixinUser) {
		this.weixinUser = weixinUser;
	}

	public Float getPrice() {
		return this.price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Float getZhekou() {
		return this.zhekou;
	}

	public void setZhekou(Float zhekou) {
		this.zhekou = zhekou;
	}

	public Float getYinfu() {
		return this.yinfu;
	}

	public void setYinfu(Float yinfu) {
		this.yinfu = yinfu;
	}

	public Float getShifu() {
		return this.shifu;
	}

	public void setShifu(Float shifu) {
		this.shifu = shifu;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public Float getYuer() {
		return this.yuer;
	}

	public void setYuer(Float yuer) {
		this.yuer = yuer;
	}

}