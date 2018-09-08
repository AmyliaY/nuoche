<%@page import="com.util.URLManager"%>
<%@page import="weixin.popular.util.JSSDKUtil"%>
<%@page import="weixin.popular.api.QrcodeAPI"%>
<%@page import="weixin.popular.bean.QrcodeTicket"%>
<%@page import="com.listener.WeixinGetAccessTokenListen"%>
<%@page import="com.pojo.WeixinUser"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>

<html lang="zh-CN">
<head>
<link href="${pageContext.request.contextPath }/weixin/css/css.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/weixin/css/style.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/weixin/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/weixin/css/font-awesome.css" rel="stylesheet" type="text/css">
<!--<base href="/static_files/"/>-->

<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<!--<meta content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;" name="viewport">--><!--禁用其缩放（zooming）功能-->

<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<meta charset="utf-8">
<meta name="description" content="" /><!--网站描述-->
<meta name="keywords" content="" /><!--网站关键字-->
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0,maximum-scale=1.0"/>
<!--width - viewport的宽度 height - viewport的高度
initial-scale - 初始的缩放比例
minimum-scale - 允许用户缩放到的最小比例
maximum-scale - 允许用户缩放到的最大比例
user-scalable - 用户是否可以手动缩放-->


	<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/weixin/js/jquery-1.9.0.min.js"></script>
		

	    <%
		
		    QrcodeAPI qrcodeAPI = new QrcodeAPI();
		    //qrcodeAPI.qrcodeCreateTemp(WeixinGetAccessTokenListen.access_token,1800, userinfo.getUsersId().intValue());
		    QrcodeTicket qrcodeTicket = qrcodeAPI.qrcodeCreateFinal(WeixinGetAccessTokenListen.access_token,request.getParameter("id"));
		    String ticket = qrcodeTicket.getTicket();
		    String url = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket="+ticket;
		 %>



<!--页面滚动插件-->

         
<title>卡卡挪车</title>

</head>


<body style="background-color: #d0f4fa; height: 100%; position: relative; background-position: bottom center; background-size: 100% auto; background-repeat: no-repeat;">
	<ul>
		<li>
			<div style="width: 100%">
				<div id="code"></div>
			</div>
		</li>
		<li>长按关注此二维码</li>
	</ul>
	
	
	<script>
	    $(function(){
	       $('#code').qrcode("<%=url%>");
	    });
	</script>
</body>

</html>
