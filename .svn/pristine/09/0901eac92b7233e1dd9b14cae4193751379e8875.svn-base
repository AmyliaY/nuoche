package com.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * City entity. @author MyEclipse Persistence Tools
 */

public class City implements java.io.Serializable {

	// Fields

	//城市id
	private Integer ctId;
	//省份
	private Province province;
	//城市名称
	private String ctName;
	//通用费用
	private Double ctYunfei;
	//地区运费
	private Double cityYunfei;
	
	private Set areas = new HashSet(0);

	// Constructors

	/** default constructor */
	public City() {
	}

	/** minimal constructor */
	public City(Province province, String ctName) {
		this.province = province;
		this.ctName = ctName;
	}

	/** full constructor */
	public City(Province province, String ctName, Double ctYunfei, Double cityYunfei, Set areas) {
		this.province = province;
		this.ctName = ctName;
		this.ctYunfei = ctYunfei;
		this.cityYunfei = cityYunfei;
		this.areas = areas;
	}

	// Property accessors

	public Integer getCtId() {
		return this.ctId;
	}

	public void setCtId(Integer ctId) {
		this.ctId = ctId;
	}

	public Province getProvince() {
		return this.province;
	}

	public void setProvince(Province province) {
		this.province = province;
	}

	public String getCtName() {
		return this.ctName;
	}

	public void setCtName(String ctName) {
		this.ctName = ctName;
	}

	public Double getCtYunfei() {
		return this.ctYunfei;
	}

	public void setCtYunfei(Double ctYunfei) {
		this.ctYunfei = ctYunfei;
	}

	public Double getCityYunfei() {
		return this.cityYunfei;
	}

	public void setCityYunfei(Double cityYunfei) {
		this.cityYunfei = cityYunfei;
	}

	public Set getAreas() {
		return this.areas;
	}

	public void setAreas(Set areas) {
		this.areas = areas;
	}

}