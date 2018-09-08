<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
		<meta content="telephone=no,email=no" name="format-detection">

		<!--标准mui.css-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/mui.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/gg.css">
		<link rel="stylesheet" href="goodsdetail.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/swiper.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/icons-extra.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/iconfont.css">

		<script src="${pageContext.request.contextPath}/weixin/js/jquery-1.9.0.min.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/layzr.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/swiper.min.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/detail.js"></script>
		
		<script src="${pageContext.request.contextPath}/weixin/layer/layer.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/shuaxin.js"></script>
		<title>商品详情页</title>
	</head>
	<style>
		.mui-control-content {
			background-color: #efeff4;
			min-height: 215px;
		}
		
		.mui-control-content .mui-loading {
			margin-top: 50px;
		}
		
		#detail li {
			background-color: white;
			padding: 5px 10px;
		}
		
		.vip {
			border: 1px solid #FF7900;
			font-size: 12px;
			margin-left: 5px;
		}
		
		.price {
			color: #FF6700;
			font-size: 18px;
		}
		
		#g-price {
			color: #FF7900;
		}
		
		#dimg img
		{
			width: 100%;
			margin-top: -4px;
		}
		.goods-detail{
			width: 80%;
			display: -webkit-box;
			-webkit-box-orient: vertical;
			-webkit-line-clamp: 2;
			overflow: hidden;
		}
		
		.goods-sharing{
				position: absolute;
				width: 20%;
				margin-left:75%;
				margin-top: -14%;
		}
			
		.goods-sharing img{
				width: 30%;
				margin-left: 30%;
		}
	</style>

	<body>
		<header class="mui-bar mui-bar-nav" id="toubu" style="background: #FF7900;">
			<a class="mui-icon mui-icon-back mui-action-back mui-pull-left" id="fuwupagexx" index="1" style="color: white;"></a><a><span class="mui-icon-extra mui-icon-extra-cart"id="gouwuche" style="float: right;margin-top: 10px;color: white;"></span></a>
			<span class="mui-title" id="shopname" index="1" style="color: white;">商品详情</span>
		</header>
		<!--商品图片-->
		<div id="slider" class="mui-slider" style="margin-top: 44px;">
			<div class="mui-slider-group mui-slider-loop" id="goods_img">
				<div class="mui-slider-item mui-slider-item-duplicate">
					<a href="#">
						<img src="${pageContext.request.contextPath}/weixin/images/detail4.jpg" style="width: 100%;height: 300px;">
					</a>
				</div>
				<!-- 第一张 -->
				<div class="mui-slider-item">
					<a href="#">
						<img src="${pageContext.request.contextPath}/weixin/images/detail4.jpg" style="width: 100%;height: 300px;">
					</a>
				</div>
				<!-- 第二张 -->
				<div class="mui-slider-item">
					<a href="#">
						<img src="${pageContext.request.contextPath}/weixin/images/detail2.jpg" style="width: 100%;height: 300px;">
					</a>
				</div>
				<!-- 第三张 -->
				<div class="mui-slider-item">
					<a href="#">
						<img src="${pageContext.request.contextPath}/weixin/images/detail3.jpg" style="width: 100%;height: 300px;">
					</a>
				</div>
				<!-- 第四张 -->
				<div class="mui-slider-item">
					<a href="#">
						<img src="${pageContext.request.contextPath}/weixin/images/detail1.jpg" style="width: 100%;height: 300px;">	
					</a>
				</div>
				<div class="mui-slider-item mui-slider-item-duplicate">
					<a href="#">
						<img src="${pageContext.request.contextPath}/weixin/images/detail1.jpg" style="width: 100%;height: 300px;">
					</a>
				</div>
			</div>
			<div class="mui-slider-indicator" style="" id="goods_img_num">
				<div class="mui-indicator mui-active"></div>
				<div class="mui-indicator"></div>
				<div class="mui-indicator"></div>
				<div class="mui-indicator"></div>
			</div>
		</div>
		<!--商品名称、价格-->
		<div class="goods-all" style="background-color: white;padding-bottom: 5px; overflow: hidden;margin: 0px 0px; height: auto;">
			<p class="goods-name" style="width: 80%;margin-top: 5%;"></p>
			<p class="goods-detail" style="font-size: 13px;"></p>
			<div class="goods-sharing" onclick="sharing()">
					            <img src="${pageContext.request.contextPath}/weixin/img/sharingGoods.png"/>			
							    <p style="margin-left: 15%;font-size: 11px;">分享有赏</p>
				</div>

			<p class="goods-price">
				<!--<span>价格 ￥<span id="g-price">70</span></span>
				<span style="margin-left: 10px;color: #ff6700;font-size: 18px;">
					￥<span id="vipprice"></span><span class="vip">VIP价格</span>
				</span>-->
			</p>
			<ul class="goods-extra">
				<li>快递：<span>0.00</span></li>
				<li style="text-align: center;width: 38.33%;">累计销量<span id="leiji">10000</span></li>
				<li style="text-align: right;width: 28.33%;">神农百果园</li>
			</ul>
		</div>
		<div style="height: 40px;background-color: white;text-align: center;line-height: 40px;font-size: 14px;margin-top: 1px;">
			<a onclick="qiehuan(this,1)" id="tw" style="color: black;margin-right: 190px;" href="#">
				图文详情
			</a>
			<a onclick="qiehuan(this,2)" id="cs" style="color: black;" href="#">
				产品参数
			</a>
		</div>
		<!--详情
						<div style="margin: 10px auto;width: 56px;">
							图文详情
							<li>
					<img src="${pageContext.request.contextPath}/weixin/images/1.jpg" style="width: 100%;height: 300px;" />
				</li>	
				<div class="mui-slider-item mui-slider-item-duplicate">
			<a href="#">
				<img src="${pageContext.request.contextPath}/weixin/images/1.jpg" style="width: 100%;height: 300px;" />
			</a>
			<p class="mui-slider-title" style="background-color: initial;color: red;">
				静静看这世界
			</p>
				</div>
			
	</li>
						</div>-->
		<div class="detail-img" id="detail-img" style="margin-top: 1px;">
			<ul id="dimg">
		
			</ul>
		</div>
		
		<!--
                        	产品参数
                        -->
		<div class="detail-img" id="canshu" style="display: none;">
			<ul class="mui-table-view">
				<li class="mui-table-view-cell">产地 <span class="" style="margin-left: 40px;" id="chandi"></span>
				</li>
				<li class="mui-table-view-cell">品牌 <span class="" style="margin-left: 40px;" id="pinpai"></span>
				</li>
				
			</ul>
		</div>
		
		<!--购物车
		<a class="buy_cart" style="width: 60px;height: 50px;bottom: 53px;position: fixed;background-color: #708090;z-index: 3;opacity: 0.9;" id="gouwuche">
			<i class="icon_cart" id="shuliang">
	          <span class="num" style="color: white;" id="number">0</span>
	        </i>
		</a>-->
		
		<!--收藏、客服、加入购物车、立即购买-->
		<div class="mui-content">
			<div class="mui-content-padded">
				<nav class="mui-bar mui-bar-tab">
					<a id="kefu" class="mui-tab-item" style="width: 20%;color: #929292;" index="0">
						<span class="mui-icon-extra mui-icon-extra-custom mui-icon mui-icon-star"></span>
						<span class="mui-tab-label">客服</span>
					</a>
					<div id="shoucang2" style="width: 60px;z-index: 3;">
						<span style="color: #929292;margin-left: 20%;margin-top: 8px;" class="mui-icon-extra mui-icon-extra-heart"></span>
					</div>
					<div id="notshoucang2" style="width: 60px;z-index: 3;display: none;">
						<span style="color: red;margin-top: 8px;margin-left: 20%;" class="mui-icon-extra mui-icon-extra-heart-filled"></span>
					</div>
					<span class="mui-tab-label" style="font-size: 11px;color: #929292;position: absolute;left: 24%;top: 30px;">收藏</span>
					<a id="addcar" class="mui-tab-item" style="border: 0px; width: 32%;top: 0px; background-color: #FF7900;" href="#here" index="3">
						<span class="mui-tab-label" style="color: #FFFFFF;height: 20px;">加入购物车</span>
					</a>
					<a id="ljgm" class="mui-tab-item" style="width: 32%;background-color: #F40;" href="center2.jsp" index="5">
						<span class="mui-tab-label" style="color: #FFFFFF;">立即购买</span>
					</a>
				</nav>
			</div>
		</div>
		<!--加购物车-->
		<div id="picture" style="position: absolute;z-index: 20;width: 100%;top: 44px;display: none;">
			<div id="blo" name="here" class="bg">
			</div>
			<div class="add-det">
				<!--商品图片、单价、库存-->
				<div style="height: 120px; padding-bottom: 20px;border-bottom: 1px solid lightgrey;">
					<p id="pimg"><img id="add-img" src="${pageContext.request.contextPath}/weixin/images/0.jpg"></p>
					<p id="add-gname">商品名称</p>
					<p id="add-price">￥<span id="add-p">86</span></p>
					<div class="flex-container" style="float: right;margin-right: 5px;margin-top: -95px;">
						<a id="icon-close" style="color: lightgrey;"><span class="mui-icon mui-icon-close"></span></a>
					</div>
				</div>
				<!--购买数量-->
				<ul class="goods-count">
					<li>
						<span style="line-height: 60px;height: 60px;color: #000000;">购买数量</span>
					</li>
					<li style="text-align: right;margin-top: 13px;">
						<div class="mui-numbox" data-numbox-min='1'>
							<button id="jian" class="mui-btn mui-btn-numbox-minus" type="button">-</button>
							<input id="catnum" onkeyup="outnum()" onclick="select()" class="mui-input-numbox" type="number" value="1" />
							<button id="jia" class="mui-btn mui-btn-numbox-plus" type="button">+</button>
						</div>
					</li>
				</ul>
			</div>
			<!--确定加入购物车-->
			<div class="mui-content">
				<div class="mui-content-padded">
					<nav class="mui-bar mui-bar-tab">
						<a id="queding" class="mui-tab-item" style="width: 100%;background-color: #F40;" index="5">
							<span class="mui-tab-label" style="color: #FFFFFF;">确定</span>
						</a>
					</nav>
				</div>
			</div>
		</div>
	</body>
	<script>
		mui.init({
			swipeBack: true //启用右滑关闭功能
		});
		//图片轮播
		var slider = mui("#slider");
		var mask=mui.createMask();//遮罩层
		slider.slider({
			interval: 1000
		});
		function qiehuan(a, type) {
			$(a).css('color', 'red');
			if(type == 1) {
				$("#canshu").css('display', 'none');
				$("#detail-img").css('display', 'block');
				$("#tw").css('color', 'red');
				$("#cs").css('color', 'black');
			} else {
				$("#canshu").css('display', 'block');
				$("#detail-img").css('display', 'none');
				$("#cs").css('color', 'red');
				$("#tw").css('color', 'black');
			}
		}
		var userid = '${userinfo.usersId}'; //会员ID
		var gid = null; //商品ID
		var gimages = null; //商品图片
		var gdanwei = null; //商品单位
		var userstype = null; //会员类型 普通 or VIP 判断商品的价格
		var goods = null; //商品信息
		var gprice   = null; //商品价格
		var goodsinfo = null; //分享弹出按钮内容
		window.addEventListener("gdetail", function(e) {
			gid = e.detail.gid;
			ss(gid);
		});
		var state = 0;
		  window.onload = function (){
		//mui.plusReady(function() {
			mask.show();
			//plus.nativeUI.showWaiting("加载中,请稍等");
			
			userstype = '${userinfo.usersType}'; //会员类型 普通 or VIP 判断商品的价格
			
			gid = '${param.gid}'; //商品ID
			state = '${param.state}';
			if(state == 0){
				$("#ljgm").css({
					"background":"#C0C0C0",
					"color":"#FFFFFF"
				});
				$("#ljgm").html("商品已下架");
				$("#addcar").css("background","#C8C8C8");
			}
			$("#tw").css('color', 'red');
			ss(gid);
			//购物车数量(用户没登录默认显示0)
			var catsum = 0;
			if(userid) {
				mui.post("${pageContext.request.contextPath}/" + "appgoods.do?p=catNumber", {
					userid: userid
				}, function(data) {
					var map = eval("(" + data + ")")
					for(var key in map) {
						if(key == "sum") {
							catsum = map[key];
							$("#number").html(catsum);
						}
					}
				});
			} else {
				$("#number").html(catsum);
			}
		//});
		}
		function ss(gid) {
			var gimglist = null; //商品图片list
			mui.ajax("${pageContext.request.contextPath}/" + 'appgoods.do?p=goodsdetail&id=' + gid, {
				type: 'post',
				timeout: 30000,
				success: function(data) {
					var map = eval("(" + data + ")");
					for(var key in map) {
						if(key == "list") {
							gimglist = map[key];
						}
						if(key == "goods") {
							goods = map[key];
							gdanwei = goods.gdanwei;
							gimages = goods.gimages;
							$(".goods-name").html(goods.gname); //商品名称
							if(goods.jianjie){
								$(".goods-detail").html(goods.jianjie); //商品简介
								if(goods.jianjie.length>21){
									$(".goods-sharing").css({'margin-top':"-18%"});
								}
								
								goodsinfo = goods.jianjie;
							}else{
								goodsinfo = goods.gname;
							}
							
							
							if(userstype == 1) {
								gprice  = goods.gvipprice;

								$(".goods-price").html('<span class="price">￥<span id="vipprice">' + goods.gvipprice + '/' + goods.gdanwei + '</span><span class="vip">VIP价格</span></span>');
								$("#add-price").html('￥<span id="add-p">' + goods.price + '</span>/' + goods.gdanwei + '');
							} else {
								gprice  = goods.price;
								$(".goods-price").html('<span id="g-price">￥' + goods.price + '/' + goods.gdanwei + '</span>');
								$("#add-price").html('￥<span id="add-p">' + goods.price + '</span>/' + goods.gdanwei + '');
							}
							$("#add-gname").html(goods.gname);
							$("#pimg").html('<img id="add-img" src="' + "${pageContext.request.contextPath}" + goods.gimages + '">'); //商品图片
							$("#leiji").html(goods.gcollectionsnum + goods.gdanwei);
							$("#chandi").html(goods.gchandi);
							$("#pinpai").html(goods.gpinpai);
							$("#dimg").html(goods.gdetail);
						}
					}
					if(gimglist.length > 0) {
						//图片轮播
						var imghtml = "";
						imghtml = imghtml + '<div class="mui-slider-item mui-slider-item-duplicate"><a href="#">' +
							'<img src="' + "${pageContext.request.contextPath}" + gimglist[0].gimages + '" style="width: 100%;height: 300px;"></a></div>';
						var imgnumhtml = "";
						var len = gimglist.length>4?4:gimglist.length;
						//document.getElementById("d-img").innerHTML+=gimglist[i].gimgDetail;
						for(var i = 0; i < len; i++) {
							imghtml = imghtml + '<div class="mui-slider-item"><a href="#">' +
								'<img src="' + "${pageContext.request.contextPath}" + gimglist[i].gimages + '" style="width: 100%;height: 300px;"></a></div>';
							if(i == 0)
								imgnumhtml = imgnumhtml + '<div class="mui-indicator mui-active"></div>';
							else
								imgnumhtml = imgnumhtml + '<div class="mui-indicator"></div>';
						}
						imghtml = imghtml + '<div class="mui-slider-item mui-slider-item-duplicate"><a href="#">' +
							'<img src="' + "${pageContext.request.contextPath}" + gimglist[0].gimages + '" style="width: 100%;height: 300px;"></a></div>';
						var goodsimg = document.getElementById("goods_img");
						goodsimg.innerHTML = imghtml;
						var goodsimgnum = document.getElementById("goods_img_num");
						goodsimgnum.innerHTML = imgnumhtml;

						//详情
//						$("#dimg").html("");
//						for(var i = 0; i < gimglist.length; i++) {
//							var sss = gimglist[i].gimgDetail;
//							var imgwenzi = sss.substring(sss.lastIndexOf("+") + 1);
//							var img = sss.substring(0, sss.lastIndexOf("+"));
//							var dimg = '<li class="mui-view-cell">' +
//								'<img class="mui-media-object" style="width: 100%;height: 300px;" src="' + img + '">' +
//								'<div class="mui-media-body">' + imgwenzi + '</div>' +
//								'</li>';
//
//							document.getElementById("dimg").innerHTML += dimg;
//						}
					//document.getElementById("detail").innerHTML = str;

					}
				}
			});
			//判断是否已收藏(用户没登录默认显示未收藏)
			if(userid) {
				mui.post("${pageContext.request.contextPath}/" + "appgoods.do?p=findByIdColl", {
					userid: userid,
					gid: gid
				}, function(data) {
					var js = eval("(" + data + ")");
					if(js.length > 0) { //已收藏
						$("#notshoucang2").css('display', 'block');
						$("#shoucang2").css('display', 'none');
					} else {
						$("#notshoucang2").css('display', 'none');
						$("#shoucang2").css('display', 'block');
					}
				});
			} else {
				$("#notshoucang2").css('display', 'none');
				$("#shoucang2").css('display', 'block');
			}
			mask.close();
		}
		//跳转到购物车页面
		document.querySelector("#gouwuche").addEventListener("tap", function() {
			if(userid) {
				window.top.location = "${pageContext.request.contextPath}/weixin/shopingcart/cart.jsp";
			} else {
				goLogin();
			}
		});
		//客服
		document.querySelector("#kefu").addEventListener("tap", function() {
			if(userid) {
				window.top.location = "${pageContext.request.contextPath}/weixin/goodsdetail/kefu.jsp";
				/*mui.openWindow({
					url: '/goodsdetail/kefu.jsp',
					id: 'detail.jsp',
					extras: {
						goodlist: goods
					}
				});*/
			} else {
				goLogin();
			}
		});
		//收藏
		$("#shoucang2").click(function() {
			if(userid) {
				mui.post("${pageContext.request.contextPath}/" + "appgoods.do?p=addCollection", {
						userid: userid,
						gid: gid
					},
					function(data) {
						mui.toast("已收藏");
						$("#shoucang2").css('display', 'none');
						$("#notshoucang2").css('display', 'block');
						//plus.webview.getWebviewById('collection/collection.jsp').reload();
					});
			} else {
				goLogin();
			}
		});
		//取消收藏
		$("#notshoucang2").click(function() {
			mui.post("${pageContext.request.contextPath}/" + "appgoods.do?p=deleteColl", {
					userid: userid,
					gid: gid
				},
				function(data) {
					mui.toast("已取消");
					$("#shoucang2").css('display', 'block');
					$("#notshoucang2").css('display', 'none');
					//plus.webview.getWebviewById('collection/collection.jsp').reload();
				});
		});
		//加购物车
		document.querySelector("#addcar").addEventListener("tap", function() {
		    if(userid) {
			document.getElementById("picture").style.display = "block";
			document.getElementById("detail-img").style.display = "none";
			}
			else
			{
			  goLogin();
			}
		});
		//隐藏加购物车
		document.querySelector("#icon-close").addEventListener("tap", function() {
			document.getElementById("picture").style.display = "none";
			document.getElementById("detail-img").style.display = "block";
		});
		document.querySelector("#blo").addEventListener("tap", function() {
			document.getElementById("picture").style.display = "none";
			document.getElementById("detail-img").style.display = "block";
		});

		function outnum() {
			var catnum = $("#catnum").val();
			if(catnum == "") {
				$("#catnum").val("1");
				return;
			}
		}
		//确定加购物车
		document.querySelector("#queding").addEventListener("tap", function() {
			//判断用户是否登录
			if(userid) {
				if(state == 0 ){
					mui.toast("该商品已下架！");
					return;
				}
				var catnum = parseInt($("#catnum").val());
				mui.post("${pageContext.request.contextPath}/" + "appgoods.do?p=addCat", {
					userid: userid,
					gid: gid,
					catnum: catnum
				}, function(data) {
					if(data == 2) {
						var sum = parseInt($("#number").html());
						$("#number").html(sum + 1);
					}
					//plus.nativeUI.toast("加入购物车成功");
					mui.toast("成功加入购物车");
					document.getElementById("picture").style.display = "none";
					document.getElementById("detail-img").style.display = "block";
					//plus.webview.getWebviewById('shopingcart/cart.html').reload();
				});
			} else {
				goLogin();
			}
		});
		window.addEventListener('userinfo', function(e) {
			location.reload();
			shuaxin();
		});
		//立即购买
		document.querySelector("#ljgm").addEventListener("tap", function() {
			if(userid) {
				if(state == 0 ){
					mui.toast("该商品已下架！");
					return;
				}
				var gname = $(".goods-name").html();
				var gprice = $("#add-p").html();
				var gcount = document.getElementById("catnum").value;
				window.location = "${pageContext.request.contextPath}/weixin/goodsdetail/ljgm-order.jsp?gprice="+gprice+"&gname="+gname+"&gimages="+gimages+"&gid="+gid+"&gdanwei="+gdanwei;
				/*mui.openWindow({
					url: 'ljgm-order.html',
					id: 'ljgm-order.html',
					extras: {
						userid: userid,
						gprice: gprice,
						gname: gname,
						gimages: gimages,
						gid: gid,
						gdanwei: gdanwei
					}
				});*/
				//alert('到时候处理');
			} else {
				goLogin();
			}
		});
		//去登录界面
		function goLogin() {
			mui.toast("请先登录！");
			mui.openWindow({
				url: '/weixin/home/login.jsp',
				id: 'detail.jsp'
			});
		}
		
		
		function copyToClip(){
    		//var Context = plus.android.importClass("android.content.Context");
   			// var main = plus.android.runtimeMainActivity();
   			// var clip = main.getSystemService(Context.CLIPBOARD_SERVICE);
    		//plus.android.invoke(clip,"setText","【"+goodsinfo+"】" +"${pageContext.request.contextPath}/" + goods.gimages +"<"+goods.gid+",1>"+" 点击链接查看商品图片,复制这条信息在米禾商城打开!");
    		//mui.toast("复制链接成功,请分享给好友")
    		//window.close();
    		//var index = parent.layer.getFrameIndex(window.name);  
            // parent.layer.close(0);
    		layer.closeAll();
		}
			
		//分享
		function sharing(){
		
			layer.open({
			  className:"layer-sharing",
			  content: 
			    '<div class="goods-image">'+
				    '<img src="${pageContext.request.contextPath}/weixin/images/guide.png">'+
				'</div>'+
				'<p class="goods-namea">'+''+'</p>'+
			    '<button type="button" onclick="copyToClip()" class="mui-btn mui-btn-block mui-btn-primary">知道了</button>'
			});
		

		}
	</script>
	
	
	
	
	<style type="text/css">
			.layer-sharing{
				width: 90%;
				height: 400px;
				border-radius: 5px 5px 5px 5px;
			}
			
			.goods-image{
				width: 110%;
				height: 200px;
				margin-left: -5%;
				margin-top: -7%;
				border-radius: 5px 5px 0px 0px;
			}
			.goods-image img{
				width: 100%;
				height: 200px;
				border-radius: 5px 5px 0px 0px;
			}
			.goods-namea{
				width: 100%;
				margin-top: 10%;
				line-height: 25px;
				/*height: 60px;*/
				font-family: 幼圆;
				font-size: 14px;
				color: #484234;
				display: -webkit-box;
				-webkit-box-orient: vertical;
				-webkit-line-clamp: 2;
				overflow: hidden;
			}
			.mui-btn-block{
				width: 100%;
				margin-top: 15%;
				border-radius: 30px 30px 30px 30px;
				background: #FF7900;
				border: none;
			}
		</style>

</html>