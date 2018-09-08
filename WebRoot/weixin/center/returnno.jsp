<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>

<head>
	<meta charset="UTF-8">
	<title>确认订单</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../css/mui.min.css" />
	<link rel="stylesheet" type="text/css" href="../goodsdetail/confirm_order.css" />
	<link rel="stylesheet" type="text/css" href="../css/public.css">
	<link rel="stylesheet" type="text/css" href="../css/main_style.css">
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="../js/public.js"></script>
	<script type="text/javascript" src="../js/fontsize.js"></script>
	<script src="../js/mui.min.js"></script>
	
	<script src="../shuaxin.js"></script>

</head>
<style>
	#hideDiv {
		position: fixed;
		top: 0;
		right: 0;
		bottom: 0;
		left: 0;
		z-index: 998;
		background-color: rgba(0, 0, 0, .3);
		display: none;
	}
	#liuyandiv{
			width: 90%;
			height: auto;
			margin: 0px auto;
			margin-top: 20px;
			border: 1px solid #e6e6e6;
			padding: 10px;
			text-indent: 2em;
		}
</style>

<body class="bg-gray-f0">
	<div id="hideDiv"></div>
	<!-- 顶部 -->
	<header class="mui-bar mui-bar-nav" style="background: #FF7900;">
		<span class="mui-icon mui-icon-arrowleft mui-action-back" style="color: white;"></span>
		<span class="mui-title" style="color: white;">卖家已收货,不同意退款</span>
	</header>

	<div class="mui-scroll-wrapper mui-content">
		<div class="mui-scroll">

			<!--
					<div class="order_extra">
					可用10积分抵扣<span>￥0.1元<input type="checkbox" style="margin-left: 1px;" /></span>
				</div>
                -->
			<!--留言-->
			<span style="font-size: initial;padding: 10px;">不同意理由:</span>
			<div id="liuyandiv" style="background-color: white;width: 100%;height: 300px;margin-top: 20px;font-size: 15px;">
			
			</div${userinfo.usersId}ody>
<script>
	mui.init();
	var userid = '${userinfo.usersId}'; //会员ID
	var grAuditorreason=null; //理由
	mui.plusReady(function() {
		var order = plus.webview.currentWebview();
		grAuditorreason=order.grAuditorreason;
		$("#liuyandiv").html(grAuditorreason);
		//重写子界面的返回方法关闭父界面的遮蔽背景层
		mui.back = function() {
			//得到父界面，并在父界面执行js，用；分隔多个js语句
			plus.webview.currentWebview().opener().evalJS("$('#hideDiv').css('display','none');");
			mui.currentWebview.close();
		}
	});
	(function($) {
		$(".mui-scroll-wrapper").scroll({
			bounce: true, //滚动条是否有弹力默认是true
			indicators: true, //是否显示滚动条,默认是true
		});

	})(mui);
</script>

</html>