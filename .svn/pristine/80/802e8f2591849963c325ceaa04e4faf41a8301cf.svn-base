package com.test;

import java.io.IOException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;

public class Call2 {

	/**
	 * 1109
	 * 
	 * @param args
	 * @throws IOException
	 * @throws HttpException
	 *             http://api.vm.ihuyi.com/webservice/voice.php?method=Submit
	 *             http://api.vm.ihuyi.com/webservice/voice.php?method=Submit&
	 *             account
	 *             =APIID&password=APIKEY&mobile=手机号码&content=您的订单号是：0648。
	 *    0
提交失败
2
提交成功
400
非法ip访问
401
帐号不能为空
402
密码不能为空
403
手机号码不能为空
4030
手机号码已被列入黑名单
404
语音内容不能为空
405
用户名或密码不正确
4050
账号被冻结
4051
剩余条数不足
4052
访问ip与备案ip不符
406
手机格式不正确
4071
没有提交备案模板
4072
提交的语音内容必须与报备过的模板格式相匹配
40722
变量内容超过指的的长度
408
您的帐户疑被恶意利用，已被自动冻结，如有疑问请与客服联系。
	 */
	public static void main(String[] args) throws HttpException, IOException {
		String appid = "VM89339958";
		String key = "00a8595b05494541fccaf413525fd8e2";
		String callHe = "15673350001";
		String car = "湘B12345";
		String address = "湖南工业大学";
		String _content = "尊敬的%s车主您好，这里是卡卡挪车系统，您的爱车位于：%s，影响他人正常使用，请您及时处理，谢谢！";
        String content = String.format(_content, car,address);
		String url = "http://api.vm.ihuyi.com/webservice/voice.php?method=Submit";;
		HttpClient client = new HttpClient();
		PostMethod method = new PostMethod(url);

		// client.getParams().setContentCharset("GBK");
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType",
				"application/x-www-form-urlencoded;charset=UTF-8");

		NameValuePair[] data = {// 提交短信
		new NameValuePair("account", appid),// 用户名是登录用户中心->语音通知->产品总览->APIID
				new NameValuePair("password", key),// 查看密码请登录用户中心->语音通知->产品总览->APIKEY
				new NameValuePair("mobile", callHe),// 手机号码
				new NameValuePair("content", content) };

		method.setRequestBody(data);

		try {
			client.executeMethod(method);

			String submitResult = method.getResponseBodyAsString();

			System.out.println(submitResult);

			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
