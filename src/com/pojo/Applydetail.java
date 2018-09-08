package com.pojo;

import java.sql.Timestamp;

/**
 * Applydetail entity. @author MyEclipse Persistence Tools
 */

public class Applydetail implements java.io.Serializable {

	// Fields

	//主键自增
	private Integer id;
	//配送公司
	private PeisongCorp peisongCorp;
	//微信用户
	private WeixinUser weixinUser;
	//订单id
	private String orderId;
	//微信订单id
	private String orderWx;
	//二维码数量
	private Integer cardNum;
	//申请时间
	private Timestamp time;
	//邮费
	private Double postFee;
	//卡费
	private Double cardFee;
	//总额
	private Double totalFee;
	//状态，0未发货，1未付款，2已付款，3已发货，4已收货
	private Short status;
	//创建时间
	private Timestamp created;
	//付款时间
	private Timestamp updated;
	//结束时间
	private Timestamp endTime;
	//关闭时间
	private Timestamp closeTime;
	//物流编号
	private String shippingCode;
	//买家姓名
	private String buyer;
	//买家地址
	private String buyerAddr;
	//买家电话
	private String buyerTel;
	
	private Float a1;
	private Float a2;
	private String b1;
	private String b2;

	// Constructors

	/** default constructor */
	public Applydetail() {
	}

	/** full constructor */
	public Applydetail(PeisongCorp peisongCorp, WeixinUser weixinUser, String orderId, String orderWx, Integer cardNum,
			Timestamp time, Double postFee, Double cardFee, Double totalFee, Short status, Timestamp created,
			Timestamp updated, Timestamp endTime, Timestamp closeTime, String shippingCode, String buyer,
			String buyerAddr, String buyerTel, Float a1, Float a2, String b1, String b2) {
		this.peisongCorp = peisongCorp;
		this.weixinUser = weixinUser;
		this.orderId = orderId;
		this.orderWx = orderWx;
		this.cardNum = cardNum;
		this.time = time;
		this.postFee = postFee;
		this.cardFee = cardFee;
		this.totalFee = totalFee;
		this.status = status;
		this.created = created;
		this.updated = updated;
		this.endTime = endTime;
		this.closeTime = closeTime;
		this.shippingCode = shippingCode;
		this.buyer = buyer;
		this.buyerAddr = buyerAddr;
		this.buyerTel = buyerTel;
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

	public PeisongCorp getPeisongCorp() {
		return this.peisongCorp;
	}

	public void setPeisongCorp(PeisongCorp peisongCorp) {
		this.peisongCorp = peisongCorp;
	}

	public WeixinUser getWeixinUser() {
		return this.weixinUser;
	}

	public void setWeixinUser(WeixinUser weixinUser) {
		this.weixinUser = weixinUser;
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

	public Integer getCardNum() {
		return this.cardNum;
	}

	public void setCardNum(Integer cardNum) {
		this.cardNum = cardNum;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public Double getPostFee() {
		return this.postFee;
	}

	public void setPostFee(Double postFee) {
		this.postFee = postFee;
	}

	public Double getCardFee() {
		return this.cardFee;
	}

	public void setCardFee(Double cardFee) {
		this.cardFee = cardFee;
	}

	public Double getTotalFee() {
		return this.totalFee;
	}

	public void setTotalFee(Double totalFee) {
		this.totalFee = totalFee;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public Timestamp getCreated() {
		return this.created;
	}

	public void setCreated(Timestamp created) {
		this.created = created;
	}

	public Timestamp getUpdated() {
		return this.updated;
	}

	public void setUpdated(Timestamp updated) {
		this.updated = updated;
	}

	public Timestamp getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

	public Timestamp getCloseTime() {
		return this.closeTime;
	}

	public void setCloseTime(Timestamp closeTime) {
		this.closeTime = closeTime;
	}

	public String getShippingCode() {
		return this.shippingCode;
	}

	public void setShippingCode(String shippingCode) {
		this.shippingCode = shippingCode;
	}

	public String getBuyer() {
		return this.buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public String getBuyerAddr() {
		return this.buyerAddr;
	}

	public void setBuyerAddr(String buyerAddr) {
		this.buyerAddr = buyerAddr;
	}

	public String getBuyerTel() {
		return this.buyerTel;
	}

	public void setBuyerTel(String buyerTel) {
		this.buyerTel = buyerTel;
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