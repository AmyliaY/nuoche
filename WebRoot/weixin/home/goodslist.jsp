<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.getSession().setAttribute("page", 0);
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>Hello MUI</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<link rel="stylesheet" href="../css/mui.min.css">
		<link rel="stylesheet" href="../css/gg.css" />
		<link rel="stylesheet" href="../goodsdetail/confirm_order.css" />
		<link rel="stylesheet" href="../css/list.css" />
		<link rel="stylesheet" href="../css/iconfont.css" />
		<link rel="stylesheet" href="goodslist.css" />
		<link rel="stylesheet" type="text/css" href="../css/searchShow.css"/>
		<script src="../js/jquery-1.9.0.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/mui.min.js"></script>
	
	</head>

	<body style="background-color: #FFFFFF;">
		<header class="mui-bar mui-bar-nav" style="height: 8#FF7900ding: 0px;background: #EEEE66;">
			<div style="height: 44px;#FF7900: 0px 10px;background: #EEEE66;">
				<span class="mui-title">
					<input id="content" type="text" style="height: 32px;width: 95%;margin-left: -40px; font-size: 14px;color: #666;" value="" placeholder="请输入搜索内容" readonly="readonly">
				</span>
				<span class="mui-icon mui-icon-back mui-pull-left mui-action-back" style="color: #FFFFFF;"></span>
				<a id="icon-home" style="float: right;"><span class="mui-icon mui-icon-home"></span></a>
			</div>
			<div class="controller">
				<div style="height: 44px;">
					<small class="sortRole" data-index="0">
						<span class="role zdy-active">综合</span>
					</small>
					<small class="sortRole" data-index="1">
						<span class="role">销量优先</span>
					</small>
					<small class="sortRole" data-index="2">
						<span class="role change">价格</span>
						<span>
							<span class="mui-icon mui-icon-arrowup" style="position: absolute;top:4px;font-size: 10px;color: #999999;"></span>
							<span class="mui-icon mui-icon-arrowdown" style="position: absolute;top:9px;font-size: 10px;color: #999999;"></span>
						</span>
					</small>
				</div>
			</div>	
		</header>
		<ul id="goodslist">
			<li>
				<div class="box-b-1">
					<div class="box-b-1-l">
						<img src="../images/22.png" />
					</div>
					<div class="box-b-1-r">
						<p style="width: 100%;padding: 0px 5px;" class="goods-title">美国正宗大肉松饼 皮薄馅多 快速发货 买二送一 买五送三 包邮 </p>
						<p>
							<span>￥9.98</span><br />
						</p>
					</div>
				</div>
			</li>
			<li>
				<div class="box-b-1">
					<div class="box-b-1-l">
						<img src="../images/22.png" />
					</div>
					<div class="box-b-1-r">
						<p style="width: 100%;padding: 0px 5px;" class="goods-title">美国正宗大肉松饼 皮薄馅多 快速发货 买二送一 买五送三 包邮 </p>
						<p>
							<span>￥9.98</span><br />
						</p>
					</div>
				</div>
			</li>
		</ul>
	</body>
</html> 