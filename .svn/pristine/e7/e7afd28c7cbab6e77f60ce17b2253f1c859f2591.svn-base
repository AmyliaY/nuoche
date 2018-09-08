package com.action;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import com.listener.WeixinGetAccessTokenListen;

public class CorpAction {
	public static String ziti=null;	//自提
	public static String kuaidi=null;  //快递
	public static String songhuo=null; //送货上门
	public static String getZiti() {
		return ziti;
	}
	public static void setZiti(String ziti) {
		CorpAction.ziti = ziti;
	}
	public static String getKuaidi() {
		return kuaidi;
	}
	public static void setKuaidi(String kuaidi) {
		CorpAction.kuaidi = kuaidi;
	}
	public static String getSonghuo() {
		return songhuo;
	}
	public static void setSonghuo(String songhuo) {
		CorpAction.songhuo = songhuo;
	}
	static{
		init();
	}
	
	public static void init()
	{
		Properties prop=new Properties();
		String path = WeixinGetAccessTokenListen.application.getRealPath("/WEB-INF/classes/corp.properties");
		
		
		try {
			InputStream is= new FileInputStream(path);
			prop.load(is);
			CorpAction.ziti=prop.getProperty("ziti").trim();
			CorpAction.kuaidi=prop.getProperty("kuaidi").trim();
			CorpAction.songhuo=prop.getProperty("songhuo").trim();
			is.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
