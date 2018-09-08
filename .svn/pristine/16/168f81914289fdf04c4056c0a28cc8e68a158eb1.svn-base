package com.pojo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;


/**
 * Goodsorders entity. @author MyEclipse Persistence Tools
 */

public class Goodsorders  implements java.io.Serializable {


    // Fields    

     private Integer orId;//主键 
     private Userinfo userinfo; //用户
     private Zitiaddress zitiaddress; //自提地址
     private PeisongCorp peisongcorp; //配送公司
     private Address address; //收货地址
     private Timestamp orTime;//下单时间
     
     private Integer orStatus; //订单状态 
     private Double orPrice;//总金额 = 运费+积分+第三方
     private Double orYunfei;//运费
     private String orRemark;//备注
     private Integer orTotalnum;//数量
     private String orOrdernumber;	//订单号
     private Integer orPaytype;//支付类型  0支付宝 1微信
     private Double orThreepay; //第三方支付金额 
     private Double orJifen; //使用了多少积分
     private String orRecipient; //配送单号
     private Integer orPeisongtype; //配送方式 0：自提1：快题2：送货上门
     private Double orShoppingzhekou;
     private Integer orExist;	//会员是否已删除 0：未 1：已
     public Integer getOrExist() {
		return orExist;
	 }

	public void setOrExist(Integer orExist) {
		this.orExist = orExist;
	}

	private Set goodsorderdetails = new HashSet(0);
     private Set goodsreturns = new HashSet(0);


    // Constructors

    /** default constructor */
    public Goodsorders() {
    }

	/** minimal constructor */
    public Goodsorders(Userinfo userinfo, Address address, Integer orStatus, Double orPrice, Double orYunfei, Integer orTotalnum, String orOrdernumber, Integer orPeisongtype) {
        this.userinfo = userinfo;
        this.address = address;
        this.orStatus = orStatus;
        this.orPrice = orPrice;
        this.orYunfei = orYunfei;
        this.orTotalnum = orTotalnum;
        this.orOrdernumber = orOrdernumber;
        this.orPeisongtype = orPeisongtype;
    }
    
    /** full constructor */
    public Goodsorders(Userinfo userinfo, Zitiaddress zitiaddress, PeisongCorp peisongcorp, Address address, Timestamp orTime, Integer orStatus, Double orPrice, Double orYunfei, String orRemark, Integer orTotalnum, String orOrdernumber, Integer orPaytype, Double orThreepay, Double orJifen, String orRecipient, Integer orPeisongtype, Double orShoppingzhekou, Set goodsorderdetails, Set goodsreturns) {
        this.userinfo = userinfo;
        this.zitiaddress = zitiaddress;
        this.peisongcorp = peisongcorp;
        this.address = address;
        this.orTime = orTime;
        this.orStatus = orStatus;
        this.orPrice = orPrice;
        this.orYunfei = orYunfei;
        this.orRemark = orRemark;
        this.orTotalnum = orTotalnum;
        this.orOrdernumber = orOrdernumber;
        this.orPaytype = orPaytype;
        this.orThreepay = orThreepay;
        this.orJifen = orJifen;
        this.orRecipient = orRecipient;
        this.orPeisongtype = orPeisongtype;
        this.orShoppingzhekou = orShoppingzhekou;
        this.goodsorderdetails = goodsorderdetails;
        this.goodsreturns = goodsreturns;
    }

   
    // Property accessors

    public Integer getOrId() {
        return this.orId;
    }
    
    public void setOrId(Integer orId) {
        this.orId = orId;
    }

    public Userinfo getUserinfo() {
        return this.userinfo;
    }
    
    public void setUserinfo(Userinfo userinfo) {
        this.userinfo = userinfo;
    }

    public Zitiaddress getZitiaddress() {
        return this.zitiaddress;
    }
    
    public void setZitiaddress(Zitiaddress zitiaddress) {
        this.zitiaddress = zitiaddress;
    }

    public PeisongCorp getPeisongcorp() {
        return this.peisongcorp;
    }
    
    public void setPeisongcorp(PeisongCorp peisongcorp) {
        this.peisongcorp = peisongcorp;
    }

    public Address getAddress() {
        return this.address;
    }
    
    public void setAddress(Address address) {
        this.address = address;
    }

    public Timestamp getOrTime() {
        return this.orTime;
    }
    
    public void setOrTime(Timestamp orTime) {
        this.orTime = orTime;
    }

    public Integer getOrStatus() {
        return this.orStatus;
    }
    
    public void setOrStatus(Integer orStatus) {
        this.orStatus = orStatus;
    }

    public Double getOrPrice() {
        return this.orPrice;
    }
    
    public void setOrPrice(Double orPrice) {
        this.orPrice = orPrice;
    }

    public Double getOrYunfei() {
        return this.orYunfei;
    }
    
    public void setOrYunfei(Double orYunfei) {
        this.orYunfei = orYunfei;
    }

    public String getOrRemark() {
        return this.orRemark;
    }
    
    public void setOrRemark(String orRemark) {
        this.orRemark = orRemark;
    }

    public Integer getOrTotalnum() {
        return this.orTotalnum;
    }
    
    public void setOrTotalnum(Integer orTotalnum) {
        this.orTotalnum = orTotalnum;
    }

    public String getOrOrdernumber() {
        return this.orOrdernumber;
    }
    
    public void setOrOrdernumber(String orOrdernumber) {
        this.orOrdernumber = orOrdernumber;
    }

    public Integer getOrPaytype() {
        return this.orPaytype;
    }
    
    public void setOrPaytype(Integer orPaytype) {
        this.orPaytype = orPaytype;
    }

    public Double getOrThreepay() {
        return this.orThreepay;
    }
    
    public void setOrThreepay(Double orThreepay) {
        this.orThreepay = orThreepay;
    }

    public Double getOrJifen() {
        return this.orJifen;
    }
    
    public void setOrJifen(Double orJifen) {
        this.orJifen = orJifen;
    }

    public String getOrRecipient() {
        return this.orRecipient;
    }
    
    public void setOrRecipient(String orRecipient) {
        this.orRecipient = orRecipient;
    }

    public Integer getOrPeisongtype() {
        return this.orPeisongtype;
    }
    
    public void setOrPeisongtype(Integer orPeisongtype) {
        this.orPeisongtype = orPeisongtype;
    }

    public Double getOrShoppingzhekou() {
        return this.orShoppingzhekou;
    }
    
    public void setOrShoppingzhekou(Double orShoppingzhekou) {
        this.orShoppingzhekou = orShoppingzhekou;
    }

    public Set getGoodsorderdetails() {
        return this.goodsorderdetails;
    }
    
    public void setGoodsorderdetails(Set goodsorderdetails) {
        this.goodsorderdetails = goodsorderdetails;
    }

    public Set getGoodsreturns() {
        return this.goodsreturns;
    }
    
    public void setGoodsreturns(Set goodsreturns) {
        this.goodsreturns = goodsreturns;
    }
   








}