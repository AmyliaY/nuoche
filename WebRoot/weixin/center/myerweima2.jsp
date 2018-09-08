<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.util.URLManager"%>
<%@page import="weixin.popular.util.JSSDKUtil"%>
<%@page import="weixin.popular.api.QrcodeAPI"%>
<%@page import="weixin.popular.bean.QrcodeTicket"%>
<%@page import="com.listener.WeixinGetAccessTokenListen"%>
<%@page import="com.pojo.Userinfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport"
			content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>我的二维码</title>
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/weixin/css/mui.min.css">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/weixin/css/icons-extra.css" />
		<script type="text/javascript"
			src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js"></script>
	</head>
	<style>
body {
	background-color: #ffffff;
}

.saoyisao {
	color: #888888;
}

#topPopover {
	position: fixed;
	top: 16px;
	right: 6px;
}

#topPopover .mui-popover-arrow {
	left: auto;
	right: 6px;
}

span.mui-icon {
	font-size: 14px;
	color: #007aff;
	margin-left: -15px;
	padding-right: 10px;
}

.mui-popover {
	height: 100px;
}

.mui-content {
	padding: 10px;
}
</style>
	<body>
		<img id="img" src='_www/img/300300.jpg' style="display: none;" />
		<div style="width: 100%; text-align: center; padding-top: 40%;">
			<div style="width: 100%;">
				养生商城会员
			</div>
			<br>
			<div style="width: 100%">
				<div id="code"></div>
			</div>
			<br>
			<span class="saoyisao">扫一扫二维码，注册养生商城！</span>
		</div>
			<%
		
		    
		    String tel = request.getParameter("tel");
		    QrcodeAPI qrcodeAPI = new QrcodeAPI();
		    QrcodeTicket qrcodeTicket = qrcodeAPI.qrcodeCreateFinal(WeixinGetAccessTokenListen.access_token,tel);
		    String ticket = qrcodeTicket.getTicket();
		    String url = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket="+ticket;
		 %>
	

		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/weixin/js/jquery-1.9.0.min.js"></script>
		
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/weixin/js/jquery.qrcode.min.js"></script>
			
		<script>
		
		window.onload = function (){
			$('#code').qrcode("<%=url%>"); //二维码链接
		}
 		
		</script>
	</body>
</html>
