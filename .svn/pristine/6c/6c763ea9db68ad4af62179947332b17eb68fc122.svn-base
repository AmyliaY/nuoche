<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.service_front.BaofuFrontService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.baofoo.sdk.fi.service.BaofooFiService"%>
<%@page import="com.baofoo.sdk.fi.dto.NotifyResult"%>
<%@page import="com.pojo.Baofupay"%>
<%@page import="com.service_front.PayCommonService"%>



<%
    //System.out.println("异步");
	ApplicationContext context = WebApplicationContextUtils
			.getWebApplicationContext(application);
	BaofuFrontService baofuFrontService = (BaofuFrontService) context
			.getBean("baofuFrontService");
	Baofupay baofupay = baofuFrontService.get();
	if (baofupay == null || baofupay.getStatus() == 0) {
		return;
	}

	Integer type = baofupay.getType(); //0测试  1正式
	String key = baofupay.getSignKey(); //私钥
	String MemberID = baofupay.getMemberId();
	String TerminalID = baofupay.getTerminalId();
    
    PayCommonService commonService = context.getBean("payCommonService");
	
	BaofooFiService  baofooFiService = new BaofooFiService(MemberID,TerminalID,key,type==0);		
	NotifyResult result = baofooFiService.recvcheck(request);
	//System.out.println(result.getCode()+result.getMessage());
	if ("校验成功".equals(result.getMessage()))
	{
	    double money = result.getFactMoney()/100;
	    String orderId = result.getTransId();
	    out.println("OK");
	    //这里请修改订单状态 
	    commonService.updateOrderStatus(orderId,money);
	    
	}
	else
	{
	  out.println("NO");
	}
	
	
	
    			
%>