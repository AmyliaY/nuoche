<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.util.URLManager"%>
<%
/* *
 *功能：即时到账交易接口接入页
 *版本：3.3
 *日期：2012-08-14
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。

 *************************注意*****************
 *如果您在接口集成过程中遇到问题，可以按照下面的途径来解决
 *1、商户服务中心（https://b.alipay.com/support/helperApply.htm?action=consultationApply），提交申请集成协助，我们会有专业的技术工程师主动联系您协助解决
 *2、商户帮助中心（http://help.alipay.com/support/232511-16307/0-16307.htm?sh=Y&info_type=9）
 *3、支付宝论坛（http://club.alipay.com/read-htm-tid-8681712.html）
 *如果不想使用扩展功能请把扩展功能参数赋空值。
 **********************************************
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.alipay.sign.config.*"%>
<%@ page import="com.alipay.util.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>支付宝即时到账交易接口</title>
	</head>
	<%
	
	    /*
		ApplicationContext applicationContext=WebApplicationContextUtils
		.getWebApplicationContext(application);
		
		AlipayFrontService alipayFrontService=(AlipayFrontService)applicationContext.getBean("alipayFrontService");
		
		Alipay alipay=alipayFrontService.getAlipay();
		if(alipay==null||alipay.getStatus()==0)
		{
			out.println("请联系管理员开通支付宝");
			return;
		}
        */
	
		////////////////////////////////////请求参数//////////////////////////////////////

		String id=request.getParameter("payId");          //订单号
		String money=request.getParameter("money");    //金额，单位元
		System.out.println("payId="+id);
		System.out.println("money2="+money);
		String partner= AlipayConfig.partner;
		String key=AlipayConfig.MD5_KEY;
		int status=1;
		//String other=alipay.getOther();
		//支付类型
		String payment_type = "1";
		//必填，不能修改
		//服务器异步通知页面路径
		String notify_url= URLManager.getServerURL(request)+"/pay/alipay/notify_url.jsp";
		//String notify_url = "http://192.168.1.216:8080/xlsc2/ShoppingWebsite/notify_url.jsp";
		//需http://格式的完整路径，不能加?id=123这类自定义参数

		//页面跳转同步通知页面路径
		String return_url= URLManager.getServerURL(request)+"/pay/alipay/return_url.jsp";
		//String return_url = "http://xlsc.wang/ShoppingWebsite/return_url.jsp";
		//String return_url = "http://192.168.1.216:8080/xlsc2/ShoppingWebsite/return_url.jsp";
		//需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/
        //卖家支付宝帐户
        String seller_email=AlipayConfig.SELLER_ID;
		//String seller_email = "506726156@qq.com";
		//必填


		//商户订单号
		String out_trade_no = new String(request.getParameter("payId").getBytes("ISO-8859-1"),"UTF-8");
		//商户网站订单系统中唯一订单号，必填

		//订单名称
		String subject ="代理充值";
		//必填

		//付款金额
		String total_fee = new String(request.getParameter("money").getBytes("ISO-8859-1"),"UTF-8");
		//必填

        //total_fee="0.01";
		//订单描述

		String body="";
		//String body = new String(request.getParameter("dingdandesc").getBytes("ISO-8859-1"),"UTF-8");
		//商品展示地址
		String show_url="";
		//String show_url = new String(request.getParameter("addressxiangxi").getBytes("ISO-8859-1"),"UTF-8");
		//需以http://开头的完整路径，例如：http://www.商户网址.com/myorder.html

		//防钓鱼时间戳
		String anti_phishing_key = "";
		//若要使用请调用类文件submit中的query_timestamp函数

		//客户端的IP地址
		String exter_invoke_ip = "";
		//非局域网的外网IP地址，如：221.0.0.1
		
		
		//////////////////////////////////////////////////////////////////////////////////
		
		//把请求参数打包成数组
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", "create_direct_pay_by_user");
        sParaTemp.put("partner", AlipayConfig.partner);
        sParaTemp.put("seller_email", AlipayConfig.SELLER_ID);
        sParaTemp.put("_input_charset", AlipayConfig.input_charset);
		sParaTemp.put("payment_type", payment_type);
		sParaTemp.put("notify_url", notify_url);
		sParaTemp.put("return_url", return_url);
		sParaTemp.put("out_trade_no", out_trade_no);
		sParaTemp.put("subject", subject);
		sParaTemp.put("total_fee", total_fee);
		sParaTemp.put("body", body);
		sParaTemp.put("show_url", show_url);
		sParaTemp.put("anti_phishing_key", anti_phishing_key);
		sParaTemp.put("exter_invoke_ip", exter_invoke_ip);
		
		
		
		//建立请求
		String sHtmlText = AlipaySubmit.buildRequest(sParaTemp,"get","确认");
		out.println(sHtmlText);
	%>
	<body>
	</body>
</html>
