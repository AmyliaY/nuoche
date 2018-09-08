package com.action;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 基础参数
 * @author 唐仁鑫
 * 新增充值话费价格设置--全恒
 *
 */
public class JccsAction {
	
	public static String qrcodeprice=null;	    //二维码销售价格      	qrcodeprice
	public static String vipyuyueprice=null;    //会员预约价格	 	vipyuyueprice
	public static String topprice=null;	        //置顶价格    	 	topprice
	public static String lunboprice=null;	    //轮播图价格	 	lunboprice
	public static String qrcodeProxyprice=null;	//一级代理二维码价格 	qrcodeProxyprice
	public static String bangdingnum=null;      //会员绑定赠送分钟数
	public static String xufeinum=null;     	//会员续费赠送分钟数
	public static String chongzhihuafei=null;   //充值话费单价，元/分钟
	
	public static String getChongzhihuafei(){
		return chongzhihuafei;
	}
	public static void setChongzhihuafei(String chongzhihuafei){
		JccsAction.chongzhihuafei = chongzhihuafei;
	}
	public static String getVipyuyueprice() {
		return vipyuyueprice;
	}
	public static String getBangdingnum() {
		return bangdingnum;
	}
	public static void setBangdingnum(String bangdingnum) {
		JccsAction.bangdingnum = bangdingnum;
	}
	public static String getXufeinum() {
		return xufeinum;
	}
	public static void setXufeinum(String xufeinum) {
		JccsAction.xufeinum = xufeinum;
	}
	public static void setVipyuyueprice(String vipyuyueprice) {
		JccsAction.vipyuyueprice = vipyuyueprice;
	}
	public static String getTopprice() {
		return topprice;
	}
	public static void setTopprice(String topprice) {
		JccsAction.topprice = topprice;
	}
	public static String getLunboprice() {
		return lunboprice;
	}
	public static void setLunboprice(String lunboprice) {
		JccsAction.lunboprice = lunboprice;
	}
	public static String getQrcodeProxyprice() {
		return qrcodeProxyprice;
	}
	public static void setQrcodeProxyprice(String qrcodeProxyprice) {
		JccsAction.qrcodeProxyprice = qrcodeProxyprice;
	}
	public static String getQrcodeprice() {
		return qrcodeprice;
	}
	public static void setQrcodeprice(String qrcodeprice) {
		JccsAction.qrcodeprice = qrcodeprice;
	}
	static{
		Properties properties=new Properties();
		InputStream is=JccsAction.class.getResourceAsStream("/jccs.properties");
		try {
			properties.load(is);
			qrcodeprice=properties.getProperty("qrcodeprice").trim();
			vipyuyueprice=properties.getProperty("vipyuyueprice").trim();
			topprice=properties.getProperty("topprice").trim();
			lunboprice=properties.getProperty("lunboprice").trim();
			qrcodeProxyprice=properties.getProperty("qrcodeProxyprice").trim();
			bangdingnum=properties.getProperty("bangdingnum").trim();
			xufeinum=properties.getProperty("xufeinum").trim();
			chongzhihuafei=properties.getProperty("chongzhihuafei");
			is.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
