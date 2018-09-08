package com.pojo;

/**
 * Aboutwe entity. @author MyEclipse Persistence Tools
 */

public class Aboutwe implements java.io.Serializable {

	// Fields

	//主键自增
	private Integer id;
	
	//关于我们详细
	private String awdesc;

	// Constructors

	/** default constructor */
	public Aboutwe() {
	}

	/** full constructor */
	public Aboutwe(String awdesc) {
		this.awdesc = awdesc;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAwdesc() {
		return this.awdesc;
	}

	public void setAwdesc(String awdesc) {
		this.awdesc = awdesc;
	}

}