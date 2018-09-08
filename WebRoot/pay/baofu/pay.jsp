<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.service_front.BaofuFrontService"%>
<%@page import="com.pojo.Baofupay"%>
<%@page import="com.baofoo.sdk.fi.support.BaofooFiConst"%>
<%@page import="com.baofoo.sdk.fi.dto.OrderInfo"%>
<%@page import="com.baofoo.sdk.fi.dto.PayResult"%>
<%@page import="com.baofoo.sdk.fi.service.BaofooFiService"%>

<%
	ApplicationContext context = WebApplicationContextUtils
			.getWebApplicationContext(application);
	BaofuFrontService baofuFrontService = (BaofuFrontService) context
			.getBean("baofuFrontService");
	Baofupay baofupay = baofuFrontService.get();
	if (baofupay == null || baofupay.getStatus() == 0) {
		out.println("请联系管理员开通宝付");
		return;
	}

	Integer type = baofupay.getType(); //0测试  1正式
	String money = request.getParameter("money"); //订单金额...........................
	String id = request.getParameter("id"); //订单号..................................
	String returnUrl = baofupay.getReturnUrl(); //页面通知地址
	String notifyUrl = baofupay.getNofiUrl(); //异步通知地址
	String key = baofupay.getSignKey(); //私钥
	String MemberID = baofupay.getMemberId();
	String TerminalID = baofupay.getTerminalId();

	OrderInfo orderInfo = new OrderInfo("", "", id, Double
			.parseDouble(money), returnUrl, notifyUrl);

	
			
	BaofooFiService  baofooFiService = new BaofooFiService(MemberID,TerminalID,key,type==0);
	PayResult payResult = baofooFiService.pay(orderInfo);
	
	String html = payResult.getHtmlContent();
	//System.out.println(html);
	out.println(html);
%>


