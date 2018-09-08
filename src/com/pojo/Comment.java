package com.pojo;

import java.sql.Timestamp;

/**
 * Comment entity. @author MyEclipse Persistence Tools
 */

public class Comment implements java.io.Serializable {

	// Fields

	//主键自增
	private Integer id;
	//用户
	private User user;
	//关联预约表id
	private Yuyue yuyue;
	//评论时间
	private Timestamp time;
	//评论标题
	private String title;
	//评论内容
	private String content;
	//星级
	private Integer level;
	
	private Float a1;
	private Float a2;
	private String b1;
	private String b2;

	// Constructors

	/** default constructor */
	public Comment() {
	}

	/** full constructor */
	public Comment(User user, Yuyue yuyue, Timestamp time, String title, String content, Integer level, Float a1,
			Float a2, String b1, String b2) {
		this.user = user;
		this.yuyue = yuyue;
		this.time = time;
		this.title = title;
		this.content = content;
		this.level = level;
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

	public Yuyue getYuyue() {
		return this.yuyue;
	}

	public void setYuyue(Yuyue yuyue) {
		this.yuyue = yuyue;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getLevel() {
		return this.level;
	}

	public void setLevel(Integer level) {
		this.level = level;
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