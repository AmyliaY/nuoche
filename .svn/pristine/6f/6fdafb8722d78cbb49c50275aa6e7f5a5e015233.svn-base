<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.service_front.BaofuFrontService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.baofoo.sdk.fi.service.BaofooFiService"%>
<%@page import="com.baofoo.sdk.fi.dto.NotifyResult"%>
<%@page import="com.pojo.Baofupay"%>
<%@page import="com.service_front.PayCommonService"%>



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
	String key = baofupay.getSignKey(); //私钥
	String MemberID = baofupay.getMemberId();
	String TerminalID = baofupay.getTerminalId();

	BaofooFiService  baofooFiService = new BaofooFiService(MemberID,TerminalID,key,type==0);		
	NotifyResult result = baofooFiService.recvcheck(request);
	if ("校验成功".equals(result.getMessage()))
	{
	     //修改业务层
	     PayCommonService commonService = (PayCommonService)context.getBean("payCommonService");
	     System.out.print(result.getTransId());
	     commonService.updateOrderStatus(result.getTransId(),result.getFactMoney());
	     out.println("支付成功");
	    
	}
	else
	{
	     out.println("支付失败");
	}
	
    			
%>