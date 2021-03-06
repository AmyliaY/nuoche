<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<!--标准mui.css-->
		<title>卡卡商城</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/mui.min.css">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/mui.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/iconfont.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weixin/	css/icons-extra.css" />
		<script type="text/javascript" src = "https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/shuaxin.js"></script>
		<style>
		html,body{
			height: 100%;
		}
		iframe{
			width: 100%;
			height: 90%;
			overflow: hidden;
			
		}
		
	
		.mui-active {
		color: #FF7900 !important;
		}
		
		</style>
	</head>
	<body >
		
		<nav class="mui-bar mui-bar-tab" style="height: 10%;">
			<a id="frame_one" class="mui-tab-item mui-active" href="#tabbar">
				<span class="mui-icon mui-icon-home"></span>
				<span class="mui-tab-label">首页</span>
			</a>
			
			
			<a id="frame_three" class="mui-tab-item" href="#tabbar-with-school">
				<span class="mui-icon  mui-icon-star"></span>
				<span class="mui-tab-label">收藏</span>
			</a>
			<a id="frame_four" class="mui-tab-item" href="#tabbar-with-contact">
				<span class="mui-icon mui-icon-extra mui-icon-extra-cart"></span>
				<span class="mui-tab-label">购物车</span>
			</a>
			<a id="frame_five" class="mui-tab-item" href="#tabbar-with-center">
				<span class="mui-icon mui-icon-person"></span>
				<span class="mui-tab-label">个人中心</span>
			</a>
		</nav>
		<div class="mui-content" style="height: 90%;">
			
			<iframe id="tabbar" class="mui-control-content   mui-iframe-wrapper mui-active" src="${pageContext.request.contextPath}/weixin/home/home.jsp"    frameborder="no" >
			</iframe>
			
			
			
			<iframe id="tabbar-with-school" class="mui-control-content mui-iframe-wrapper"     src="${pageContext.request.contextPath}/weixin/collection/collection.jsp"           frameborder="no">
			</iframe>
			
			
			<iframe id="tabbar-with-contact" class="mui-control-content mui-iframe-wrapper"     src="${pageContext.request.contextPath}/weixin/shopingcart/cart.jsp"      frameborder="no">
			
			</iframe>
			
			
			<iframe id="tabbar-with-center" class="mui-control-content mui-iframe-wrapper"  src="${pageContext.request.contextPath}/weixin/center.jsp"   frameborder="no">
			</iframe>
			
		</div>
	</body>
	<script>
	
	
		mui.init({
			swipeBack:true //启用右滑关闭功能
		});
		
		
	</script>
</html>