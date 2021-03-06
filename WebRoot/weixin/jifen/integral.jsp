<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<link rel="stylesheet" href="../css/mui.min.css">
		<link href="../css/ectouch.css" rel="stylesheet" type="text/css" />
		<link href="../css/style.css" rel="stylesheet" type="text/css" />

		<script src="../js/jquery-1.8.2.min.js" type="text/javascript"></script>
		<script src="../layer/layer.js" type="text/javascript"></script>
		<script src="../js/mui.min.js"></script>
		<script src="../js/main.js"></script>
		<script src="../js/distpicker.data.js"></script>
		<script src="../js/distpicker.js"></script>
		<title>积分</title>
	</head>
	<style>
		/*body{
			background: white;
		}*/
		
		.mui-action-back {
			width: 26px;
			height: 26px;
			float: left;
			margin-top: 12px;
			margin-left: 10px;
		}
		
		#header h1 {
			margin: 0px auto;
		}
		
		#integral_sum {
			width: 100%;
			height: 200px;
			margin-top: 47px;
			text-align: center;
			line-height: 200px;
		}
		
		#current {
			font-size: 15px;
		}
		
		.integral_count {
			font-size: 25px;
			color: #FF7900;
		}
		
		#integral_detail {
			width: 93%;
			height: auto;
			margin: 0px auto;
			background: white
		}
		
		.integral_recording {
			width: 100%;
			height: 50px;
			line-height: 50px;
			/*border-bottom: 1px solid #E8E8E8;*/
		}
		
		.integral_recordfont {
			display: inline-block;
			font-size: 15px;
			font-weight: bolder;
			padding-left: 15px;
		}
		
		.month_record {
			height: 50px;
			width: 94%;
			margin: 0px auto;
			border-bottom: 1px solid #E8E8E8;
			line-height: 50px;
		}
		
		.month_record img {
			width: 4px;
			height: 24px;
			vertical-align: middle;
			margin-top: -6px;
		}
		
		.month_get_num {
			color: #ff7900;
		}
		
		.table_recording {
			height: 62px;
			width: 94%;
			margin: 0px auto;
			border-bottom: 1px solid #E8E8E8;
		}
		
		.table_recording_ways {
			width: 100%;
			height: 45px;
			line-height: 45px;
		}
		
		.integral_type,
		.month_text {
			font-size: 15px;
		}
		
		.integral_per,
		.month_condition {
			font-size: 15px;
			float: right;
			padding-right: 10px;
		}
		
		.integral_date {
			display: block;
			float: left;
			margin-top: -12px;
			color: #818080;
			font-size: 12px;
		}
		
		.selects {
			display: block;
			width: 30%;
			height: 50px;
			line-height: 50px;
			float: right;
			text-align: right;
			margin-right: 8px;
		}
		
		.selects_other {
			position: relative;
			z-index: 999;
			background-color: white;
			width: 100%;
			display: none;
			border-top: 1px solid #ccc;
			margin-top: -10px;
			text-align: center;
		}
		
		.selects a.arrow img {
			width: 0.7rem;
		}
		
		.selects_other a {
			border: 1px solid #ccc;
			border-top: none;
			display: block;
			width: 100%;
			color: black;
			height: 30px;
			line-height: 30px;
		}
		
		.selects_other a img {
			height: 0.8rem;
		}
	</style>

	<body>
		<!--顶部通用样式-->
		<header id="header">
			<img class="mui-action-back" src="../images/fanhuishang.png" id="fuwupagexx" index="1"></img>
			<div class="header_l header_return">
				<a href="#" class="iconfont icon-back"></a>
			</div>
			<h1>我的积分</h1>
		</header>
		<div id="integral_sum">
			<span id="current">当前积分：</span>
			<span id="currentjifen" class="integral_count"></span>
		</div>

		<div id="integral_detail">
			<div class="integral_recording">
				<span class="integral_recordfont">积分记录</span>

				<div class="selects">
					<div class="selects_head">
						<span class='selected'>全部</span>
						<a class="arrow"><img src="../images/jtx1.png"> </a>
					</div>
					<div class="selects_other">
						<a href="javascript:">
							全部
						</a>
						<a href="javascript:" onclick="change(0)">
							获取
						</a>
						<a href="javascript:" onclick="change(1)">
							使用
						</a>
					</div>
				</div>

			</div>

			<!--下拉刷新容器-->
			<div id="pullrefresh">
				<!--class="mui-content mui-scroll-wrapper"-->
				<div>
					<!--class="mui-scroll"-->
					<!--数据列表-->
					<ul class="mui-table-view mui-table-view-chevron">
						<li>
							<div class="month_record">
								<span>
									<img src="../images/line-row.jpg" />
									<span class="month_text">本月</span>
								</span>
								<span class="month_condition">
									使用：<span id="usejifen"></span>
								</span>
								<span class="month_condition">
									获取：<span class="month_get_num" id="getjifen"></span>
								</span>
							</div>
						</li>
					</ul>
					<ul id="jifenlist" class="mui-table-view mui-table-view-chevron">
						<!--<li>
							<div class="table_recording">
								<div class="table_recording_ways">
									<span class="integral_type">下线购买商品</span>
									<span class="integral_per">+29</span>
								</div>
								<div class="integral_date">
									<span>2017-06-22</span>
								</div>
							</div>
						</li>

						<li>
							<div class="table_recording">
								<div class="table_recording_ways">
									<span class="integral_type">众筹返</span>
									<span class="integral_per">+18</span>
								</div>
								<div class="integral_date">
									<span>2017-06-22</span>
								</div>
							</div>
						</li>-->

					</ul>
				</div>
			</div>

		</div>

		<script src="../js/mui.min.js"></script>
		<script>
			$(".selects_other").children("a").click(function() {
				$(this).parents('.selects').find(".selected").text($(this).text());
				$(".selects_other").hide();
			})

			$(".selects_head").click(function() {
				if($(this).parent().children(".selects_other").css("display") == 'none') {
					$(this).parent().children(".selects_other").show();
				} else {
					$(this).parent().children(".selects_other").hide();
				}
			})
			mui.init();
			var userid='${userinfo.usersId}';
			mui.plusReady(function(){
				var integral=plus.webview.currentWebview().integral;
				document.getElementById('currentjifen').innerText=integral;
				mui.ajax(SERVER_URL+'integral.do?p=getAll&userid='+userid,{
					type:"post",
					timeout:30000,
					success:function(data){
						var map=eval("("+data+")");
						document.getElementById("getjifen").innerText=map.getsum;
						document.getElementById("usejifen").innerText=map.usesum;
						var integralrecords=null;
						var goodsorders=null;
						for(var i=0;i<map.list.length;i++){
							mui.ajax(SERVER_URL+'integral.do?p=getjifen&id='+map.list[i][0]+'&table='+map.list[i][3],{
								type:"post",
								timeout:30000,
								success:function(jifen){
									var jfmap=eval("("+jifen+")");
									for(var key in jfmap){
										if(key=="integralrecords"){
											var str='<li><div class="table_recording"><div class="table_recording_ways">';
											if(jfmap.integralrecords.irType==0){
												str+='<span class="integral_type">下线购买商品</span>';
											}
											if(jfmap.integralrecords.irType==1){
												str+='<span class="integral_type">众筹返</span>';
											}
											if(jfmap.integralrecords.irType==2){
												str+='<span class="integral_type">充值</span>';
											}
											str+='<span class="integral_per">+'+jfmap.integralrecords.irNum+'</span></div>'+
												'<div class="integral_date"><span>'+jfmap.integralrecords.irTime+'</span></div></div></li>';
											}
										if(key=="goodsorders"){
											var str='<li><div class="table_recording"><div class="table_recording_ways">';
											str+='<span class="integral_type">购买商品</span>'+
												'<span class="integral_per">-'+jfmap.goodsorders.orJifen+'</span></div>'+
												'<div class="integral_date"><span>'+jfmap.goodsorders.orTime+'</span></div></div></li>';
										}
									}
									var jifenlist=document.getElementById("jifenlist");
									jifenlist.innerHTML+=str;
								}
							});
						}
					}
					
				});
			});
			/*获取、使用*/
			function change(n){
				var jifenlist=document.getElementById("jifenlist");
				jifenlist.innerHTML="";
				mui.ajax(SERVER_URL+'integral.do?p=getOrUseJf&n='+n+'&userid='+userid,{
					type:"post",
					timeout:30000,
					success:function(data){
						var ugmap=eval("("+data+")");
						for(var key in ugmap){
							if(key=="integralrecords"){
								for(var i=0;i<ugmap.integralrecords.length;i++){
									var str='<li><div class="table_recording"><div class="table_recording_ways">';
									if(ugmap.integralrecords[i].irType==0){
										str+='<span class="integral_type">下线购买商品</span>';
									}
									if(ugmap.integralrecords[i].irType==1){
										str+='<span class="integral_type">众筹返</span>';
									}
									if(ugmap.integralrecords[i].irType==2){
										str+='<span class="integral_type">充值</span>';
									}
									str+='<span class="integral_per">+'+ugmap.integralrecords[i].irNum+'</span></div>'+
										'<div class="integral_date"><span>'+ugmap.integralrecords[i].irTime+'</span></div></div></li>';
									}
									jifenlist.innerHTML+=str;
								}
							if(key=="goodsorders"){
								for(var i=0;i<ugmap.goodsorders.length;i++){
									var str='<li><div class="table_recording"><div class="table_recording_ways">';
									str+='<span class="integral_type">购买商品</span>'+
										'<span class="integral_per">-'+ugmap.goodsorders[i].orJifen+'</span></div>'+
										'<div class="integral_date"><span>'+ugmap.goodsorders[i].orTime+'</span></div></div></li>';
									jifenlist.innerHTML+=str;
								}
							}
						}
						
					}
				});
				
			}
		</script>

	</body>

</html>