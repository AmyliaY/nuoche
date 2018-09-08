package com.pojo;

import java.sql.Timestamp;


/**
 * Shoppingcat entity. @author MyEclipse Persistence Tools
 */

public class Shoppingcat  implements java.io.Serializable {


    // Fields    

     private Integer scatId;
     private Userinfo userinfo;
     private Goods goods;
     private Integer scatNum;
     private Timestamp scatTime;

     //折扣
     private float zhekou;

    // Constructors

    public float getZhekou() {
		return zhekou;
	}

	public void setZhekou(float zhekou) {
		this.zhekou = zhekou;
	}

	/** default constructor */
    public Shoppingcat() {
    }

	/** minimal constructor */
    public Shoppingcat(Userinfo userinfo, Goods goods, Integer scatNum) {
        this.userinfo = userinfo;
        this.goods = goods;
        this.scatNum = scatNum;
    }
    
    /** full constructor */
    public Shoppingcat(Userinfo userinfo, Goods goods, Integer scatNum, Timestamp scatTime) {
        this.userinfo = userinfo;
        this.goods = goods;
        this.scatNum = scatNum;
        this.scatTime = scatTime;
    }

   
    // Property accessors

    public Integer getScatId() {
        return this.scatId;
    }
    
    public void setScatId(Integer scatId) {
        this.scatId = scatId;
    }

    public Userinfo getUserinfo() {
        return this.userinfo;
    }
    
    public void setUserinfo(Userinfo userinfo) {
        this.userinfo = userinfo;
    }

    public Goods getGoods() {
        return this.goods;
    }
    
    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public Integer getScatNum() {
        return this.scatNum;
    }
    
    public void setScatNum(Integer scatNum) {
        this.scatNum = scatNum;
    }

    public Timestamp getScatTime() {
        return this.scatTime;
    }
    
    public void setScatTime(Timestamp scatTime) {
        this.scatTime = scatTime;
    }
   








}