package com.weixin.pojo;

/**
 * 微信推荐人用于页面显示json
 * @author tjx
 *
 */
public class Referrers {

	private String nickname;
	private String headimgurl;
	private String phone;
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getHeadimgurl() {
		return headimgurl;
	}
	public void setHeadimgurl(String headimgurl) {
		this.headimgurl = headimgurl;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
