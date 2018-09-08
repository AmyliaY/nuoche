<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
		<link rel="stylesheet" href="${pageContext.request.contextPath }/weixin/css/new_file.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/weixin/js/jquery-1.8.2.min.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/weixin/js/new_file.js" ></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/weixin/layer/mobile/need/layer.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/weixin/layer/mobile/layer.js" ></script>
		<title>卡卡挪车</title>
	</head>
	<body>
		<!--头部  star-->
		<header>
			<a href="javascript:history.go(-1);">
				<div class="_left"><img src="${pageContext.request.contextPath }/weixin/images/Arrow_left_icon.png"></div>
				卡卡挪车续费
			</a>
		</header>
		<!--头部 end-->
		<div class="banner">
		 
			<img src="${pageContext.request.contextPath }/weixin/images/banner-car.jpg" width="100%" height="60%"/>
		</div>
		
		 
		<!--充值列表-->
		<div class="person_wallet_recharge">
			<ul class="ul">
                <li onclick="year(1)">
                    <h2>1 年</h2>
                    <div class="sel" style=""></div>
                </li>
                <li onclick="year(2)">
                    <h2>2 年</h2>
                    <div class="sel" style=""></div>
                </li>
                <li onclick="year(3)">
                    <h2>3 年</h2>
                    <div class="sel" style=""></div>
                </li>
                <li onclick="year(4)">
                    <h2>4 年</h2>
                    <div class="sel" style=""></div>
                </li>
                <li onclick="year(5)">
                    <h2>5 年</h2>
                    <div class="sel" style=""></div>
                </li>
                <li onclick="year(6)">
                    <h2>6 年</h2>
                    <div class="sel" style=""></div>
                </li>
                
                <div style="clear: both;"></div>
            </ul>
            <div class="pic">金额：<input type="text" placeholder="" id="txt" readonly="true" style="color: red;font-size: 18px;width:80px;"/>
            <input type="hidden" id="qrcodeprice" value="${qrcodeprice }"/>
            </div>
            <div class="botton" >我要续费</div>
            <!--遮罩层-->
            <div class="f-overlay"></div>
            <div class="addvideo" style="display: none;">
            	<h3>本次续费<span id="money">0</span>元</h3>
	            <ul>
	            	<li><a onclick="renewgo()">微信支付</a></li>
	            	<li class="cal">取消</li>
	            </ul> 
            </div>
		</div>
	</body>
<script>
	function year(num)
	{
		var qrcodeprice = $("#qrcodeprice").val()*1;
		$("#txt").val("￥"+num*qrcodeprice);
		$("#money").text(num*qrcodeprice);	
	}
	function renewgo()
	{
		var qrcodeprice = $("#qrcodeprice").val()*1;
		var money = $("#money").text()*1;
		var year = money/qrcodeprice;
		location = "${pageContext.request.contextPath }/userxufei.do?p=renewgo&money="+money+"&year="+year;
	}
	
</script>	
</html>
