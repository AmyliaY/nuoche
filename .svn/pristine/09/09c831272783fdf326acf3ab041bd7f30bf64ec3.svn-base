<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en">

	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="Access-Control-Allow-Origin" content="">
		<meta http-equiv="content-security-policy">
		<title>订单</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weixin/css/mui.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weixin/css/public.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weixin/css/index.css" />
	</head>
	<style>
		html,
		body {
			background-color: #efeff4;
		}
		
		.mui-bar~.mui-content .mui-fullscreen {
			top: 44px;
			height: auto;
		}
		
		.mui-pull-top-tips {
			position: absolute;
			top: -20px;
			left: 50%;
			margin-left: -25px;
			width: 40px;
			height: 40px;
			border-radius: 100%;
			z-index: 1;
		}
		
		.mui-bar~.mui-pull-top-tips {
			top: 24px;
		}
		
		.mui-pull-top-wrapper {
			width: 42px;
			height: 42px;
			display: block;
			text-align: center;
			background-color: #efeff4;
			border: 1px solid #ddd;
			border-radius: 25px;
			background-clip: padding-box;
			box-shadow: 0 4px 10px #bbb;
			overflow: hidden;
		}
		
		.mui-pull-top-tips.mui-transitioning {
			-webkit-transition-duration: 200ms;
			transition-duration: 200ms;
		}
		
		.mui-pull-top-tips .mui-pull-loading {
			/*-webkit-backface-visibility: hidden;
				-webkit-transition-duration: 400ms;
				transition-duration: 400ms;*/
			margin: 0;
		}
		
		.mui-pull-top-wrapper .mui-icon,
		.mui-pull-top-wrapper .mui-spinner {
			margin-top: 7px;
		}
		
		.mui-pull-top-wrapper .mui-icon.mui-reverse {
			/*-webkit-transform: rotate(180deg) translateZ(0);*/
		}
		
		.mui-pull-bottom-tips {
			text-align: center;
			background-color: #efeff4;
			font-size: 15px;
			line-height: 40px;
			color: #777;
		}
		
		.mui-pull-top-canvas {
			overflow: hidden;
			background-color: #fafafa;
			border-radius: 40px;
			box-shadow: 0 4px 10px #bbb;
			width: 40px;
			height: 40px;
			margin: 0 auto;
		}
		
		.mui-pull-top-canvas canvas {
			width: 40px;
		}
		
		.mui-slider-indicator.mui-segmented-control {
			background-color: #efeff4;
		}
		
		.nav-header {
			background-color: #000000;
			color: white;
		}
		
		.nav-header h1 {
			text-align: left;
		}
		
		.nav-header a {
			color: white;
		}
		
		.box-a {
			overflow: hidden;
			background-color: #fff;
			position: fixed;
			z-index: 10;
			right: 0;
			left: 0;
		}
		
		.box-a-1 {
			width: 16%;
			display: inline-block;
			float: left;
			text-align: center;
			height: 40px;
			line-height: 40px;
			color: #666;
			font-size: 14px;
			margin: auto 2%;
		}
		
		#box-a-1 {
			color: #ff6700;
			border-bottom: 2px solid #FF6700;
		}
		
		.kong {
			height: 38px;
		}
		
		.box-b {
			margin-top: 10px;
		}
		
		.box-b p {
			height: 35px;
			line-height: 35px;
			text-align: right;
			padding-right: 15px;
			font-size: 12px;
			color: #FF6700;
			background: #fff;
			margin: 0;
		}
		
		.box-b-1 {
			overflow: hidden;
			padding-bottom: 3px;
		}
		
		.box-b-1-l {
			float: left;
			width: 26%;
			height: 70px;
			padding: 0 2%;
		}
		
		.box-b-1-l img {
			width: 100%;
			height: 65px;
		}
		
		.box-b-1-r {
			width: 74%;
			height: 20px;
			float: left;
		}
		
		.box-b-1-r p {
			text-align: left;
			width: 75%;
			line-height: 18px;
			float: left;
			color: #020202;
			background: none;
		}
		
		.box-b-2 {
			height: 35px;
			line-height: 35px;
			font-size: 12px;
			text-align: right;
			background: #fff;
		}
		
		.box-b-2 span {
			padding-right: 6px;
		}
		
		.box-b-3 {
			height: 40px;
			font-size: 13px;
			text-align: right;
			background: #fff;
		}
		
		.box-b-3 a {
			color: #000000;
			display: inline-block;
			height: 30px;
			line-height: 30px;
			border: 1px solid red;
			margin-top: 3px;
			border-radius: 18px;
			margin-right: 12px;
			text-align: center;
		}
		.jianjiea{
		     display: -webkit-box;
			 -webkit-box-orient: vertical;
			 -webkit-line-clamp: 2;
			 overflow: hidden;
		}
	</style>

	<body>

		<header class="mui-bar mui-bar-nav" style="background-color:#FF7900">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
			<h1 class="mui-title" style="color: white;">我的订单</h1>
		</header>

		<div class="mui-content chexian offter-list car-manage my-indent">
			<div id="slider" class="mui-slider mui-fullscreen">
				<div id="sliderSegmentedControl" class="mui-scroll-wrapper mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
					<div class="mui-scroll slidertab">
						<a class="mui-control-item mui-active" href="#item1mobile" tapcat='' tapurl='apporder.do?p=myorder&n=10'>
							全部
						</a>
						<a class="mui-control-item" href="#item2mobile" tapcat='' tapurl='apporder.do?p=myorder&n=0'>
							待付款
						</a>
						<a class="mui-control-item" href="#item3mobile" tapcat='' tapurl='apporder.do?p=myorder&n=1'>
							待发货
						</a>
						<a class="mui-control-item" href="#item4mobile" tapcat='' tapurl='apporder.do?p=myorder&n=2'>
							待收货
						</a>
						<a class="mui-control-item" href="#item5mobile" tapcat='' tapurl='apporder.do?p=myorder&n=3'>
							已收货
						</a>
					</div>
				</div>
				<div class="mui-slider-group" style="margin-top: -10px;">
					<div id="item1mobile" class="mui-slider-item mui-control-content mui-active">
						<div id="scroll1" class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<div class="mui-table-view car_article_list" tappage='1' tapcon='car_article_list'>

								</div>
							</div>
						</div>
					</div>
					<div id="item2mobile" class="mui-slider-item mui-control-content">
						<div class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<div class="mui-table-view car_hb_list" tappage='1' tapcon='car_hb_list'>

								</div>
							</div>
						</div>
					</div>
					<div id="item3mobile" class="mui-slider-item mui-control-content">
						<div class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<div class="mui-table-view" tappage='1' tapcon='car_dzf_list'>

								</div>
							</div>
						</div>
					</div>
					<div id="item4mobile" class="mui-slider-item mui-control-content">
						<div class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<div class="mui-table-view car_yzf_list" tappage='1' tapcon='car_yzf_list'>

								</div>
							</div>
						</div>
					</div>
					<div id="item5mobile" class="mui-slider-item mui-control-content">
						<div class="mui-scroll-wrapper">
							<div class="mui-scroll">
								<div class="mui-table-view car_yzf_list" tappage='1' tapcon='car_yzf_list'>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/jquery-2.1.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/mui.pullToRefresh.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/mui.pullToRefresh.material.js"></script>
		
		<script>
			mui.init();
			//var page = 1;
			var userid = '${userinfo.usersId}';
			if(userid.trim().length > 0){
				//Usershow(Userinfo);
			}else{
				window.top.location = "${pageContext.request.contextPath}/weixin/home/login.jsp";					
			}
			
			
			var MODULE_COROLLER_METHOD = "";
			//mui.plusReady(function() {
				//每次下拉加载条数
				var pagesize = 3;
				var count = 1;
				//滑动初始加载
				document.querySelector('.mui-slider').addEventListener('slide', function(event) {
					//plus.nativeUI.showWaiting();
					var this_ul = $('.mui-slider').find('.mui-slider-group').find('.mui-slider-item').eq(event.detail.slideNumber).find('.mui-table-view');
					var this_page = this_ul.attr('tappage'); //页数
					if(this_page == '1') {
						var ajax_url = $(".slidertab a").eq(event.detail.slideNumber).attr("tapurl") + '&id=' + userid;
						var ul = this_ul.get(0);
						ajax_load(ajax_url, ul, this_page, pagesize);
					}

					var zz = $('.mui-slider-group .mui-scroll').eq(event.detail.slideNumber);
                    
                        
					setTimeout(function() {

						ss(event.detail.slideNumber, zz);
                        //plus.nativeUI.closeWaiting(); 
                        
					}, 1500);

				});
				//循环初始化所有下拉刷新，上拉加载。
				$.each($('.mui-slider-group .mui-scroll'), function(index, pullRefreshEl) {
					//初始化加载第一个tab
					if(index == '0') {
						//plus.nativeUI.showWaiting();
						first_ul = this.querySelector('.mui-table-view');
						var first_page = first_ul.getAttribute('tappage');
						if(first_page == '1') {
							//var first_catid = $(".slidertab a").eq(index).attr("tapcat");
							var ajax_url = $(".slidertab a").eq(index).attr("tapurl") + '&id=' + userid;
							ajax_load(ajax_url, first_ul, first_page, pagesize);

							setTimeout(function() {

								ss(index, pullRefreshEl);
							}, 1500);

						}
					}
				});

				function ss(index, pullRefreshEl) {
					mui(pullRefreshEl).pullToRefresh({
						up: {
							contentrefresh: '正在加载...',
							contentnomore: '没有更多数据了',
							callback: function() {
								var self = this;
								var ul = self.element.querySelector('.mui-table-view');
								var tappage = ul.getAttribute('tappage');
								var num = ul.getAttribute('tapcount');

								var pullSize = num / 1;
		
								var ajax_url = $(".slidertab a").eq(index).attr("tapurl") + '&id=' + userid;

								ajax_load2(ajax_url, ul, tappage, pagesize, self);

								if(tappage == '1')
									ul.setAttribute('tappage', 2); //页数+1
								//page = page * 1 + 1;

							},
							auto: true
						}
					});
				}
			//});

			function ajax_load(url, ul, page, size) {
				mui.ajax("${pageContext.request.contextPath}/" + url, {
					data: {
						page: page,
						size: size
					},
					async: true,
					type: "post",
					timeout: 30000,
					success: function(data) {
						//plus.nativeUI.closeWaiting();
						var map = eval("(" + data + ")");
						for(var i = 0; i < map.olist.length; i++) {
							var str = '<div id="order' + map.olist[i].goodsorders.orId + '" class="box-b"><p>下单时间  ' + map.olist[i].goodsorders.orTime + '</p>' +
								'<div style="background: #f6f6f6; padding-top:8px;padding-bottom: 3px;border-bottom:4px solid whitesmoke;">';
							for(var j = 0; j < map.odlist.length; j++) {
								if(map.olist[i].goodsorders.orId == map.odlist[j].goodsorders.orId) {
									if(map.olist[i].goodsorders.zitiaddress == null) {
										str = str + '<div style="margin-top:5px;" onclick="orderdetail(\'' + map.olist[i].goodsorders.orId + '\',\'' + map.olist[i].goodsorders.orOrdernumber + '\',\'' + map.olist[i].goodsorders.address.adId + '\',\'' + map.olist[i].goodsorders.orStatus + '\',1,\''+map.odlist[j].goods.gid+'\')" class="box-b-1"><div class="box-b-1-l"><img src="' + "${pageContext.request.contextPath}" + map.odlist[j].goods.gimages + '" /></div>' +
									    '<div class="box-b-1-r"><p style="font-size:13px;">' + map.odlist[j].goods.gname + '</p><p style="width: 25%;text-align: right;"><span>￥' + map.odlist[j].odCost + '</span><p class="jianjiea" style="width:88%;">' + map.odlist[j].goods.jianjie + '</p><br /><br/><span style="color:#666">×' + map.odlist[j].odNum + '</span></p></div></div>';
										str = str + "<div style='border-bottom:3px solid white;'></div>";
									} else if(map.olist[i].goodsorders.address == null) {
										str = str + '<div onclick="orderdetail(\'' + map.olist[i].goodsorders.orId + '\',\'' + map.olist[i].goodsorders.orOrdernumber + '\',\'' + map.olist[i].goodsorders.zitiaddress.zitiId + '\',\'' + map.olist[i].goodsorders.orStatus + '\',2,\''+map.odlist[j].goods.gid+'\')" class="box-b-1"><div class="box-b-1-l"><img src="' + "${pageContext.request.contextPath}" + map.odlist[j].goods.gimages + '" /></div>' +
											'<div class="box-b-1-r"><p style="font-size:13px;">' + map.odlist[j].goods.gname + '</p><p style="width: 25%;text-align: right;"><span>￥' + map.odlist[j].odCost + '</span><p class="jianjiea" style="width:88%;">' + map.odlist[j].goods.jianjie + '</p><br /><br /><span style="color:#666">×' + map.odlist[j].odNum + '</span></p></div></div>';
//										str = str + "<div style='border-bottom:2px solid whitesmoke;'></div>";

									}
								}
							}
							str = str + '<div class="box-b-2"><span>共' + map.olist[i].goodsorders.orTotalnum + '件商品</span><span>合计：￥' + map.olist[i].goodsorders.orPrice + '（含运费￥' + map.olist[i].goodsorders.orYunfei + '）</span></div>' +
								'<div class="box-b-3">' +
								'<a style="padding:0 6px;border:1px solid #666;" onclick="kefu(' + map.olist[i].goodsorders.orId + ')">联系客服</a>';
							if(map.olist[i].goodsorders.orStatus == 0) {
								str = str + '<a style="padding:0 6px;border:1px solid #666;" onclick="deleteOrder(' + map.olist[i].goodsorders.orId + ')">删除订单</a>';
								str = str + '<a style="padding:0 15px;border:1px solid #FF6700;color: #FF6700;" onclick="goPay(' + map.olist[i].goodsorders.orId + ',\'' + map.olist[i].goodsorders.orOrdernumber + '\')">待付款(去支付)</a></div></div>';
							}
							if(map.olist[i].goodsorders.orStatus == 1) {
								str = str + '<a style="padding:0 15px;border:1px solid #FF6700;color: #FF6700;">待发货</a></div></div>';
							}
							if(map.olist[i].goodsorders.orStatus == 2) {
								str = str + '<a style="padding:0 6px;border:1px solid #666;" onclick="selectOrder(' + map.olist[i].goodsorders.orId + ')">查看物流</a>';
								str = str + '<a onclick="shouhuo(' + map.olist[i].goodsorders.orId + ')" style="padding:0 15px;border:1px solid #FF6700;color: #FF6700;">确认收货</a></div></div>';
							}
							if(map.olist[i].goodsorders.orStatus == 3) {
//								str = str + '<a style="padding:0 6px;border:1px solid #666;" onclick="deleteOrder(' + map.olist[i].goodsorders.orId + ')">删除订单</a>';
								str = str + '<a style="padding:0 15px;border:1px solid #FF6700;color: #FF6700;">已收货</a></div></div>';
							}
							ul.innerHTML += str;
						}

						if(ul && map.olist.length == 0) {
							ul.setAttribute('tapcount', 0); //总页数
						}
					}

				});
			}

			function ajax_load2(url, ul, page, size, me) {
				if(ul) {

					ul.setAttribute('tappage', parseInt(page) + 1); //页数+1
				}
				if(page == '1') {
					//plus.nativeUI.closeWaiting();
					var count = ul.getAttribute('tapcount');
					if(count == 0)
						me.endPullUpToRefresh(true);
					else
						me.endPullUpToRefresh(false);
					return true;
				}
				mui.ajax("${pageContext.request.contextPath}/" + url, {
					data: {
						page: page,
						size: size
					},
					async: true,
					type: "post",
					timeout: 30000,
					success: function(data) {
						//plus.nativeUI.closeWaiting();

						var map = eval("(" + data + ")");
						me.endPullUpToRefresh(map.olist.length < size);

						for(var i = 0; i < map.olist.length; i++) {
							var str = '<div id="order' + map.olist[i].goodsorders.orId + '" class="box-b"><p>下单时间  ' + map.olist[i].goodsorders.orTime + '</p>' +
								'<div style="background: #f6f6f6; padding-top:8px;padding-bottom: 3px;">';
							for(var j = 0; j < map.odlist.length; j++) {
								if(map.olist[i].goodsorders.orId == map.odlist[j].goodsorders.orId) {
									if(map.olist[i].goodsorders.zitiaddress == null) {
										str = str + '<div onclick="orderdetail(\'' + map.olist[i].goodsorders.orId + '\',\'' + map.olist[i].goodsorders.orOrdernumber + '\',\'' + map.olist[i].goodsorders.address.adId + '\',\'' + map.olist[i].goodsorders.orStatus + '\',1,\''+map.odlist[j].goods.gid+'\')" class="box-b-1"><div class="box-b-1-l"><img src="' + "${pageContext.request.contextPath}" + map.odlist[j].goods.gimages + '" /></div>' +
											'<div class="box-b-1-r"><p style="font-size:13px;"> ' + map.odlist[j].goods.gname + '</p><p style="width: 25%;text-align: right;"><span>￥' + map.odlist[j].odCost + '</span><p class="jianjiea" style="width:88%;">' + map.odlist[j].goods.jianjie + '</p><br /><br /><span style="color:#666">×' + map.odlist[j].odNum + '</span></p></div></div>';
									} else if(map.olist[i].goodsorders.address == null) {
										str = str + '<div onclick="orderdetail(\'' + map.olist[i].goodsorders.orId + '\',\'' + map.olist[i].goodsorders.orOrdernumber + '\',\'' + map.olist[i].goodsorders.zitiaddress.zitiId + '\',\'' + map.olist[i].goodsorders.orStatus + '\',2,\''+map.odlist[j].goods.gid+'\')" class="box-b-1"><div class="box-b-1-l"><img src="' + "${pageContext.request.contextPath}" + map.odlist[j].goods.gimages + '" /></div>' +
											'<div class="box-b-1-r"><p style="font-size:13px;">' + map.odlist[j].goods.gname + '</p><p style="width: 25%;text-align: right;"><span>￥' + map.odlist[j].odCost + '</span><p class="jianjiea" style="width:88%;">' + map.odlist[j].goods.jianjie + '</p><br /><br /><span style="color:#666">×' + map.odlist[j].odNum + '</span></p></div></div>';
									}
								}
							}
							str = str + '<div class="box-b-2"><span>共' + map.olist[i].goodsorders.orTotalnum + '件商品</span><span>合计：￥' + map.olist[i].goodsorders.orPrice + '（含运费￥' + map.olist[i].goodsorders.orYunfei + '）</span></div>' +
								'<div class="box-b-3">' +
								'<a style="padding:0 6px;border:1px solid #666;" onclick="kefu(' + map.olist[i].goodsorders.orId + ')">联系客服</a>';

							if(map.olist[i].goodsorders.orStatus == 0) {
								str = str + '<a style="padding:0 6px;border:1px solid #666;" onclick="deleteOrder(' + map.olist[i].goodsorders.orId + ')">删除订单</a>';
								str = str + '<a style="padding:0 15px;border:1px solid #FF6700;color: #FF6700;" onclick="goPay(' + map.olist[i].goodsorders.orId + ',\'' + map.olist[i].goodsorders.orOrdernumber + '\')">待付款(去支付)</a></div></div>';
							}
							if(map.olist[i].goodsorders.orStatus == 1) {
								str = str + '<a style="padding:0 15px;border:1px solid #FF6700;color: #FF6700;">待发货</a></div></div>';
							}
							if(map.olist[i].goodsorders.orStatus == 2) {
								str = str + '<a style="padding:0 6px;border:1px solid #666;" onclick="selectOrder(' + map.olist[i].goodsorders.orId + ')">查看物流</a>';

								str = str + '<a onclick="shouhuo(' + map.olist[i].goodsorders.orId + ')" style="padding:0 15px;border:1px solid #FF6700;color: #FF6700;">确认收货</a></div></div>';
							}
							if(map.olist[i].goodsorders.orStatus == 3) {
								str = str + '<a style="padding:0 15px;border:1px solid #FF6700;color: #FF6700;">已收货</a></div></div>';
							}
							ul.innerHTML += str;
						}

						if(ul && ul.getAttribute('tapcount') != '') {
							ul.setAttribute('tapcount', map.count); //总页数
						}
					}

				});
			}
			//订单详情	
			function orderdetail(orid, orderId, addressid, orstatus, type,gid) {
				if(orstatus == 1){
					//跳转至商品详情
					//window.top.location="${pageContext.request.contextPath}/weixin/goodsdetail/detail.jsp?gid="+gid+"&state="+orstatus;
					/*mui.openWindow({
						url: '/goodsdetail/detail.html',
						id: '/goodsdetail/detail.html',
						extras: {
							gid: gid,
							state:orstatus
						}
					});*/
					//return;
				}
				
				window.top.location="${pageContext.request.contextPath}/weixin/center/order-detail.jsp?orid="+orid+"&orderId="+orderId+"&addressid="+addressid+"&type="+type+"&orstatus="+orstatus;
				/*mui.openWindow({
					url: 'order-detail.html',
					id: 'order-detail.html',
					extras: {
						orid: orid,
						orderId: orderId,
						addressid: addressid,
						type: type,
						orstatus: orstatus
					}
				});*/
			}
			//确认收货
			function shouhuo(orid) {
				mui.post("${pageContext.request.contextPath}/" + "apporder.do?p=editOrderStatus", {
					orid: orid
				}, function(data) {
					mui.toast("收货成功");
					location.reload();
				});
			}
			//查看物流
			function selectOrder(orid){
			
			window.top.location="${pageContext.request.contextPath}/weixin/center/logistics.jsp?orid="+orid;	
				/*mui.openWindow({
					url: 'logistics.html',
					id: 'logistics.html',
					extras: {
						orid: orid,
					}
				});*/
			}
			
			//删除订单
			function deleteOrder(orid) {
				
				mui.confirm("删除该订单？", function(i) {
					if(i.index == 1) {
						mui.post("${pageContext.request.contextPath}/" + 'apporder.do?p=deleteOrder', {
							orid: orid
						}, function(data) {
							mui.toast("删除成功");
							$("#order" + orid).hide();
							location.reload();
						});
					}
				});
			}
			//去支付
			function goPay(oid, orid) {
				window.location = "${pageContext.request.contextPath}/weixin/goodsdetail/submit-order.jsp?orid="+oid+"&orderId="+orid+"&id=submit-order.html";
				return;
				/*mui.openWindow({
					url: '/goodsdetail/submit-order.html',
					id: 'submit-order.html',
					extras: {
						orid: oid,
						orderId: orid
					}
				});*/
			}

			//客服
			function kefu(orid) {
				window.top.location="${pageContext.request.contextPath}/weixin/goodsdetail/kefu.jsp?orid="+orid;		
				/*mui.openWindow({
					url: '/goodsdetail/kefu.html',
					id: 'order.html',
					extras: {
						orid: orid
					}
				});*/
			}
		</script>
	</body>

</html>