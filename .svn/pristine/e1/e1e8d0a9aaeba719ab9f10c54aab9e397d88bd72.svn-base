package com.util;

import java.io.IOException;

import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.http.client.HttpClient;

public class SmsUtil2 {
	
	private static org.apache.commons.httpclient.HttpClient httpClient = new org.apache.commons.httpclient.HttpClient();
	private static final String SERVER = "http://61.156.157.248:8889/api.php";
	private static final String  ACTION_GETCOUNT = "surplus"; //action
	private static final String  ACTION_SENDMESSAGE = "send"; //action
	private static final String  USERNAME = "qjsp";
	private static final String   PASSWORD = "888888";
	
	public static void main(String[] args) {
		String str  = SmsUtil2.getMessageCount();
		System.out.println(str);
	}

	/**
	 * 获取手机短消息
	 * @return
	 */
	public static String getMessageCount()
	{
		
		PostMethod postMethod = new PostMethod(SERVER);
		postMethod.addParameter("username",USERNAME);
		postMethod.addParameter("password", PASSWORD);
		postMethod.addParameter("action",ACTION_GETCOUNT);
	    try {
			int ret = httpClient.executeMethod(postMethod);
			String responseString = postMethod.getResponseBodyAsString();
			return responseString;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "aa";
	}
	
	/**
	 * 发送短消息
	 * @param tel 手机号码
	 * @param content  发送的内容
	 * @return
	 */
	public static boolean sendMessage(String tel,String content)
	{
		
		return false;
	}

}
