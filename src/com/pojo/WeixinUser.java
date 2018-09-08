package com.pojo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * WeixinUser entity. @author MyEclipse Persistence Tools
 */

public class WeixinUser implements java.io.Serializable {

	// Fields

	//用户微信号
	private String openid;
	//唯一对应于微信号的int类型标识
	private Integer tjr;
	//状态，0未关注，1关注
	private Short status;
	//昵称
	private String nickname;
	//头像
	private String headimage;
	
	private String tuijianren; //推荐人
	private String wxtel; //电话
	private Userinfo userinfo;
	private Integer  timeLeft; //剩余分钟

	//数据库中还示加入--lgh
	private Integer sex;
	private String language;
	private String city;
	private String province;
	private String country;
	private String headimgurl;
	private Integer subscribeTime;
	private Integer subscribe;
	
	
	//保险专用 
	private String sfz; //身份证
	private String name; //身份证上面姓名
	private Date   time; //车辆初登日期
	private String cejiahao; //车架号
	private String fadonjihao; //发动机号
	private String cepai; //车牌
	
	private Date   lastJiayouTime;//最近加油时间
	
	private JiayouStation  jiayouStation;//所属加油站
	
	private Vip vip; //是否VIP
	
	private Float totalJiayouMoney; //累计加油
	
	
	
	

	
	public Float getTotalJiayouMoney() {
		return totalJiayouMoney;
	}

	public void setTotalJiayouMoney(Float totalJiayouMoney) {
		this.totalJiayouMoney = totalJiayouMoney;
	}

	public Vip getVip() {
		return vip;
	}

	public void setVip(Vip vip) {
		this.vip = vip;
	}

	public JiayouStation getJiayouStation() {
		return jiayouStation;
	}

	public void setJiayouStation(JiayouStation jiayouStation) {
		this.jiayouStation = jiayouStation;
	}

	public Date getLastJiayouTime() {
		return lastJiayouTime;
	}

	public void setLastJiayouTime(Date lastJiayouTime) {
		this.lastJiayouTime = lastJiayouTime;
	}

	public String getSfz() {
		return sfz;
	}

	public void setSfz(String sfz) {
		this.sfz = sfz;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getCejiahao() {
		return cejiahao;
	}

	public void setCejiahao(String cejiahao) {
		this.cejiahao = cejiahao;
	}

	public String getFadonjihao() {
		return fadonjihao;
	}

	public void setFadonjihao(String fadonjihao) {
		this.fadonjihao = fadonjihao;
	}

	public String getCepai() {
		return cepai;
	}

	public void setCepai(String cepai) {
		this.cepai = cepai;
	}

	public Integer getTimeLeft() {
		return timeLeft;
	}

	public void setTimeLeft(Integer timeLeft) {
		this.timeLeft = timeLeft;
	}

	
	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getHeadimgurl() {
		return headimgurl;
	}

	public void setHeadimgurl(String headimgurl) {
		this.headimgurl = headimgurl;
	}

	public Integer getSubscribeTime() {
		return subscribeTime;
	}

	public void setSubscribeTime(Integer subscribeTime) {
		this.subscribeTime = subscribeTime;
	}

	public Integer getSubscribe() {
		return subscribe;
	}

	public void setSubscribe(Integer subscribe) {
		this.subscribe = subscribe;
	}

	public Userinfo getUserinfo() {
		return userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public String getWxtel() {
		return wxtel;
	}

	public void setWxtel(String wxtel) {
		this.wxtel = wxtel;
	}

	private Set movecars = new HashSet(0);
	private Set applydetails = new HashSet(0);
	private Set yuyues = new HashSet(0);
	private Set users = new HashSet(0);

	// Constructors

	/** default constructor */
	public WeixinUser() {
	}

	/** minimal constructor */
	public WeixinUser(String openid) {
		this.openid = openid;
	}

	/** full constructor */
	public WeixinUser(String openid, Integer tjr, Short status,
			String nickname, String headimage, String tuijianren, Set movecars,
			Set applydetails, Set yuyues, Set users) {
		this.openid = openid;
		this.tjr = tjr;
		this.status = status;
		this.nickname = nickname;
		this.headimage = headimage;
		this.tuijianren = tuijianren;
		this.movecars = movecars;
		this.applydetails = applydetails;
		this.yuyues = yuyues;
		this.users = users;
	}

	// Property accessors

	public String getOpenid() {
		return this.openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public Integer getTjr() {
		return this.tjr;
	}

	public void setTjr(Integer tjr) {
		this.tjr = tjr;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public String getNickname() {
		return this.nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getHeadimage() {
		return this.headimage;
	}

	public void setHeadimage(String headimage) {
		this.headimage = headimage;
	}

	public String getTuijianren() {
		return this.tuijianren;
	}

	public void setTuijianren(String tuijianren) {
		this.tuijianren = tuijianren;
	}

	public Set getMovecars() {
		return this.movecars;
	}

	public void setMovecars(Set movecars) {
		this.movecars = movecars;
	}

	public Set getApplydetails() {
		return this.applydetails;
	}

	public void setApplydetails(Set applydetails) {
		this.applydetails = applydetails;
	}

	public Set getYuyues() {
		return this.yuyues;
	}

	public void setYuyues(Set yuyues) {
		this.yuyues = yuyues;
	}

	public Set getUsers() {
		return this.users;
	}

	public void setUsers(Set users) {
		this.users = users;
	}

}