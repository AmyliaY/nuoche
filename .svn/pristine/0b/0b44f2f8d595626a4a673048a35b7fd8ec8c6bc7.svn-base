package com.test;

import java.io.IOException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.http.client.methods.HttpGet;

public class Call {

	/**
	 * @param args
	 * @throws IOException
	 * @throws HttpException
	 */
	public static void main(String[] args) throws HttpException, IOException {

		String key = "f6a98cb4d0b10519ae5cdbc2e21b3771";
		String callMe = "15873305757";
		String callHe = "15673350001";
		String return_url = "";
		String callShow = "0";
		String phoneShow = "0";
		String uid = "1234";
		String url = "http://api.id98.cn/api/v2/callback?appkey=%s&phone=%s&call=%s&return_url=%s&phoneShow=%s&callShow=%s&uid=%s&ext=testcall";
		String newUrl = String.format(url, key, callMe, callHe, return_url,
				phoneShow, callShow, uid);
		System.out.println(newUrl);
		HttpClient client = new HttpClient();
		GetMethod getMethod = new GetMethod(newUrl);
		int ret = client.executeMethod(getMethod);
		if (ret == 200) {
			String res = getMethod.getResponseBodyAsString();
			System.out.println(res);
		}
	}

}
