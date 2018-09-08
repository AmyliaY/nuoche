package com.pojo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	//主键自增
	private Integer id;
	//操作的管理员
	private Admin admin;
	//所属代理
	private Proxy proxy;  //1级代理
	private Proxy proxy2; //2级代理
	private Proxy proxy3; //3级代理
	
	public Proxy getProxy2() {
		return proxy2;
	}

	public void setProxy2(Proxy proxy2) {
		this.proxy2 = proxy2;
	}

	public Proxy getProxy3() {
		return proxy3;
	}

	public void setProxy3(Proxy proxy3) {
		this.proxy3 = proxy3;
	}

	//外键，关联weixinUser的openid
	private WeixinUser weixinUser;
	//车牌号
	private String plateNumber;
	//二维码
	private String qrcode;
	//微信头像
	private String headimage;
	//-1未生成二维码，0未付款，1已付款未绑定，2已付款已绑定，3过期
	private Short overdue;
	//姓名
	private String name;
	//性别
	private Short sex;
	//详细地址
	private String address;
	//是否关注微信号，0未关注，1已关注
	private Short role;
	//挪别人车次数
	private Integer frequency;
	//被别人挪车次数
	private Integer beinuoche;
	//电话
	private String tel;
	//推荐人id,也是user的id
	private Integer tuijianren;
	//二维码过期时间
	private Timestamp overdueTime;
	//可提现
	private Double ketixian;
	//已提现
	private Double yitixian;
	//未提现
	private Double weitixian;
	//车牌前缀
	private String chepaiqianzhui;
	//
	private Float a1;
	private Float a2;
	private String b1;
	private String b2;
	//创建时间
	private Timestamp created;
	//代理领卡时间
	private Timestamp takeTime;
	private Set vipCashs = new HashSet(0);
	private Set userxufeis = new HashSet(0);
	private Set comments = new HashSet(0);
	private Set serviceComments = new HashSet(0);
	private Set movecarsForCar = new HashSet(0);
	private Set movecarsForUser = new HashSet(0);
	private Set yuyues = new HashSet(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** full constructor */
	public User(Admin admin, Proxy proxy, WeixinUser weixinUser, String plateNumber, String qrcode, String headimage,
			Short overdue, String name, Short sex, String address, Short role, Integer frequency, Integer beinuoche,
			String tel, Integer tuijianren, Timestamp overdueTime, Double ketixian, Double yitixian, Double weitixian,
			String chepaiqianzhui, Float a1, Float a2, String b1, String b2, Timestamp created, Timestamp takeTime,
			Set vipCashs, Set userxufeis, Set comments, Set serviceComments, Set movecarsForCar, Set movecarsForUser,
			Set yuyues) {
		this.admin = admin;
		this.proxy = proxy;
		this.weixinUser = weixinUser;
		this.plateNumber = plateNumber;
		this.qrcode = qrcode;
		this.headimage = headimage;
		this.overdue = overdue;
		this.name = name;
		this.sex = sex;
		this.address = address;
		this.role = role;
		this.frequency = frequency;
		this.beinuoche = beinuoche;
		this.tel = tel;
		this.tuijianren = tuijianren;
		this.overdueTime = overdueTime;
		this.ketixian = ketixian;
		this.yitixian = yitixian;
		this.weitixian = weitixian;
		this.chepaiqianzhui = chepaiqianzhui;
		this.a1 = a1;
		this.a2 = a2;
		this.b1 = b1;
		this.b2 = b2;
		this.created = created;
		this.takeTime = takeTime;
		this.vipCashs = vipCashs;
		this.userxufeis = userxufeis;
		this.comments = comments;
		this.serviceComments = serviceComments;
		this.movecarsForCar = movecarsForCar;
		this.movecarsForUser = movecarsForUser;
		this.yuyues = yuyues;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Admin getAdmin() {
		return this.admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public Proxy getProxy() {
		return this.proxy;
	}

	public void setProxy(Proxy proxy) {
		this.proxy = proxy;
	}

	public WeixinUser getWeixinUser() {
		return this.weixinUser;
	}

	public void setWeixinUser(WeixinUser weixinUser) {
		this.weixinUser = weixinUser;
	}

	public String getPlateNumber() {
		return this.plateNumber;
	}

	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}

	public String getQrcode() {
		return this.qrcode;
	}

	public void setQrcode(String qrcode) {
		this.qrcode = qrcode;
	}

	public String getHeadimage() {
		return this.headimage;
	}

	public void setHeadimage(String headimage) {
		this.headimage = headimage;
	}

	public Short getOverdue() {
		return this.overdue;
	}

	public void setOverdue(Short overdue) {
		this.overdue = overdue;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Short getSex() {
		return this.sex;
	}

	public void setSex(Short sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Short getRole() {
		return this.role;
	}

	public void setRole(Short role) {
		this.role = role;
	}

	public Integer getFrequency() {
		return this.frequency;
	}

	public void setFrequency(Integer frequency) {
		this.frequency = frequency;
	}

	public Integer getBeinuoche() {
		return this.beinuoche;
	}

	public void setBeinuoche(Integer beinuoche) {
		this.beinuoche = beinuoche;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Integer getTuijianren() {
		return this.tuijianren;
	}

	public void setTuijianren(Integer tuijianren) {
		this.tuijianren = tuijianren;
	}

	public Timestamp getOverdueTime() {
		return this.overdueTime;
	}

	public void setOverdueTime(Timestamp overdueTime) {
		this.overdueTime = overdueTime;
	}

	public Double getKetixian() {
		return this.ketixian;
	}

	public void setKetixian(Double ketixian) {
		this.ketixian = ketixian;
	}

	public Double getYitixian() {
		return this.yitixian;
	}

	public void setYitixian(Double yitixian) {
		this.yitixian = yitixian;
	}

	public Double getWeitixian() {
		return this.weitixian;
	}

	public void setWeitixian(Double weitixian) {
		this.weitixian = weitixian;
	}

	public String getChepaiqianzhui() {
		return this.chepaiqianzhui;
	}

	public void setChepaiqianzhui(String chepaiqianzhui) {
		this.chepaiqianzhui = chepaiqianzhui;
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

	public Timestamp getCreated() {
		return this.created;
	}

	public void setCreated(Timestamp created) {
		this.created = created;
	}

	public Timestamp getTakeTime() {
		return this.takeTime;
	}

	public void setTakeTime(Timestamp takeTime) {
		this.takeTime = takeTime;
	}

	public Set getVipCashs() {
		return this.vipCashs;
	}

	public void setVipCashs(Set vipCashs) {
		this.vipCashs = vipCashs;
	}

	public Set getUserxufeis() {
		return this.userxufeis;
	}

	public void setUserxufeis(Set userxufeis) {
		this.userxufeis = userxufeis;
	}

	public Set getComments() {
		return this.comments;
	}

	public void setComments(Set comments) {
		this.comments = comments;
	}

	public Set getServiceComments() {
		return this.serviceComments;
	}

	public void setServiceComments(Set serviceComments) {
		this.serviceComments = serviceComments;
	}

	public Set getMovecarsForCar() {
		return this.movecarsForCar;
	}

	public void setMovecarsForCar(Set movecarsForCar) {
		this.movecarsForCar = movecarsForCar;
	}

	public Set getMovecarsForUser() {
		return this.movecarsForUser;
	}

	public void setMovecarsForUser(Set movecarsForUser) {
		this.movecarsForUser = movecarsForUser;
	}

	public Set getYuyues() {
		return this.yuyues;
	}

	public void setYuyues(Set yuyues) {
		this.yuyues = yuyues;
	}

}