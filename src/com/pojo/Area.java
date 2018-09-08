package com.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * Area entity. @author MyEclipse Persistence Tools
 */

public class Area implements java.io.Serializable {

	// Fields

	//区县id
	private Integer arId;
	//城市
	private City city;
	//区县名称
	private String arName;
	
	private Set businesses = new HashSet(0);
	private Set proxies = new HashSet(0);

	// Constructors

	/** default constructor */
	public Area() {
	}

	/** minimal constructor */
	public Area(City city, String arName) {
		this.city = city;
		this.arName = arName;
	}

	/** full constructor */
	public Area(City city, String arName, Set businesses, Set proxies) {
		this.city = city;
		this.arName = arName;
		this.businesses = businesses;
		this.proxies = proxies;
	}

	// Property accessors

	public Integer getArId() {
		return this.arId;
	}

	public void setArId(Integer arId) {
		this.arId = arId;
	}

	public City getCity() {
		return this.city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public String getArName() {
		return this.arName;
	}

	public void setArName(String arName) {
		this.arName = arName;
	}

	public Set getBusinesses() {
		return this.businesses;
	}

	public void setBusinesses(Set businesses) {
		this.businesses = businesses;
	}

	public Set getProxies() {
		return this.proxies;
	}

	public void setProxies(Set proxies) {
		this.proxies = proxies;
	}

}