package com.souvc.weixin.pojo;

public class WeixinUserInfo {

	    //用户表示,加密后的用户的真实微信号
	   private String openId;
	    //关注状态(1.关注 2.未关注)
		private int subscribe;
		//用户关注时间 ,为时间戳 ,如果用户多次关注,则去最后依次关注时间
		private String subscribeTime;
		//昵称
		private String nickname;
		//用户性别(1.男    2.女    0.性别未知)
		private int sex;
		//用户所在国家
		private String country;
		//用户所在省份
		private String province;
		//所在城市
		private String city;
		//用户所用语言
		private String language;
		//用户头像
		private String headImgUrl;
	public String getOpenId() {
		return openId;
	}
	public void setOpenId(String openId) {
		this.openId = openId;
	}
	public int getSubscribe() {
		return subscribe;
	}
	public void setSubscribe(int subscribe) {
		this.subscribe = subscribe;
	}
	public String getSubscribeTime() {
		return subscribeTime;
	}
	public void setSubscribeTime(String subscribeTime) {
		this.subscribeTime = subscribeTime;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getHeadImgUrl() {
		return headImgUrl;
	}
	public void setHeadImgUrl(String headImgUrl) {
		this.headImgUrl = headImgUrl;
	}
	
	
	
	
}
