<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.wangyin.wepaypc.util.PropertyUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.wangyin.wepaypc.model.BasePayOrderInfo"%>
<%@page import="com.wangyin.wepaypc.client.SignHelper"%>
<%@page import="javax.faces.application.Application"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.service_back.JDPayBackService"%>
<%@page import="com.pojo.Jdpay"%>

<%
    ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(application);
    JDPayBackService jdPayBackService = (JDPayBackService)applicationContext.getBean("jDPayBackService");
    Jdpay jdpay = jdPayBackService.findById(1);
    if (jdpay==null)
    {
      out.println("京东支付配置错误，请联系系统管理员");
      return ;
    }

	String merchantNum = PropertyUtils.getProperty("wepay.merchant.num");
	//String merchantNum = jdpay.getMerchantNum();		
	String version = "1.1.5";
	String token = "";
	String merchantRemark = "备注";
	String tradeNum =  UUID.randomUUID().toString().replaceAll("-",""); //request.getParameter("id"); //订单号
	String tradeName = "";//商品名
	String tradeDescription = "描述";
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String tradeTime = sdf.format(date);
	String tradeAmount = "1"; //request.getParameter("money");//金额
	String currency = "CNY";
	
	StringBuffer sb = new StringBuffer("http://");
	sb.append(request.getServerName());
	if (request.getServerPort()!=80)
	{
	  sb.append(":");
	  sb.append(request.getServerPort());
	}
	sb.append(request.getContextPath());
	//sb.append("/success.do");
	String successCallbackUrl = sb.toString()+"/success.do"; //浏览器通知地址
	String notifyUrl = sb.toString()+"/notify.do"; //异步通知地址
	String ip = ""; //交易IP

	BasePayOrderInfo basePayOrderInfo = new BasePayOrderInfo();
	basePayOrderInfo.setToken(token);
	basePayOrderInfo.setMerchantNum(merchantNum);
	basePayOrderInfo.setMerchantRemark(merchantRemark);
	basePayOrderInfo.setTradeNum(tradeNum);
	basePayOrderInfo.setTradeName(tradeName);
	basePayOrderInfo.setTradeDescription(tradeDescription);
	basePayOrderInfo.setTradeTime(tradeTime);
	basePayOrderInfo.setTradeAmount(tradeAmount);
	basePayOrderInfo.setCurrency(currency);
	basePayOrderInfo.setNotifyUrl(notifyUrl); //异步通知地址
	basePayOrderInfo.setSuccessCallbackUrl(successCallbackUrl); //同步通知地址
	basePayOrderInfo.setVersion(version);
	basePayOrderInfo.setIp(ip);

	String serverUrl = PropertyUtils
			.getProperty("wepay.server.pay.url");
	String oriUrl = serverUrl + "/nPay.htm";
	
	String priKey = PropertyUtils.getProperty("wepay.merchant.rsaPrivateKey");///这里取数据库
	
	//String priKey = jdpay.getKey3();
	
	
	basePayOrderInfo.setMerchantSign(SignHelper.getSign(
			basePayOrderInfo, priKey));
	pageContext.setAttribute("payOrderInfo", basePayOrderInfo);
	pageContext.setAttribute("payUrl", oriUrl); //提交地址		
			
%>

<body onload="autosubmit()">
	<form action="${payUrl}"  method="post" id="batchForm" >
		<input type="hidden" name="version" value="${payOrderInfo.version}"><br/>
		<input type="hidden" name="token" value="${payOrderInfo.token}"><br/>
		<input type="hidden" name="merchantNum" value="${payOrderInfo.merchantNum}"><br/>
		<input type="hidden" name="merchantRemark" value="${payOrderInfo.merchantRemark}"><br/>
		<input type="hidden" name="tradeNum" value="${payOrderInfo.tradeNum}"><br/>
		<input type="hidden" name="tradeName" value="${payOrderInfo.tradeName}"><br/>
		<input type="hidden" name="tradeDescription" value="${payOrderInfo.tradeDescription}"><br/>
		<input type="hidden" name="tradeTime" value="${payOrderInfo.tradeTime}"><br/>
		<input type="hidden" name="tradeAmount" value="${payOrderInfo.tradeAmount}"><br/>
		<input type="hidden" name="currency" value="${payOrderInfo.currency}"><br/>
		<input type="hidden" name="successCallbackUrl" value="${payOrderInfo.successCallbackUrl}"><br/>
		<input type="hidden" name="notifyUrl" value="${payOrderInfo.notifyUrl}"><br/>
		<input type="hidden" name="ip" value="${payOrderInfo.ip}"><br/>
		<input type="hidden" name="merchantSign" value="${payOrderInfo.merchantSign}"><br/>
	</form>
	<script>
	function autosubmit(){
		document.getElementById("batchForm").submit();
	}	
	</script>

</body>

