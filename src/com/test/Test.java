package com.test;

import java.net.URL; 
import java.net.URLConnection;
import java.net.URLEncoder;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;

import com.util.MD5Util;


public class Test {
	 public static void main(String[] args) throws Exception {
	        //http://api.hbyxyj.cn/api_login.html
		     
		 
		   
		   String SERVER_URL = "http://api.hbyxyj.cn/apicall.do?command=call";
		   String mePhone = "15673350001";
		   String hePhone = "15873305757";
		   String appid  = "612716";
		   String md5key = "612716668953";
		   String url = "http://zzsunjob.vicp.cc/nuoche/mianfeicall.do";
		   String returnUrl = URLEncoder.encode(url,"utf-8");
		   int time=1;
		   
		   StringBuffer sb = new StringBuffer();
			sb.append("&appid=");
			sb.append(appid);
			sb.append("&callees=");
			sb.append(hePhone);
			sb.append("&caller=");
			sb.append(mePhone);
			sb.append("&return_url=");
			// sb.append(returnUrl);
			// sb.append("&maxtime=").append(time);
			String paramString = sb.toString();

			String sign = MD5Util.getMD5(paramString + url + md5key)
					.toLowerCase();

			String callUrl = SERVER_URL + paramString + returnUrl + "&sign="
					+ sign + "&maxtime=" + time * 10 + "&params="
					+ "1234";
		   System.out.println(callUrl);
		   
		   //{"msg":"call success","code":1,"data":{"orderid":"3e12d73d6a152d7431411432a5c506e9","showno":"+862825054800","ssid":"1200_726_4294967295_20180508142915@cdcallenabler12bhw.caas.sc.chinamobile.com"}}
		   
          HttpClient client = new HttpClient();
          GetMethod getMethod = new GetMethod(callUrl);
          int ret = client.executeMethod(getMethod);
          if (ret==200)
          {
        	  System.out.println(getMethod.getResponseBodyAsString());
        	  getMethod.releaseConnection();
          }
		  System.out.println("done!");
	        
	    }
}
