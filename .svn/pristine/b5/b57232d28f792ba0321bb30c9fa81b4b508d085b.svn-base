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
		<link rel="stylesheet" href="../css/mui.min.css" />
		<link rel="stylesheet" href="../css/gg.css">
		<link rel="stylesheet" href="../css/detail.css">
		<link rel="stylesheet" href="../goodsdetail/goodsdetail.css" />
		<link rel="stylesheet" href="../css/swiper.min.css">
		<link rel="stylesheet" href="../css/icons-extra.css" />
		<link rel="stylesheet" href="../css/iconfont.css">
		<link rel="stylesheet" href="../crowdfunding/crowdfunding.css" />

		<script src="../js/jquery-1.9.0.min.js"></script>
		<script src="../js/layzr.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/mui.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/swiper.min.js"></script>
		<script src="../js/detail.js"></script>
		
		<script src="../layer/layer.js"></script>
		<title>商品详情页</title>
	</head>

	<body>
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
			
			.goods-detail{
				width: 100%;
				min-height: 200px;
				overflow: hidden;
			}
			.goods-name{
				margin: 15px 0px;
				line-height: 25px;
				width: 100%;
				padding: 0px 10px;
				font-size: 14px;
				display: -webkit-box;
				-webkit-box-orient: vertical;
				-webkit-line-clamp: 2;
				overflow: hidden;
			}
			.pic-price{
				width: 100%;
				min-height: 124px;
				overflow: hidden;
			}
			.goods-pic{
				float: left;
				width: 25%;
				height: 80px;
				margin-top: 10px;
				margin-left: 10px;
			}
			.goods-pic img{
				width: 100%;
				height: 100%;
			}
			.goods-price{
				float: right;
				height: auto;
				margin: auto;
				width: 67%;
				margin-top: -4px;
			}
			.goods-price p{
				padding: 1px 0px;
				overflow: hidden;
				text-overflow: ellipsis;
				white-space:nowrap;
				font-size: 12px;
			}
			.goods-extra{
				margin: 10px 10px;
				margin-bottom: 40px;
				font-size: 15px;
			}
			.shixian{
				height: 100px;
				width: 100%;
				border-top: 1px solid #C8C7CC;
				border-bottom: 1px solid #C8C7CC;
			}
		</style>
		<div class="mui-content">
			<div class="mui-slider">
				<header class="mui-bar mui-bar-nav" id="toubu" style="background: #FF7900;">
					<a class="mui-icon mui-icon-back mui-action-back mui-pull-left" id="fuwupagexx" index="1" style="color: white;"><a><span class="mui-icon-extra mui-icon-extra-cart"id="gouwuche" style="float: right;margin-top: 10px;color: white;"></span></a></a>
					<span class="mui-title" id="shopname" index="1" style="color: white;">商品详情</span>
				</header>
				<div id="sliderProgressBar" style="width: 100%;background-color: #FF7900;" class="mui-slider-progress-bar mui-col-xs-4"></div>
				<div class="mui-slider-group">
					<div id="item1mobile" class="mui-slider-item mui-control-content mui-active">
						<!--基本信息-->
						<!--商品图片-->
						<div id="slider" class="mui-slider" style="margin-top: 0px;">
							<div class="mui-slider-group mui-slider-loop" id="goods_img">
								<div class="mui-slider-item mui-slider-item-duplicate">
									<a href="#">
										<img src="../images/detail4.jpg" style="width: 100%; height: 300px;">
									</a>
								</div>
								<!-- 第一张 -->
								<div class="mui-slider-item">
									<a href="#">
										<img src="../images/detail4.jpg" style="width: 100%; height: 300px;">
									</a>
								</div>
								<!-- 第二张 -->
								<div class="mui-slider-item">
									<a href="#">
										<img src="../images/detail2.jpg" style="width: 100%; height: 300px;">
									</a>
								</div>
								<!-- 第三张 -->
								<div class="mui-slider-item">
									<a href="#">
										<img src="../images/detail3.jpg" style="width: 100%; height: 300px;">
									</a>
								</div>
								<!-- 第四张 -->
								<div class="mui-slider-item">
									<a href="#">
										<img src="../images/detail1.jpg" style="width: 100%; height: 300px;">
									</a>
								</div>
								<div class="mui-slider-item mui-slider-item-duplicate">
									<a href="#">
										<img src="../images/detail1.jpg" style="width: 100%; height: 300px;">
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
						
						<div class="goods-detail">
							<p class="goods-name">广西百香果热带养生商城新鲜西番莲鸡蛋果现摘5斤精装大红果酸爽香甜广西百香果热带养生商城新鲜西番莲鸡蛋果现摘5斤精装大红果酸爽香甜红糖水点麻酱面根</p>
							<div class="shixian">
							<div class="pic-price">
								<div class="goods-pic">
									<img src="../images/0.jpg" />
								</div>
								<div class="goods-price">
									<p id="lastp" style="text-decoration: line-through;"></p>
									<p style="color: #333333;"><span id="jj">当前价格：</span>￥<span id="g-price">48.80</span>（已有<span id="g-g">8</span>）</p>
									<p id="nextp" style="color: #999999;"></p>
									<p id="firstp" style="color: #999999;margin-top: -13px;" ></p>
								</div>
							</div>
							</div>
							<!-- <div class="goods-extra">快递   ：0.00</div> -->
						</div>
						
						<!--详情-->
						<div class="detail-img" id="d-img" style="font-size: 18px;">
							<ul id="detail">

							</ul>
						</div>
						
						<div style="height: 40px;background-color: white;text-align: center;line-height: 40px;font-size: 14px;margin-top: -25px;">
							<a onclick="qiehuan(this,1)" id="tw" style="color: black;margin-right: 190px;" href="#">
								图文详情
							</a>
							<a onclick="qiehuan(this,2)" id="cs" style="color: black;" href="#">
								产品参数
							</a>
						</div>
						<div class="detail-img" id="detail-img" style="margin-top: 1px;">
							<ul id="dimg">
						
							</ul>
						</div>
						
						<!--产品参数 -->
						<div class="detail-img" id="canshu" style="display: none;">
							<ul class="mui-table-view">
								<li class="mui-table-view-cell">产地 <span class="" style="margin-left: 40px;" id="chandi"></span>
								</li>
								<li class="mui-table-view-cell">品牌 <span class="" style="margin-left: 40px;" id="pinpai"></span>
								</li>
								
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!--客服、立即购买-->
		<div class="mui-content">
			<div class="mui-content-padded">
				<nav class="mui-bar mui-bar-tab">
					<a id="zc-kefu" class="mui-tab-item" style="width: 20%;" index="0">
						<span class="mui-icon-extra mui-icon-extra-custom mui-icon mui-icon-star"></span>
						<span class="mui-tab-label">客服</span>
					</a>
					<a id="zcljgm" class="mui-tab-item" style="width: 32%;background-color: #F40;" href="center.html" index="5">
						<span class="mui-tab-label" style="color: #FFFFFF;">立即购买</span>
					</a>
				</nav>
			</div>
		</div>
		</div>
		<script src="../js/mui.min.js"></script>
		<script>
			mui.init({
				swipeBack: true //启用右滑关闭功能
			});
			//图片轮播
			var slider = mui("#slider");
			slider.slider({
				interval: 1000
			});
			var userid = '${userinfo.usersId}'; //会员ID
			var gid = null; //商品ID
			var gname=null;	//商品名称
			var gdanwei = null; //商品单位
			var gimages = null; //商品图片
			var rebateid=null;
			var rebate=null; //折扣
			var timestr=null; //众筹是否已结束
			var jianjie=null;//简介
			mui.plusReady(function() {
				var userstype = plus.storage.getItem("userstype"); //会员类型 普通 or VIP 判断商品的价格
				var goods = plus.webview.currentWebview();
				gid = goods.gid; //商品ID
				gname=goods.gname; //商品名称
				gdanwei = goods.gdanwei; //商品单位
				gimages = goods.gimages; //商品图片
				rebateid=goods.rebateid;
				rebate=goods.rebate;	//商品折扣
				timestr=goods.timestr;	
				jianjie=goods.jianjie;
				$(".goods-name").html(goods.jianjie); //商品名称
				if(userstype == 0) {
					$("#g-price").html(goods.gprice);
					$(".sep").html(' <a class="youhui">普通价格</a>');
					$("#add-price").html('￥' + goods.gprice);
				} else {
					$("#g-price").html(goods.gvipprice);
					$(".sep").html(' <a class="youhui">VIP价格</a>')
					$("#add-price").html('￥' + goods.gvipprice);
				}
				$("#add-count").html('库存:' + gdanwei); //商品单位
				$(".goods-pic").html('<img id="" src="' + goods.gimages + '">'); //商品图片

				mui.post(SERVER_URL + 'appzhongchou.do?p=findByIdRebate&gid=' + gid, {
			
				}, function(data) {
					var rebatelist = eval("(" + data + ")");
					for(var j = 0; j < rebatelist.length; j++) {
						if(rebatelist[j].goods.gsellnum >= rebatelist[j].gcfrBeginkg && rebatelist[j].goods.gsellnum <= rebatelist[j].gcfrEndkg) {
							//  上一	价格		
							if(j>0)
							{
								var lastprice=null;
								for (var i=0;i<j;i++) {
								$("#lastp").css('display','block');
								if(userstype == 0) {
									lastprice = (rebatelist[i].goods.gprice * 1) * (rebatelist[i].gcfrRebate * 1); //上一个价格
								} else {
									lastprice = (rebatelist[i].goods.gvipprice * 1) * (rebatelist[i].gcfrRebate * 1); //上一个价格
								}
								//还差多少斤 
								var lastkg = (rebatelist[i].gcfrEndkg * 1) - (rebatelist[i].gcfrBeginkg * 1);
								var str='上一价格：￥<span id="g-lastprice">'+lastprice.toFixed(2)+'</span>（已购买'+lastkg+''+gdanwei+'）<br />';
								var lastphtml=document.getElementById("lastp");
								lastphtml.innerHTML+=str;
								}
							}
							else{
								$("#lastp").css('display','none');
							}
							
							
							//当前价格
							var price = null; //当前价格
							var nextprice = null; //下一个价格
							//判断商品价格
							if(userstype == 0) {
								price = (rebatelist[j].goods.gprice * 1) * (rebatelist[j].gcfrRebate * 1); //当前价格
							} else {
								price = (rebatelist[j].goods.gvipprice * 1) * (rebatelist[j].gcfrRebate * 1); //当前价格
							}
							//当前价格
							$("#g-price").html(price);
							//已购买多少斤
							$("#g-g").html(rebatelist[j].goods.gsellnum+gdanwei);
							
							
							//下一个价格
							if((rebatelist.length-1)-(j+1)>0)
							{
								for (var k=0;k<(rebatelist.length-1)-(j+1);k++) {
									if(userstype == 0) {
										nextprice = (rebatelist[(j+k)+1].goods.gprice * 1) * (rebatelist[(j+k)+1].gcfrRebate * 1); //下一个价格
									} else {
										nextprice = (rebatelist[(j+k)+1].goods.gvipprice * 1) * (rebatelist[(j+k)+1].gcfrRebate * 1); //下一个价格
									}
									//还差多少斤 
									var nextkg = (rebatelist[(j+k)+1].gcfrBeginkg * 1) - (rebatelist[j].goods.gsellnum * 1);
									var str='下一价格：￥<span id="g-lastprice">'+nextprice.toFixed(2)+'</span>（还差'+nextkg+''+gdanwei+'）<br /><br />';
									var nextphtml=document.getElementById("nextp");
									nextphtml.innerHTML+=str;	
								}
							}
							//最后价格
							if(rebatelist.length >j + 1 && rebatelist.length>2) {
							var firstprice=null;
								if(userstype == 0) {
									firstprice = (rebatelist[rebatelist.length - 1].goods.gprice * 1) * (rebatelist[rebatelist.length - 1].gcfrRebate * 1); //当前价格
								} else {
									firstprice = (rebatelist[rebatelist.length - 1].goods.gvipprice * 1) * (rebatelist[rebatelist.length - 1].gcfrRebate * 1); //当前价格
								}
								var firstkg = (rebatelist[rebatelist.length - 1].gcfrBeginkg * 1) - (rebatelist[j].goods.gsellnum * 1);
								var str='最后价格：￥<span id="g-firstprice">'+firstprice.toFixed(2)+'</span>（还差'+firstkg+''+gdanwei+'）<br />';
								var firstphtml=document.getElementById("firstp")  ;
								firstphtml.innerHTML+=str;
							}
						}
							
						//如果已购买的数量超过最后一个商品折扣的结束重量  得到最后价格
						if(rebatelist[j].goods.gsellnum > rebatelist[rebatelist.length - 1].gcfrEndkg) {
							if(j+1<rebatelist.length){
								var lastprice=null;
								$("#lastp").css('display','block');
								if(userstype == 0) {
									lastprice = (rebatelist[j].goods.gprice * 1) * (rebatelist[j].gcfrRebate * 1); //上一个价格
								} else {
									lastprice = (rebatelist[j].goods.gvipprice * 1) * (rebatelist[j].gcfrRebate * 1); //上一个价格
								}
								//还差多少斤 
								var lastkg = (rebatelist[j].gcfrEndkg * 1) - (rebatelist[j].gcfrBeginkg * 1);
								var str='上一价格：￥<span id="g-lastprice">'+lastprice+'</span>（已购买'+lastkg+''+gdanwei+'）<br />';
								var lastphtml=document.getElementById("lastp");
								lastphtml.innerHTML+=str;
							}
							$("#jj").html('最后价格：');
							if(userstype == 0) {
								price = (rebatelist[rebatelist.length - 1].goods.gprice * 1) * (rebatelist[rebatelist.length - 1].gcfrRebate * 1); //当前价格
							} else {
								price = (rebatelist[rebatelist.length - 1].goods.gvipprice * 1) * (rebatelist[rebatelist.length - 1].gcfrRebate * 1); //当前价格
							}
							$("#g-price").html(price);
							$("#g-g").html(rebatelist[j].goods.gsellnum+gdanwei);
						}
					}
				});	
				//轮播图
				mui.ajax(SERVER_URL + 'appgoods.do?p=goodsdetail&id=' + goods.gid, {
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
									}
								}
								$(".goods-name").html(goods.jianjie);
								$("#d-img").html(goods.gdetail);
						if(gimglist.length > 0) {
							//图片轮播
							var imghtml = "";
							imghtml = imghtml + '<div class="mui-slider-item mui-slider-item-duplicate"><a href="#">' +
								'<img src="' + SERVER_URL + gimglist[0].gimages + '"></a></div>';
							var imgnumhtml = "";
							//document.getElementById("d-img").innerHTML+=gimglist[i].gimgDetail;
							for(var i = 0; i < gimglist.length; i++) {
								imghtml = imghtml + '<div class="mui-slider-item"><a href="#">' +
									'<img src="' + SERVER_URL + gimglist[i].gimages + '"></a></div>';
								if(i == 0)
									imgnumhtml = imgnumhtml + '<div class="mui-indicator mui-active"></div>';
								else
									imgnumhtml = imgnumhtml + '<div class="mui-indicator"></div>';
							}
							imghtml = imghtml + '<div class="mui-slider-item mui-slider-item-duplicate"><a href="#">' +
								'<img src="' + SERVER_URL + gimglist[gimglist.length - 1].gimages + '"></a></div>';
							var goodsimg = document.getElementById("goods_img");
							goodsimg.innerHTML = imghtml;
							var goodsimgnum = document.getElementById("goods_img_num");
							goodsimgnum.innerHTML = imgnumhtml;

							//详情
							//var str = "";
							//for(var i = 0; i < gimglist.length; i++) {
							//	str += '<li>' + gimglist[i].gimgDetail + '</li>';
							}
							//document.getElementById("detail").innerHTML = str;
						//}
					}
				});
			});
			//立即购买
			document.querySelector("#zcljgm").addEventListener("tap",function(){
				var price=$("#g-price").html();
				if(userid == null) {
					goLogin();
					return;
				}
				if(timestr=="已结束!")
				{
					plus.nativeUI.toast("众筹已结束");
					return;
				}
				mui.openWindow({
					id: 'crowdfunding.html',
					url: 'crowdfunding-order.html',
					extras: {
						gid: gid,
						gname: gname,
						gimages: gimages,
						gprice: price,
						grebate: rebate
					}
				});
			});
			//跳转到购物车页面
				document.querySelector("#gouwuche").addEventListener("tap", function() {
					if(userid != null) {
						mui.openWindow({
							url: '/shopingcart/cart.html'
						});
					} else {
						goLogin();
					}
				});
			//客服 消息
		document.querySelector("#zc-kefu").addEventListener('tap',function(){
			var price=$("#g-price").html();
			var gynum=$("#g-g").html();
			if(userid!=null){
				mui.openWindow({
					url: '/goodsdetail/kefu.html',
					id: 'zcdetail.html',
					extras:{
						gid: gid,
						gname: gname,
						gimages: gimages,
						gprice: price,
						gynum:gynum
					}
				});
			}else{
				goLogin();
			}
		})
		//去登录界面
		function goLogin(){
			mui.toast("请先登录！");
			mui.openWindow({
				url: '/home/login.html',
				id: 'zcdetail.html'
			});
		}
		
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
		
		</script>

	</body>

</html>