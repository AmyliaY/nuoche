<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no" name="format-detection" />
<title>预约</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/wap/css/base.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/wap/css/common.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/wap/js/jquery.min.js" ></script>
<script src="${pageContext.request.contextPath}/wap/js/common.js"></script>
</head>

<body>
<header class="header" style="background-color: #3598DB;" id="header">
<a href="javascript:history.go(-1)" target=_self class="back">返回</a>
<h1>我要预约</h1>
</header>
<!--header-end-->

<div class="container" id="container"> 

<div class="maintenance-reservation">
<form action="${pageContext.request.contextPath}/fuwuyuyue.do?p=createorder&fuwuid=${service.id}" method="post">
<!--订单详情开始-->
<div class="order-details">
  <div class="order-details-tit"><h2>订单详情</h2></div>
  <div class="order-details-con">
    <p><span>预约服务：</span>${service.title }</p>
    <p><span>提供商家：</span>${service.business.shopname }</p>
    <p><span>预约费用：</span>￥${yuyueprice }</p>
    <p><span>电话号码：<input type="text" name="wxtel"  placeholder="请输入电话号码" value="${weixinUser.wxtel }" style="width: 70%;"></span></p>
    
  </div>
</div>
<!--备注信息开始-->
<div class="maintenance-reservation-textarea reservation">

    <textarea class="textarea" id="textarea" name="textarea" autofocus="autofocus"></textarea>
  <div class="layer"><span>请在此输入备注信息</span></div>
  <input type="hidden" id="openid" name="openid" value="${openid }"/>
</div>
<!--备注信息结束-->
<button type="submit" class="sure-order" style="background-color: #3598DB;">确认订单</button>
</form>
</div>
<!--maintenance-reservation-end-->

</div>
<!--container-end-->
</body>
</html>
