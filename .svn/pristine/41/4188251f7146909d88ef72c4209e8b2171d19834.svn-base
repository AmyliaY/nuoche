package com.pojo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import org.hibernate.search.annotations.Analyzer;
import org.hibernate.search.annotations.ContainedIn;
import org.hibernate.search.annotations.DocumentId;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.IndexedEmbedded;
import org.hibernate.search.annotations.Store;

import net.paoding.analysis.analyzer.PaodingAnalyzer;

/**
 * Service entity. @author MyEclipse Persistence Tools
 */

@Analyzer(impl=PaodingAnalyzer.class)
@Indexed(index="services")
public class Service implements java.io.Serializable {

	// Fields

	//主键自增
	@DocumentId
	private Integer id;
	
	//服务类型
	@IndexedEmbedded(depth=3)
	private ServiceType serviceType;
	
	//所属商家
	@ContainedIn
	private Business business;
	
	//标题
	@Field(index=Index.TOKENIZED,store=Store.YES)
	private String title;
	
	//详细描述
	@Field(index=Index.TOKENIZED,store=Store.YES)
	private String serviceDesc;
	//市场价格
	private Double shichangPrice;
	//预约价格
	private Double yuyuePrice;
	//图片
	private String image;
	//累计预约次数
	private Integer num;
	//评论数
	private Integer pinglunNum;
	//服务所需时间
	private Integer time;
	//状态，1上架，2下架，3逻辑删除
	private Short status;
	//状态，-1未置顶(初始状态)，0未置顶或过期置顶，1已置顶
	private Short isZhiding = -1;
	//创建时间
	private Timestamp created;
	//更新时间
	private Timestamp updated;
	//过期时间
	private Timestamp overtime;
	//平均分
	private Short score;
	
	private Set tops = new HashSet(0);
	private Set yuyues = new HashSet(0);
	private Set sylbImageses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Service() {
	}

	/** full constructor */
	public Service(ServiceType serviceType, Business business, String title, String serviceDesc, Double shichangPrice,
			Double yuyuePrice, String image, Integer num, Integer pinglunNum, Integer time, Short status,
			Short isZhiding, Timestamp created, Timestamp updated, Timestamp overtime, Short score, Set tops,
			Set yuyues, Set sylbImageses) {
		this.serviceType = serviceType;
		this.business = business;
		this.title = title;
		this.serviceDesc = serviceDesc;
		this.shichangPrice = shichangPrice;
		this.yuyuePrice = yuyuePrice;
		this.image = image;
		this.num = num;
		this.pinglunNum = pinglunNum;
		this.time = time;
		this.status = status;
		this.isZhiding = isZhiding;
		this.created = created;
		this.updated = updated;
		this.overtime = overtime;
		this.score = score;
		this.tops = tops;
		this.yuyues = yuyues;
		this.sylbImageses = sylbImageses;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public ServiceType getServiceType() {
		return this.serviceType;
	}

	public void setServiceType(ServiceType serviceType) {
		this.serviceType = serviceType;
	}

	public Business getBusiness() {
		return this.business;
	}

	public void setBusiness(Business business) {
		this.business = business;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getServiceDesc() {
		return this.serviceDesc;
	}

	public void setServiceDesc(String serviceDesc) {
		this.serviceDesc = serviceDesc;
	}

	public Double getShichangPrice() {
		return this.shichangPrice;
	}

	public void setShichangPrice(Double shichangPrice) {
		this.shichangPrice = shichangPrice;
	}

	public Double getYuyuePrice() {
		return this.yuyuePrice;
	}

	public void setYuyuePrice(Double yuyuePrice) {
		this.yuyuePrice = yuyuePrice;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Integer getNum() {
		return this.num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Integer getPinglunNum() {
		return this.pinglunNum;
	}

	public void setPinglunNum(Integer pinglunNum) {
		this.pinglunNum = pinglunNum;
	}

	public Integer getTime() {
		return this.time;
	}

	public void setTime(Integer time) {
		this.time = time;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public Short getIsZhiding() {
		return this.isZhiding;
	}

	public void setIsZhiding(Short isZhiding) {
		this.isZhiding = isZhiding;
	}

	public Timestamp getCreated() {
		return this.created;
	}

	public void setCreated(Timestamp created) {
		this.created = created;
	}

	public Timestamp getUpdated() {
		return this.updated;
	}

	public void setUpdated(Timestamp updated) {
		this.updated = updated;
	}

	public Timestamp getOvertime() {
		return this.overtime;
	}

	public void setOvertime(Timestamp overtime) {
		this.overtime = overtime;
	}

	public Short getScore() {
		return this.score;
	}

	public void setScore(Short score) {
		this.score = score;
	}

	public Set getTops() {
		return this.tops;
	}

	public void setTops(Set tops) {
		this.tops = tops;
	}

	public Set getYuyues() {
		return this.yuyues;
	}

	public void setYuyues(Set yuyues) {
		this.yuyues = yuyues;
	}

	public Set getSylbImageses() {
		return this.sylbImageses;
	}

	public void setSylbImageses(Set sylbImageses) {
		this.sylbImageses = sylbImageses;
	}

}