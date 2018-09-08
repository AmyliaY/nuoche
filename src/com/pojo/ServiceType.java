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
import org.hibernate.search.annotations.Store;

import net.paoding.analysis.analyzer.PaodingAnalyzer;

/**
 * ServiceType entity. @author MyEclipse Persistence Tools
 */

@Analyzer(impl=PaodingAnalyzer.class)
@Indexed(index="serviceType")
public class ServiceType implements java.io.Serializable {

	// Fields

	//主键自增
	@DocumentId
	private Integer id;
	
	//类目名称
	@Field(index=Index.TOKENIZED,store=Store.YES)
	private String name;
	//状态，1正常，2删除
	private Short status;
	//排列序号
	private Integer sortOrder;
	//创建时间
	private Timestamp created;
	//更新时间
	private Timestamp updated;
	
	private Float a1;
	private Float a2;
	private String b1;
	private String b2;
	
	@ContainedIn
	private Set services = new HashSet(0);

	// Constructors

	/** default constructor */
	public ServiceType() {
	}

	/** full constructor */
	public ServiceType(String name, Short status, Integer sortOrder, Timestamp created, Timestamp updated, Float a1,
			Float a2, String b1, String b2, Set services) {
		this.name = name;
		this.status = status;
		this.sortOrder = sortOrder;
		this.created = created;
		this.updated = updated;
		this.a1 = a1;
		this.a2 = a2;
		this.b1 = b1;
		this.b2 = b2;
		this.services = services;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public Integer getSortOrder() {
		return this.sortOrder;
	}

	public void setSortOrder(Integer sortOrder) {
		this.sortOrder = sortOrder;
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

	public Set getServices() {
		return this.services;
	}

	public void setServices(Set services) {
		this.services = services;
	}

}