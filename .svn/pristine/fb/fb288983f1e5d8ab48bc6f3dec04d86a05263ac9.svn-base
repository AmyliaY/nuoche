package com.pojo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import org.hibernate.search.annotations.Analyzer;
import org.hibernate.search.annotations.DocumentId;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.IndexedEmbedded;
import org.hibernate.search.annotations.Store;

import net.paoding.analysis.analyzer.PaodingAnalyzer;

/**
 * Business entity. @author MyEclipse Persistence Tools
 */

@Analyzer(impl=PaodingAnalyzer.class)
@Indexed(index="business")
public class Business implements java.io.Serializable {

	public Business(Integer id, Proxy proxy, Area area, String openid, Float a1, Float a2, String b1, String b2, String shoptype,
			String shopname, String shoplogo, String shopaddr, String shopDesc, String realname, Short gender,
			String tel, Timestamp registtime, Short status, String email, Double longitude, Double latitude,
			Set services, Set serviceComments, Set sylbImageses, Set sylbRecords) {
		this.id=id;
		this.proxy = proxy;
		this.area = area;
		this.openid = openid;
		this.a1 = a1;
		this.a2 = a2;
		this.b1 = b1;
		this.b2 = b2;
		this.shoptype = shoptype;
		this.shopname = shopname;
		this.shoplogo = shoplogo;
		this.shopaddr = shopaddr;
		this.shopDesc = shopDesc;
		this.realname = realname;
		this.gender = gender;
		this.tel = tel;
		this.registtime = registtime;
		this.status = status;
		this.email = email;
		this.longitude = longitude;
		this.latitude = latitude;
		this.services = services;
		this.serviceComments = serviceComments;
		this.sylbImageses = sylbImageses;
		this.sylbRecords = sylbRecords;
	}
	
	// Fields
	@DocumentId
	//主键，自增
	private Integer id;
	//代理
	private Proxy proxy;
	//所在区域
	private Area area;
	//微信号
	private String openid;
	
	private Float a1;
	private Float a2;
	private String b1;
	private String b2;
	
	//商家类型
	@Field(index=Index.TOKENIZED,store=Store.YES)
	private String shoptype;
	
	//商家名
	@Field(index=Index.TOKENIZED,store=Store.YES)
	private String shopname;
	//商家图标
	private String shoplogo;
	//商家地址
	private String shopaddr;
	
	//商家详细描述
	@Field(index=Index.TOKENIZED,store=Store.YES)
	private String shopDesc;
	
	//真实姓名
	private String realname;
	//性别
	private Short gender;
	//电话
	private String tel;
	//注册时间
	private Timestamp registtime;
	//状态：0关闭，1打开
	private Short status;
	//邮箱
	private String email;
	//经度
	private Double longitude;
	//维度
	private Double latitude;
	
	@IndexedEmbedded(depth=3)
	private Set<Service> services = new HashSet<Service>(0);
	
	private Set serviceComments = new HashSet(0);
	private Set sylbImageses = new HashSet(0);
	private Set sylbRecords = new HashSet(0);

	// Constructors

	/** default constructor */
	public Business() {
	}

	/** full constructor */
	public Business(Proxy proxy, Area area, String openid, Float a1, Float a2, String b1, String b2, String shoptype,
			String shopname, String shoplogo, String shopaddr, String shopDesc, String realname, Short gender,
			String tel, Timestamp registtime, Short status, String email, Double longitude, Double latitude,
			Set services, Set serviceComments, Set sylbImageses, Set sylbRecords) {
		this.proxy = proxy;
		this.area = area;
		this.openid = openid;
		this.a1 = a1;
		this.a2 = a2;
		this.b1 = b1;
		this.b2 = b2;
		this.shoptype = shoptype;
		this.shopname = shopname;
		this.shoplogo = shoplogo;
		this.shopaddr = shopaddr;
		this.shopDesc = shopDesc;
		this.realname = realname;
		this.gender = gender;
		this.tel = tel;
		this.registtime = registtime;
		this.status = status;
		this.email = email;
		this.longitude = longitude;
		this.latitude = latitude;
		this.services = services;
		this.serviceComments = serviceComments;
		this.sylbImageses = sylbImageses;
		this.sylbRecords = sylbRecords;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Proxy getProxy() {
		return this.proxy;
	}

	public void setProxy(Proxy proxy) {
		this.proxy = proxy;
	}

	public Area getArea() {
		return this.area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public String getOpenid() {
		return this.openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
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

	public String getShoptype() {
		return this.shoptype;
	}

	public void setShoptype(String shoptype) {
		this.shoptype = shoptype;
	}

	public String getShopname() {
		return this.shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public String getShoplogo() {
		return this.shoplogo;
	}

	public void setShoplogo(String shoplogo) {
		this.shoplogo = shoplogo;
	}

	public String getShopaddr() {
		return this.shopaddr;
	}

	public void setShopaddr(String shopaddr) {
		this.shopaddr = shopaddr;
	}

	public String getShopDesc() {
		return this.shopDesc;
	}

	public void setShopDesc(String shopDesc) {
		this.shopDesc = shopDesc;
	}

	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public Short getGender() {
		return this.gender;
	}

	public void setGender(Short gender) {
		this.gender = gender;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Timestamp getRegisttime() {
		return this.registtime;
	}

	public void setRegisttime(Timestamp registtime) {
		this.registtime = registtime;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Double getLongitude() {
		return this.longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Double getLatitude() {
		return this.latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Set getServices() {
		return this.services;
	}

	public void setServices(Set services) {
		this.services = services;
	}

	public Set getServiceComments() {
		return this.serviceComments;
	}

	public void setServiceComments(Set serviceComments) {
		this.serviceComments = serviceComments;
	}

	public Set getSylbImageses() {
		return this.sylbImageses;
	}

	public void setSylbImageses(Set sylbImageses) {
		this.sylbImageses = sylbImageses;
	}

	public Set getSylbRecords() {
		return this.sylbRecords;
	}

	public void setSylbRecords(Set sylbRecords) {
		this.sylbRecords = sylbRecords;
	}

}