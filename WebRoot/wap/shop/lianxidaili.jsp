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


<script type="text/javascript" src = "js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src = "js/jquery.form.js"></script>
<script type="text/javascript" src = "js/popwin.js"></script>





<!--页面滚动插件-->

         
<title>卡卡挪车</title>

</head>


<body style="background-color: #d0f4fa; height: 100%; position: relative; background-position: bottom center; background-size: 100% auto; background-repeat: no-repeat;">
	<ul  style="margin-top: 150px;">
		
		<li> 对不起，您还不是商家！</li>
		<li><span>请与当地代理联系。</span></li>
		</br>
		</br>
		<a href="${pageContext.request.contextPath}/applybusiness.do?p=gotoapply" class="butA butBlue" style="width:80%;margin: 0 auto"><li> 申请成为商家</li></a>
		<li>申请状态：${applystatus}</li>
		<br>
		<br>
		<a href="${pageContext.request.contextPath}/wap/shop/changeTel.jsp" class="butA butRed" style="width:80%;margin: 0 auto"><li>申请通过&nbsp;验证手机号</li></a>
	</ul>
</body>

</html>
