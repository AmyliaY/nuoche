package com.pojo;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import net.paoding.analysis.analyzer.PaodingAnalyzer;

import org.hibernate.annotations.Sort;
import org.hibernate.annotations.SortType;
import org.hibernate.search.annotations.Analyzer;
import org.hibernate.search.annotations.DocumentId;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.IndexedEmbedded;
import org.hibernate.search.annotations.Store;



/**
 * Goods entity. @author MyEclipse Persistence Tools
 */

@Analyzer(impl=PaodingAnalyzer.class)
@Indexed(index="goods")
public class Goods  implements java.io.Serializable {


    

	public Goods(Integer gid, String gname, Double gprice, Double gvipprice,
			Integer gstatus, String gimages, String gdanwei, Integer gsellnum,
			Integer gcollectionsnum, Integer gzhongchou, Timestamp gbegintime,
			Timestamp gendtime, String gtime, String gchandi, String gpinpai,
			String gcoder, String jianjie, Integer buyCount, Double youfei) {
		this.gid = gid;
		this.gname = gname;
		this.gprice = gprice;
		this.gvipprice = gvipprice;
		this.gstatus = gstatus;
		this.gimages = gimages;
		this.gdanwei = gdanwei;
		this.gsellnum = gsellnum;
		this.gcollectionsnum = gcollectionsnum;
		this.gzhongchou = gzhongchou;
		this.gbegintime = gbegintime;
		this.gendtime = gendtime;
		this.gtime = gtime;
		this.gchandi = gchandi;
		this.gpinpai = gpinpai;
		this.gcoder = gcoder;
		this.jianjie = jianjie;
		this.buyCount = buyCount;
		this.youfei = youfei;
	}

	// Fields    
	 @DocumentId
     private Integer gid;
	 
	
	 @Field(index=Index.TOKENIZED,store=Store.YES)
     private String gname; //名称
     private Double gprice;  //价格
     private Double gvipprice;//vip价格
     private Double price;//如果普通会员，显示gprice,如果vip显示gvipprice
     
     private Integer gziying; //是否自营商品 1是， 0否----new
     private Float   gshiprice;//市场价格 -----new
     
     private Integer zhituijlj;//直推奖励金
     
	@Field(index=Index.TOKENIZED,store=Store.YES)
     private String gdetail; //商品详情
     private Integer gstatus; //是否上架1  0下架
     private String gimages;   //默认图片
     private String gdanwei;  //单位
     private Integer gsellnum;
     private Integer gcollectionsnum; //累积销量
     private Integer gzhongchou;  //是否众筹 1是 0否
     private Timestamp gbegintime;
     private Timestamp gendtime;
     private String gtime;  
     private String gchandi; //产地
     
     @Field(index=Index.UN_TOKENIZED,store=Store.YES)
     private String gpinpai; //品牌
     private String gcoder;  //二维码
     
     @Field(index=Index.TOKENIZED,store=Store.YES)
     private String jianjie; //商品简介
     private Integer buyCount=0;   //累计购买次数
     private Double  youfei=0.0;   //邮费,这个没有和数据库对象，是计算出来的
     
     
     public Integer getZhituijlj() {
 		return zhituijlj;
 	}

 	public void setZhituijlj(Integer zhituijlj) {
 		this.zhituijlj = zhituijlj;
 	}
     
     
     public Integer getGziying() {
		return gziying;
	}

	public void setGziying(Integer gziying) {
		this.gziying = gziying;
	}

	public Float getGshiprice() {
		return gshiprice;
	}

	public void setGshiprice(Float gshiprice) {
		this.gshiprice = gshiprice;
	}


	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

     
     public Double getYoufei() {
		return youfei;
	}

	public void setYoufei(Double youfei) {
		this.youfei = youfei;
	}

	public String getJianjie() {
		return jianjie;
	}

	public Integer getBuyCount() {
		return buyCount;
	}

	public void setBuyCount(Integer buyCount) {
		this.buyCount = buyCount;
	}

	public void setJianjie(String jianjie) {
		this.jianjie = jianjie;
	}

	public String getGcoder() {
		return gcoder;
	}

	public void setGcoder(String gcoder) {
		this.gcoder = gcoder;
	}

	public String getGchandi() {
		return gchandi;
	}

	public void setGchandi(String gchandi) {
		this.gchandi = gchandi;
	}

	public String getGpinpai() {
		return gpinpai;
	}

	public void setGpinpai(String gpinpai) {
		this.gpinpai = gpinpai;
	}

	public String getGtime() {
		return gtime;
	}

	public void setGtime(String gtime) {
		this.gtime = gtime;
	}

