package com.pojo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;


/**
 * Address entity. @author MyEclipse Persistence Tools
 */

public class Address  implements java.io.Serializable {


    // Fields    

     private Integer adId;
     private Userinfo userinfo;
     private Area area;
     private String adDetail;
     private String adPhone;
     private String adName;
     private Integer adStatus;
     private Timestamp adTime;
     private Integer adExist;
     private Set goodsorderses = new HashSet(0);


    // Constructors

    /** default constructor */
    public Address() {
    }

	/** minimal constructor */
    public Address(Userinfo userinfo, Area area, Integer adStatus) {
        this.userinfo = userinfo;
        this.area = area;
        this.adStatus = adStatus;
    }
    
    /** full constructor */
    public Address(Userinfo userinfo, Area area, String adDetail, String adPhone, String adName, Integer adStatus, Timestamp adTime, Set goodsorderses) {
        this.userinfo = userinfo;
        this.area = area;
        this.adDetail = adDetail;
        this.adPhone = adPhone;
        this.adName = adName;
        this.adStatus = adStatus;
        this.adTime = adTime;
        this.goodsorderses = goodsorderses;
    }

   
    // Property accessors

    public Integer getAdId() {
        return this.adId;
    }
    
    public void setAdId(Integer adId) {
        this.adId = adId;
    }

    public Userinfo getUserinfo() {
        return this.userinfo;
    }
    
    public void setUserinfo(Userinfo userinfo) {
        this.userinfo = userinfo;
    }

    public Area getArea() {
        return this.area;
    }
    
    public void setArea(Area area) {
        this.area = area;
    }

    public String getAdDetail() {
        return this.adDetail;
    }
    
    public void setAdDetail(String adDetail) {
        this.adDetail = adDetail;
    }

    public String getAdPhone() {
        return this.adPhone;
    }
    
    public void setAdPhone(String adPhone) {
        this.adPhone = adPhone;
    }

    public String getAdName() {
        return this.adName;
    }
    
    public void setAdName(String adName) {
        this.adName = adName;
    }

    public Integer getAdStatus() {
        return this.adStatus;
    }
    
    public void setAdStatus(Integer adStatus) {
        this.adStatus = adStatus;
    }

    public Timestamp getAdTime() {
        return this.adTime;
    }
    
    public void setAdTime(Timestamp adTime) {
        this.adTime = adTime;
    }

    public Set getGoodsorderses() {
        return this.goodsorderses;
    }
    
    public void setGoodsorderses(Set goodsorderses) {
        this.goodsorderses = goodsorderses;
    }

	public Integer getAdExist() {
		return adExist;
	}

	public void setAdExist(Integer adExist) {
		this.adExist = adExist;
	}
   








}