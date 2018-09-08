package com.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * JiayouStation entity. @author MyEclipse Persistence Tools
 */

public class JiayouStation implements java.io.Serializable {

	// Fields

	private Integer gid;
	private Integer aid; 
	private String gname;      //名称
	private String gaddress;   //地址
	private String gcode;      //代号
	private String gpicture;   //图片
	private String gdescribe;  //描述
	private Integer gstatus;   //状态（上下架）
	private String gzuobiaox;  //经度
	private String gzuobiaoy;  //纬度
	private String uid;        //第三方支付，用户
	private String token;      //第三方支付，密码
	private Proxy  proxy;      //代理
	
	private Float qiyou_fanxian; //汽油返现比率  0-1 
	private Float chai_fanxian;  //柴油返现比率  0-1
	
	
	public Float getQiyou_fanxian() {
		return qiyou_fanxian;
	}

	public void setQiyou_fanxian(Float qiyouFanxian) {
		qiyou_fanxian = qiyouFanxian;
	}

	public Float getChai_fanxian() {
		return chai_fanxian;
	}

	public void setChai_fanxian(Float chaiFanxian) {
		chai_fanxian = chaiFanxian;
	}

	
	

	private Set jiayouZhekous = new HashSet(0);
	private Set jiayouStationYuers = new HashSet(0);
	private Set proxies = new HashSet(0);
	private Set jiayouEmps = new HashSet(0);
	private Set jiayouPrinters = new HashSet(0);//打印机

	// Constructors

	

	/** default constructor */
	public JiayouStation() {
	}

	public Set getJiayouPrinters() {
		return jiayouPrinters;
	}

	public void setJiayouPrinters(Set jiayouPrinters) {
		this.jiayouPrinters = jiayouPrinters;
	}

	/** full constructor */
	public JiayouStation(Integer aid, String gname, String gaddress,
			String gcode, String gpicture, String gdescribe, Integer gstatus,
			String gzuobiaox, String gzuobiaoy, String uid, String token,
			Set jiayouZhekous, Set jiayouStationYuers, Set proxies,
			Set jiayouEmps) {
		this.aid = aid;
		this.gname = gname;
		this.gaddress = gaddress;
		this.gcode = gcode;
		this.gpicture = gpicture;
		this.gdescribe = gdescribe;
		this.gstatus = gstatus;
		this.gzuobiaox = gzuobiaox;
		this.gzuobiaoy = gzuobiaoy;
		this.uid = uid;
		this.token = token;
		this.jiayouZhekous = jiayouZhekous;
		this.jiayouStationYuers = jiayouStationYuers;
		this.proxies = proxies;
		this.jiayouEmps = jiayouEmps;
	}

	// Property accessors
	
	public Proxy getProxy() {
		return proxy;
	}

	public void setProxy(Proxy proxy) {
		this.proxy = proxy;
	}

	public Integer getGid() {
		return this.gid;
	}

	public void setGid(Integer gid) {
		this.gid = gid;
	}

	public Integer getAid() {
		return this.aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public String getGname() {
		return this.gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getGaddress() {
		return this.gaddress;
	}

	public void setGaddress(String gaddress) {
		this.gaddress = gaddress;
	}

	public String getGcode() {
		return this.gcode;
	}

	public void setGcode(String gcode) {
		this.gcode = gcode;
	}

	public String getGpicture() {
		return this.gpicture;
	}

	public void setGpicture(String gpicture) {
		this.gpicture = gpicture;
	}

	public String getGdescribe() {
		return this.gdescribe;
	}

	public void setGdescribe(String gdescribe) {
		this.gdescribe = gdescribe;
	}

	public Integer getGstatus() {
		return this.gstatus;
	}

	public void setGstatus(Integer gstatus) {
		this.gstatus = gstatus;
	}

	public String getGzuobiaox() {
		return this.gzuobiaox;
	}

	public void setGzuobiaox(String gzuobiaox) {
		this.gzuobiaox = gzuobiaox;
	}

	public String getGzuobiaoy() {
		return this.gzuobiaoy;
	}

	public void setGzuobiaoy(String gzuobiaoy) {
		this.gzuobiaoy = gzuobiaoy;
	}

	public String getUid() {
		return this.uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getToken() {
		return this.token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Set getJiayouZhekous() {
		return this.jiayouZhekous;
	}

	public void setJiayouZhekous(Set jiayouZhekous) {
		this.jiayouZhekous = jiayouZhekous;
	}

	public Set getJiayouStationYuers() {
		return this.jiayouStationYuers;
	}

	public void setJiayouStationYuers(Set jiayouStationYuers) {
		this.jiayouStationYuers = jiayouStationYuers;
	}

	public Set getProxies() {
		return this.proxies;
	}

	public void setProxies(Set proxies) {
		this.proxies = proxies;
	}

	public Set getJiayouEmps() {
		return this.jiayouEmps;
	}

	public void setJiayouEmps(Set jiayouEmps) {
		this.jiayouEmps = jiayouEmps;
	}

}