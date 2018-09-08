<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/mui.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weixin/css/mydianpu.css" />
	<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
	</head>
	<body>
		<header class="mui-bar mui-bar-nav" style="background-color:#FF7900;margin-top: 0px;">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
			<h1 class="mui-title" style="color: white;">我的店铺</h1>
			<a href="wapUser.do?p=getShopById&shopid=${shop.shopid }&userid=${shop.userinfo.usersId}" class="xiugai">修改</a>
		</header>
		<div class="mui-content">
			<div class="hang">
				<span class="zi">店铺名称：</span>
	            <span class="zi">${shop.shopname }</span>
			</div>
			<div class="hang">
				<span class="zi">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：</span>
	            <span class="zi">${shop.shoptel }</span>
			</div>
			<div class="hang">
				<span class="zi">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</span>
	            <span class="zi">${shop.area.city.provice.prName}${shop.area.city.ctName}${shop.area.arName}</span>
			</div>
			<div class="hang">
				<span class="zi">详情地址：</span>
	            <span class="zi">${shop.shopaddress }</span>
			</div>
			<div class="hang">
				<span class="zi">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</span>
	            <span class="zi">${shop.shoptype.typename }</span>
			</div>
			<div class="hang">
				<span class="zi">店铺状态：</span>
	            <span class="zi">
	            <c:if test="${shop.shopstate==1 }">营业</c:if>
	            <c:if test="${shop.shopstate==0 }">休息</c:if>
	            </span>
			</div>
			<div class="hang">
				<span class="zi">店铺介绍：</span>
	            <span class="zi">${shop.shopjieshao }</span>
			</div>
			<div class="hang2">
				<span class="zi">店铺详情：</span>
	            <!-- <textarea style="border: 0px;">${shop.shopxiangqing }</textarea> -->
	            <span class="zi">${shop.shopxiangqing }</span>
			</div>
			<div class="hang2">
				<span class="zi2">店铺照片：</span>
	            <img src="${pageContext.request.contextPath }${shop.shoppicture }" />
			</div>
		</div>
	</body>
</html>