	private Set shoppingcats = new HashSet(0);
     private Set goodscrowdfundingrebates = new HashSet(0);
     private Set goodsorderdetails = new HashSet(0);
     private Set goodsimageses = new HashSet(0);
     private Set collectionses = new HashSet(0);


    // Constructors

    /** default constructor */
    public Goods() {
    }

	/** minimal constructor */
    public Goods(String gname, Integer gstatus, Integer gzhongchou) {
        this.gname = gname;
        this.gstatus = gstatus;
        this.gzhongchou = gzhongchou;
    }
    
    /** full constructor */
    public Goods(String gname, Double gprice, Double gvipprice, String gdetail, Integer gstatus, String gimages, String gdanwei, Integer gsellnum, Integer gcollectionsnum, Integer gzhongchou, Timestamp gbegintime, Timestamp gendtime, Set shoppingcats, Set goodscrowdfundingrebates, Set goodsorderdetails, Set goodsimageses, Set collectionses) {
        this.gname = gname;
        this.gprice = gprice;
        this.gvipprice = gvipprice;
        this.gdetail = gdetail;
        this.gstatus = gstatus;
        this.gimages = gimages;
        this.gdanwei = gdanwei;
        this.gsellnum = gsellnum;
        this.gcollectionsnum = gcollectionsnum;
        this.gzhongchou = gzhongchou;
        this.gbegintime = gbegintime;
        this.gendtime = gendtime;
        this.shoppingcats = shoppingcats;
        this.goodscrowdfundingrebates = goodscrowdfundingrebates;
        this.goodsorderdetails = goodsorderdetails;
        this.goodsimageses = goodsimageses;
        this.collectionses = collectionses;
    }

   
    // Property accessors

    public Integer getGid() {
        return this.gid;
    }
    
    public void setGid(Integer gid) {
        this.gid = gid;
    }


    public String getGname() {
        return this.gname;
    }
    
    public void setGname(String gname) {
        this.gname = gname;
    }

    public Double getGprice() {
        return this.gprice;
    }
    
    public void setGprice(Double gprice) {
        this.gprice = gprice;
    }

    public Double getGvipprice() {
        return this.gvipprice;
    }
    
    public void setGvipprice(Double gvipprice) {
        this.gvipprice = gvipprice;
    }

    public String getGdetail() {
        return this.gdetail;
    }
    
    public void setGdetail(String gdetail) {
        this.gdetail = gdetail;
    }

    public Integer getGstatus() {
        return this.gstatus;
    }
    
    public void setGstatus(Integer gstatus) {
        this.gstatus = gstatus;
    }

    public String getGimages() {
        return this.gimages;
    }
    
    public void setGimages(String gimages) {
        this.gimages = gimages;
    }

    public String getGdanwei() {
        return this.gdanwei;
    }
    
    public void setGdanwei(String gdanwei) {
        this.gdanwei = gdanwei;
    }

    public Integer getGsellnum() {
        return this.gsellnum;
    }
    
    public void setGsellnum(Integer gsellnum) {
        this.gsellnum = gsellnum;
    }

    public Integer getGcollectionsnum() {
        return this.gcollectionsnum;
    }
    
    public void setGcollectionsnum(Integer gcollectionsnum) {
        this.gcollectionsnum = gcollectionsnum;
    }

    public Integer getGzhongchou() {
        return this.gzhongchou;
    }
    
    public void setGzhongchou(Integer gzhongchou) {
        this.gzhongchou = gzhongchou;
    }

    public Timestamp getGbegintime() {
        return this.gbegintime;
    }
    
    public void setGbegintime(Timestamp gbegintime) {
        this.gbegintime = gbegintime;
    }

    public Timestamp getGendtime() {
        return this.gendtime;
    }
    
    public void setGendtime(Timestamp gendtime) {
        this.gendtime = gendtime;
    }

    public Set getShoppingcats() {
        return this.shoppingcats;
    }
    
    public void setShoppingcats(Set shoppingcats) {
        this.shoppingcats = shoppingcats;
    }

    public Set getGoodscrowdfundingrebates() {
        return this.goodscrowdfundingrebates;
    }
    
    public void setGoodscrowdfundingrebates(Set goodscrowdfundingrebates) {
        this.goodscrowdfundingrebates = goodscrowdfundingrebates;
    }

    public Set getGoodsorderdetails() {
        return this.goodsorderdetails;
    }
    
    public void setGoodsorderdetails(Set goodsorderdetails) {
        this.goodsorderdetails = goodsorderdetails;
    }

    public Set getGoodsimageses() {
        return this.goodsimageses;
    }
    
    public void setGoodsimageses(Set goodsimageses) {
        this.goodsimageses = goodsimageses;
    }

    public Set getCollectionses() {
        return this.collectionses;
    }
    
    public void setCollectionses(Set collectionses) {
        this.collectionses = collectionses;
    }

	
   








}