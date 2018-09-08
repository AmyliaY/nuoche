package com.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * JiayouZhekou entity. @author MyEclipse Persistence Tools
 */

public class JiayouZhekou implements java.io.Serializable {

	// Fields

	private Integer oid;
	private JiayouStation jiayouStation;
	private String oname;
	private Integer ostyle;
	private String  ostyle2; 
	public String getOstyle2() {
		return ostyle2;
	}

	public void setOstyle2(String ostyle2) {
		this.ostyle2 = ostyle2;
	}

	private Float oprice;
	private String odetail;
	private Integer ostatus;
	private Float zhekou;
	private Set jiayouJilus = new HashSet(0);

	// Constructors

	/** default constructor */
	public JiayouZhekou() {
	}

	/** minimal constructor */
	public JiayouZhekou(Integer ostatus) {
		this.ostatus = ostatus;
	}

	/** full constructor */
	public JiayouZhekou(JiayouStation jiayouStation, String oname,
			Integer ostyle, Float oprice, String odetail, Integer ostatus,
			Float zhekou, Set jiayouJilus) {
		this.jiayouStation = jiayouStation;
		this.oname = oname;
		this.ostyle = ostyle;
		this.oprice = oprice;
		this.odetail = odetail;
		this.ostatus = ostatus;
		this.zhekou = zhekou;
		this.jiayouJilus = jiayouJilus;
	}

	// Property accessors

	public Integer getOid() {
		return this.oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public JiayouStation getJiayouStation() {
		return this.jiayouStation;
	}

	public void setJiayouStation(JiayouStation jiayouStation) {
		this.jiayouStation = jiayouStation;
	}

	public String getOname() {
		return this.oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public Integer getOstyle() {
		return this.ostyle;
	}

	public void setOstyle(Integer ostyle) {
		this.ostyle = ostyle;
	}

	public Float getOprice() {
		return this.oprice;
	}

	public void setOprice(Float oprice) {
		this.oprice = oprice;
	}

	public String getOdetail() {
		return this.odetail;
	}

	public void setOdetail(String odetail) {
		this.odetail = odetail;
	}

	public Integer getOstatus() {
		return this.ostatus;
	}

	public void setOstatus(Integer ostatus) {
		this.ostatus = ostatus;
	}

	public Float getZhekou() {
		return this.zhekou;
	}

	public void setZhekou(Float zhekou) {
		this.zhekou = zhekou;
	}

	public Set getJiayouJilus() {
		return this.jiayouJilus;
	}

	public void setJiayouJilus(Set jiayouJilus) {
		this.jiayouJilus = jiayouJilus;
	}

}