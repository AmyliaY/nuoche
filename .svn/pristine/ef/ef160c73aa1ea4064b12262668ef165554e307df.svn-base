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
</style>

<body class="bg-gray-f0">
	<div id="hideDiv"></div>
	<!-- 顶部 -->
	<header class="mui-bar mui-bar-nav" style="background: #FF7900;">
		<span class="mui-icon mui-icon-arrowleft mui-action-back" style="color: white;"></span>
		<span class="mui-title" style="color: white;">申请退货</span>
	</header>

	<div class="mui-scroll-wrapper mui-content">
		<div class="mui-scroll">

			<!--
					<div class="order_extra">
					可用10积分抵扣<span>￥0.1元<input type="checkbox" style="margin-left: 1px;" /></span>
				</div>
                -->
			<!--留言-->
			<div id="liuyandiv" style="background-color: white;width: 100%;height: 60px;margin-top: 20px;">
				<ul style="padding-top: 15px;padding-left: 10px;">
					<li style="width: 77px;float: left;font-size: 15px;">申请理由：</li>
					<li style="float: right;width: 77%;margin-top: -26px;"><input id="liyou" placeholder="对本次交易的说明" style="border: none;margin-top: 3px;width: 100%;padding-right: 10px;" /></li>
				</ul>
				
			</div>

			<div id="liuyandiv" style="background-color: white;width: 100%;height: 60px;margin-top: 20px;">
				<ul style="padding-top: 15px;padding-left: 10px;">
					<li style="width: 77px;float: left;font-size: 15px;">备注：</li>
					<li style="float: right;width: 77%;margin-top: -26px;"><input id="beizhu" placeholder="要退货的商品" style="border: none;margin-top: 3px;width: 100%;padding-right: 10px;" /></li>
				</ul>
			</div>
			<div class="settlement clearfloat" style="margin-top: 47%; height: 46px;background-color: white;">
				<div class="zuo clearfloat fl box-s">
				</div>
				<a href="#" class="fl db" id="submitsh">
					提 交 审 核
				</a>
			</div>
		</div>
	</div>

</body>
<script>
	mui.init();
	var userid = '${userinfo.usersId}'; //会员ID
	var orid=null; //订单ID
	mui.plusReady(function() {
		var order = plus.webview.currentWebview();
		orid=order.orid;
		//重写子界面的返回方法关闭父界面的遮蔽背景层
		mui.back = function() {
			//得到父界面，并在父界面执行js，用；分隔多个js语句
			plus.webview.currentWebview().opener().evalJS("$('#hideDiv').css('display','none');");
			mui.currentWebview.close();
		}
	});
	$("#submitsh").click(function(){
		var liyou=$("#liyou").val();
		var beizhu=$("#beizhu").val();
		if(liyou=="")
		{
			mui.toast("请填写申请理由");
			return;
		}
		if(beizhu=="")
		{
			mui.toast("请填写备注");
			return;
		}
		mui.post(SERVER_URL+"apporder.do?p=returngoods",{userid:userid,orid:orid,liyou:liyou,beizhu:beizhu},function(data){
			mui.fire(plus.webview.currentWebview().opener(),'rgoods');
			plus.webview.currentWebview().opener().evalJS("$('#hideDiv').css('display','none');");
			plus.webview.currentWebview().close();
		});
	});
	(function($) {
		$(".mui-scroll-wrapper").scroll({
			bounce: true, //滚动条是否有弹力默认是true
			indicators: true, //是否显示滚动条,默认是true
		});

	})(mui);
</script>

</html>