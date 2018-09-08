package com.pojo;

import java.sql.Timestamp;

/**
 * ServiceComment entity. @author MyEclipse Persistence Tools
 */

public class ServiceComment implements java.io.Serializable {

	// Fields

	//主键自增
	private Integer id;
	//评论的会员
	private User user;
	//被评论的商家
	private Business business;
	//评论内容
	private Integer message;
	//评论时间
	private Timestamp messagetime;
	//回复内容
	private String replay;
	//回复时间
	private Timestamp replaytime;
	
	private Float a1;
	private Float a2;
	private String b1;
	private String b2;

	// Constructors

	/** default constructor */
	public ServiceComment() {
	}

	/** full constructor */
	public ServiceComment(User user, Business business, Integer message, Timestamp messagetime, String replay,
			Timestamp replaytime, Float a1, Float a2, String b1, String b2) {
		this.user = user;
		this.business = business;
		this.message = message;
		this.messagetime = messagetime;
		this.replay = replay;
		this.replaytime = replaytime;
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

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Business getBusiness() {
		return this.business;
	}

	public void setBusiness(Business business) {
		this.business = business;
	}

	public Integer getMessage() {
		return this.message;
	}

	public void setMessage(Integer message) {
		this.message = message;
	}

	public Timestamp getMessagetime() {
		return this.messagetime;
	}

	public void setMessagetime(Timestamp messagetime) {
		this.messagetime = messagetime;
	}

	public String getReplay() {
		return this.replay;
	}

	public void setReplay(String replay) {
		this.replay = replay;
	}

	public Timestamp getReplaytime() {
		return this.replaytime;
	}

	public void setReplaytime(Timestamp replaytime) {
		this.replaytime = replaytime;
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