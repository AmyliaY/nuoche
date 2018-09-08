package com.pojo;

import java.sql.Timestamp;


/**
 * Goodsimages entity. @author MyEclipse Persistence Tools
 */

public class Goodsimages  implements java.io.Serializable {


    // Fields    

     private Integer gimgId;
     private Goods goods;
     private String gimages;
     private Integer gimgStatus;
     private String gimgDetail;
     private Timestamp gimgTime;
     private Integer   index;


    // Constructors

    public Integer getIndex() {
		return index;
	}

	public void setIndex(Integer index) {
		this.index = index;
	}

	/** default constructor */
    public Goodsimages() {
    }

	/** minimal constructor */
    public Goodsimages(Goods goods, String gimages, Integer gimgStatus) {
        this.goods = goods;
        this.gimages = gimages;
        this.gimgStatus = gimgStatus;
    }
    
    /** full constructor */
    public Goodsimages(Goods goods, String gimages, Integer gimgStatus, String gimgDetail, Timestamp gimgTime) {
        this.goods = goods;
        this.gimages = gimages;
        this.gimgStatus = gimgStatus;
        this.gimgDetail = gimgDetail;
        this.gimgTime = gimgTime;
    }

   
    // Property accessors

    public Integer getGimgId() {
        return this.gimgId;
    }
    
    public void setGimgId(Integer gimgId) {
        this.gimgId = gimgId;
    }

    public Goods getGoods() {
        return this.goods;
    }
    
    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public String getGimages() {
        return this.gimages;
    }
    
    public void setGimages(String gimages) {
        this.gimages = gimages;
    }

    public Integer getGimgStatus() {
        return this.gimgStatus;
    }
    
    public void setGimgStatus(Integer gimgStatus) {
        this.gimgStatus = gimgStatus;
    }

    public String getGimgDetail() {
        return this.gimgDetail;
    }
    
    public void setGimgDetail(String gimgDetail) {
        this.gimgDetail = gimgDetail;
    }

    public Timestamp getGimgTime() {
        return this.gimgTime;
    }
    
    public void setGimgTime(Timestamp gimgTime) {
        this.gimgTime = gimgTime;
    }
   








}