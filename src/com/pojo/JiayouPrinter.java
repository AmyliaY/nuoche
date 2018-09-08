package com.pojo;

/**
 * JiayouPrinter entity. @author MyEclipse Persistence Tools
 */

public class JiayouPrinter implements java.io.Serializable {

	// Fields

	private Integer pid;
	private JiayouStation jiayouStation; //gsid
	private Boolean pstatus;
	private String mcode;
	private String msign;
	private String pname;
	private String psign;

	// Constructors

	/** default constructor */
	public JiayouPrinter() {
	}

	/** full constructor */
	public JiayouPrinter(JiayouStation gsid, Boolean pstatus, String mcode,
			String msign, String pname, String psign) {
		this.jiayouStation = gsid;
		this.pstatus = pstatus;
		this.mcode = mcode;
		this.msign = msign;
		this.pname = pname;
		this.psign = psign;
	}

	// Property accessors

	public Integer getPid() {
		return this.pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	
	public JiayouStation getJiayouStation() {
		return jiayouStation;
	}

	public void setJiayouStation(JiayouStation jiayouStation) {
		this.jiayouStation = jiayouStation;
	}

	public Boolean getPstatus() {
		return this.pstatus;
	}

	public void setPstatus(Boolean pstatus) {
		this.pstatus = pstatus;
	}

	public String getMcode() {
		return this.mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode;
	}

	public String getMsign() {
		return this.msign;
	}

	public void setMsign(String msign) {
		this.msign = msign;
	}

	public String getPname() {
		return this.pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPsign() {
		return this.psign;
	}

	public void setPsign(String psign) {
		this.psign = psign;
	}

}