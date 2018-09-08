package com.pojo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Yuyue entity. @author MyEclipse Persistence Tools
 */

public class Yuyue implements java.io.Serializable {

	// Fields
	//主键自增
	private Integer id;
	//会员
	private WeixinUser user;
	//服务
	private Service service;
	//预约时间
	private Timestamp time;
	//实付金额
	private Double pay;
	//支付类型
	private Short payType;
	//状态，0未付款，1已付款，2已消费
	private Short status;
	//订单号
	private String orderWx;
	//微信订单号
	private String returnWx;
	//订单创建时间
	private Timestamp created;
	//买家留言
	private String buyerComment;
	//是否评论，0未评论，1评论
	private Short isComment;
	private Set comments = new HashSet(0);

	// Constructors

	/** default constructor */
	public Yuyue() {
	}

	/** full constructor */
	public Yuyue(WeixinUser user, Service service, Timestamp time, Double pay, Short payType, Short status, String orderWx,
			String returnWx, Timestamp created, String buyerComment, Short isComment, Set comments) {
		this.user = user;
		this.service = service;
		this.time = time;
		this.pay = pay;
		this.payType = payType;
		this.status = status;
		this.orderWx = orderWx;
		this.returnWx = returnWx;
		this.created = created;
		this.buyerComment = buyerComment;
		this.isComment = isComment;
		this.comments = comments;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public WeixinUser getUser() {
		return this.user;
	}

	public void setUser(WeixinUser user) {
		this.user = user;
	}

	public Service getService() {
		return this.service;
	}

	public void setService(Service service) {
		this.service = service;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public Double getPay() {
		return this.pay;
	}

	public void setPay(Double pay) {
		this.pay = pay;
	}

	public Short getPayType() {
		return this.payType;
	}

	public void setPayType(Short payType) {
		this.payType = payType;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public String getOrderWx() {
		return this.orderWx;
	}

	public void setOrderWx(String orderWx) {
		this.orderWx = orderWx;
	}

	public String getReturnWx() {
		return this.returnWx;
	}

	public void setReturnWx(String returnWx) {
		this.returnWx = returnWx;
	}

	public Timestamp getCreated() {
		return this.created;
	}

	public void setCreated(Timestamp created) {
		this.created = created;
	}

	public String getBuyerComment() {
		return this.buyerComment;
	}

	public void setBuyerComment(String buyerComment) {
		this.buyerComment = buyerComment;
	}

	public Short getIsComment() {
		return this.isComment;
	}

	public void setIsComment(Short isComment) {
		this.isComment = isComment;
	}

	public Set getComments() {
		return this.comments;
	}

	public void setComments(Set comments) {
		this.comments = comments;
	}

}