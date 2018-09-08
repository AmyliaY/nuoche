package com.pojo;

import java.sql.Timestamp;

/**
 * MGuess entity. @author MyEclipse Persistence Tools
 */

public class MGuess implements java.io.Serializable {

	// Fields

	private Integer id;
	private Goods goods;
	private MSongs MSongs;
	private Userinfo userinfo;
	private Timestamp time;
	private Integer lastStatus;

	// Constructors

	/** default constructor */
	public MGuess() {
	}

	/** full constructor */
	public MGuess(Goods goods, MSongs MSongs, Userinfo userinfo,
			Timestamp time, Integer lastStatus) {
		this.goods = goods;
		this.MSongs = MSongs;
		this.userinfo = userinfo;
		this.time = time;
		this.lastStatus = lastStatus;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Goods getGoods() {
		return this.goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public MSongs getMSongs() {
		return this.MSongs;
	}

	public void setMSongs(MSongs MSongs) {
		this.MSongs = MSongs;
	}

	public Userinfo getUserinfo() {
		return this.userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public Integer getLastStatus() {
		return this.lastStatus;
	}

	public void setLastStatus(Integer lastStatus) {
		this.lastStatus = lastStatus;
	}

}