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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/mui.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weixin/goodsdetail/confirm_order.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weixin/css/public.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weixin/css/main_style.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weixin/css/common.css">
		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/weixin/js/jquery-1.9.0.min.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/app.js"></script>	
		<script type="text/javascript" src="${pageContext.request.contextPath}/weixin/js/public.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/weixin/js/fontsize.js"></script>
		
		<script src="${pageContext.request.contextPath}/weixin/shuaxin.js"></script>
		
		<link rel="stylesheet" href="goodsdetail.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/swiper.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/icons-extra.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/iconfont.css">
		
	</head>
	<style>
		#hideDiv{
			position: fixed;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
			z-index: 998;
			background-color: rgba(0,0,0,.3);
			display:none;
		}
		
		.box-b{

			background: white;
			height: 38px;

		}
		
		
		.box-b-2{
			background: white;
			height: 38px;
		}
		#orstatus{
			font-size: 16px;
			padding: 4px 5px;
		}
		
		.box-b-3 {
			height: 40px;
			font-size: 13px;
			text-align: right;
			background: #fff;
			margin-top: 3%;
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
         
        .mui-bar{
        	background: white;
        }
        
		.pay-block{
			display: block;
		}
		
		
		
		
	</style>
	
	
	

	
	
	
	<body class="bg-gray-f0">
		<div id="hideDiv"></div>
		<!-- 顶部 -->
		<header class="mui-bar mui-bar-nav"style="background-color:#FF7900;margin-top: 0px;">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
			<h1 class="mui-title" style="color: white;">订 单 详 情</h1>
		</header>
		
		<div class="mui-scroll-wrapper mui-content"  style="bottom: 50px;background: white;">
			<div class="mui-scroll">
				
<!--			<div class="mui-input-group " style="height: 120px;background-color: orange;">
					<div style="line-height: 120px; margin-left: 40px;margin-top: 0px;">
						<span style="font-size: initial;color: white;" id="orstatus">等待买家付款</span>
					</div>
				</div>           -->
				<div class="box-b" style="margin-top: 0px;">
					<p  id="orstatus">等待买家付款</p>
				</div>	
				
					<div style="background: #EFEFF4; padding-top:8px;padding-bottom: 3px;">
						
					</div>
				
				
				<!--地址-->
				<ul id="order_dizhi" style="height: 100px;margin-top: 10px;">
					<!--

                    	<li>
						<a id="icon-location"><span class="mui-icon mui-icon-location"></span></a>
					</li>
					<li style="padding: 10px;width: 80%;">
						<p style="line-height: 30px;color: #000000;">收货人：<span>刘小二</span><span style="float: right;">17670657668</span></p>
						<p style="line-height: 20px;color: #000000;">收货地址：<span>湖南省株洲市天元区湖南工业大学</span></p>
					</li>

                    -->
				</ul>
				<div style="background: #EFEFF4; padding-top:8px;padding-bottom: 3px;">
						
					</div>
				<div class="box-b"style="width: 100%;height: 100%;">
					<p style="padding-left: 5px;">商品信息</p>
				           	<div style="background: #EFEFF4; padding-top:8px;padding-bottom: 3px;">
						
					          </div>
						<div class="box-b-1" id="catdiv">
							    
							
						</div>
					
				</div>	

		
				<div class="order_extra" style="height: 100px;" id="yunfei-div">

					<div style="margin-top: 6px;padding-top:7px;"><h6>商品总价<span><span>元</span>￥<span id="zongjia">0</span></span></h6></div>

					<div style="margin-top: 17px;"><h6>运费(快递)<span><span>元</span>￥<span id="yunfei">0</span></span></h6></div>

					<div style="margin-top: 3px;">订单总价<span><span>元</span>￥<span id="orderzongjia">0</span></span></div>

				</div>

				
				<!--<div class="box-b">-->
					<!--<p style="padding-left: 5px;">商品信息</p>-->
					<div style="background: #EFEFF4; padding-top:8px;padding-bottom: 3px;">
						
					</div>
				<!--</div>-->
				<!--
					<div class="order_extra">
					可用10积分抵扣<span>￥0.1元<input type="checkbox" style="margin-left: 1px;" /></span>
				</div>

                -->
				<!--留言-->
				<div id="liuyandiv" style=" background-color: white;width: 100%;height: 60px;">
					<ul style="padding-top: 15px;padding-left: 10px;">  
						<li style="width: 77px;font-size: 15px;" id="wenzipay">需付款</li>
						<li style="float: right;color: orange;margin-top:-27px;margin-right: 8px;font-size: 15px;">￥<span id="paymoney">0.00</span>元</li>
					</ul>
				</div>
				
				<div style="background: #EFEFF4; padding-top:8px;padding-bottom: 3px;">
						
				</div>
				<div class="" id="corp_div" style="display: none; border-bottom: 1px solid #f6f6f6;font-size: 15px; background-color: white; height: 40px;line-height: 40px;padding:0px 10px;">
					<div>配送公司：<span style="" id="corp">0</span></div>
				</div>	
				<div class="order_extra" id="danhao_div" style="display: none; height: 40px;">
					<div>快递单号：<span style="margin-right: 52%;" id="danhao">0</span></div>	
				</div>
				
			</div>
		</div>
		
		
		<!-- 页脚导航 -->
		<nav  class="mui-bar mui-bar-tab">
			<footer class="ui-c-bottom ui-border-t">
				<!--<div class="settlement clearfloat">-->
					<!--<div class="zuo clearfloat fl box-s" style="border-right: 0px solid white;">

						

						<a href="#" class="fl db lianximaijia " id="returnlianximaijia" style="display: ;width: 137%;margin-left: -30px;" index="0">

							<span class="mui-icon-extra mui-icon-extra-custom mui-icon mui-icon-star"style="vertical-align:middle"></span>

							<span class="mui-tab-label" style="font-size: px;">客服</span>

						</a>

					</div>-->
						<div class="box-b-3">
							     <a id='qx' onclick="deleteOrder()" style="padding:0 6px;border:1px solid #666;" >删除订单</a>
								<a class="lianximaijia" style="padding:0 6px;border:1px solid #666;">联系客服</a>
								<a id='gopay'  style="padding:0 15px;border:1px solid #FF6700;color: #FF6700;">待付款(去支付)</a>
								<a id='shouhuo'  style="padding:0 15px;border:1px solid #FF6700;color: #FF6700;display: none;">确认收货</a>

						</div>
					<!--<a href="#" class="fl db" index=1 id="" style="width: 30%;background: #C8C7CC;">

						删除订单

					</a>

					<a href="#" class="fl db lianximaijia" id="lianximaijia" style="width: 30%;">

						<span class="mui-icon-extra mui-icon-extra-custom mui-icon mui-icon-star"style="vertical-align:middle"></span>

						客服

					</a>

					<a href="#" class="fl db" id="gopay" style="display: none;background:#F40; color:#FFF;width: 40%;">

						付  款

					</a>

					

					<a href="#" class="fl db" index=1 id="shouhuo" style="display: none;">

						确 认 收 货

					</a>

					<a href="#" class="fl db" index=1 id="returnhuo" style="display: none;">

						申 请 退 货

					</a>-->
				<!--</div>-->
			</footer>
		</nav>
	</body>
	<script>
		mui.init({
			swipeBack:true
		});
		var userid='${userinfo.usersId}'; //会员ID
		var orid=null;	//订单ID
		var addressid=null;	//地址ID
		var type=null;	// 1=收货地址  2=自提地址
		var orstatus=null;
		var grid=null;	// 退货ID
		var orderId = null;
		var opener ;
		//mui.plusReady(function(){
		window.onload = function (){
			orid="${param.orid}";
			addressid="${param.addressid}";
			type="${param.type}";
			orstatus="${param.orstatus}";
			orderId = "${param.orderId}";
			if(orstatus==0)
			{
				document.getElementById("gopay").style.display="inline-block";
			}
			if(orstatus==1)
			{
				$("#gopay").html("等待卖家发货");
				$("#qx").css('display','none');
			}
			if(orstatus==2)
			{
				$("#orstatus").html("待收货");
				$("#qx").css('display','none');
				$("#shouhuo").css('display','inline-block');
				$("#gopay").css('display','none');
			}
			if(orstatus==3)
			{   
				$("#orstatus").html("已收货");
				$("#gopay").html("买家已经收货");
				$("#qx").css('display','none');
				$("#returnlianximaijia").css('display','block');
			}
			var odlist=null;	//购物车list
			var address=null;	//收货地址
			var zitiaddress=null; //自提地址
			var goodsreturn=null; //退货状态
			var goodsorders=null; //订单
			mui.post("${pageContext.request.contextPath}/"+"apporder.do?p=getAllOrderDetail",{
				userid:userid,
				orid:orid,
				addressid:addressid,
				type:type
			},function(data){
				var map=eval("("+data+")");
				for (var key in map) {
					if(key=="odlist")
					{
						odlist=map[key];
						getAllCat(odlist);
					}
					if(type==1){
						if(key=="address")
						{
							address=map[key];
							getAllAddress(address);
						}
					}
					if(type==2)
					{
						if(key=="zitiaddress")
						{
							zitiaddress=map[key];
							getAllZiti(zitiaddress);
						}
					}
					if(key=="goodsorders")
					{
						goodsorders=map[key];
						document.getElementById("yunfei").innerHTML=goodsorders.orYunfei.toFixed(2); //运费
						document.getElementById("orderzongjia").innerHTML=goodsorders.orPrice.toFixed(2);//订单总价
						document.getElementById("paymoney").innerHTML=goodsorders.orPrice.toFixed(2); //已付款
						
						if (goodsorders.peisongcorp)
						document.getElementById("corp").innerHTML=goodsorders.peisongcorp.pscChinesename;
						document.getElementById("danhao").innerHTML=goodsorders.orRecipient;
					}
					if(key=="goodsreturn")
					{
						goodsreturn=map[key];
						grid=goodsreturn.grId;
						if(goodsreturn.grStatus=='0'){	
							$("#returnhuo").html("等 待 审 核");
							$("#returnhuo").attr('index','2');	
						}
						if(goodsreturn.grStatus=='1')
						{
							$("#returnhuo").html("审核通过是否已发货");
							$("#returnhuo").attr('index','3');
						}
						if(goodsreturn.grStatus=='2')
						{
							$("#returnhuo").html("审核不通过");
							$("#returnhuo").attr('index','2');
						}
						if(goodsreturn.grStatus=='3')
						{
							$("#returnhuo").html("等待卖家确认收货");
							$("#returnhuo").attr('index','2');
						}
						if(goodsreturn.grStatus=='5')
						{
							$("#returnhuo").html("卖家已收货,已退款");
							$("#returnhuo").attr('index','2');
						}
						
						if(goodsreturn.grStatus=='6')
						{
							$("#returnhuo").html("卖家已收货,不同意退款");
							$("#returnhuo").attr('index','2');
							$("#hideDiv").css("display","block");  //打开遮蔽背景层 
							window.location = "${pageContext.request.contextPath}/weixin/center/returnno.jsp";
			/*mui.openWindow({	
				url:'returnno.html',
				extras:{
					grAuditorreason:goodsreturn.grAuditorreason
				},
				styles:{
						top:'20%',
						width:'80%',
						bottom:'20%',
						height:'60%',
						left:'10%'
				},
				show:{
     				aniShow:'slide-in-right',//页面显示动画
     				duration:300,//页面动画持续时间，Android平台默认100毫秒，iOS平台默认200毫秒；
   				}
			});*/
						}
					}
				}
			});
		//});
		}
		//自提地址
		function getAllZiti(ziti)
		{
			var lis='<li><a id="icon-location"><span class="mui-icon mui-icon-location"></span></a></li>'+
					'<input type="hidden" value="'+ziti.zitiId+'" id="order_id" />'+
					'<li style="padding: 10px;width: 80%;">'+
					'<p style="line-height: 30px;color: #000000;">收货人：<span>'+ziti.zitiName+'</span><span style="float: right;">'+ziti.zitiPhone+'</span></p>'+
					'<p style="line-height: 20px;color: #000000;">收货地址：<span><span style="color: red;">[默认]</span>'+ziti.zitiText+'</span></p>'+
					'</li>';
			$("#order_dizhi").html(lis);
		}
		//购物车信息
		function getAllCat(catlist)
		{
			var zongjia=0;
			for (var i=0;i<catlist.length;i++) {
				var str='<div class="box-b-1" id="catdiv" onclick="getGoodDetail(\''+catlist[i].goods.gid+'\',\''+catlist[i].goods.gname+'\',\''+catlist[i].goods.gprice+'\',\''+catlist[i].goods.gvipprice+'\',\''+catlist[i].goods.gdanwei+'\',\''+"${pageContext.request.contextPath}"+catlist[i].goods.gimages+'\')"><div class="box-b-1-l" ><img src="'+"${pageContext.request.contextPath}"+catlist[i].goods.gimages+'" /></div>'+
						'<div class="box-b-1-r"><p>'+catlist[i].goods.jianjie+'</p><p style="width: 25%;text-align: right;">';
					str=str+'<span>'+catlist[i].odCost+'</span>/'+catlist[i].goods.gdanwei+'<br />';
					str=str+'<br /><span style="color:#666">×'+catlist[i].odNum+'</span></p></div></div>';
					var cathtml=document.getElementById("catdiv");
					cathtml.innerHTML+=str;
				zongjia+=(catlist[i].odCost)*(catlist[i].odNum);
				document.getElementById("zongjia").innerHTML=zongjia.toFixed(2);	
			}
			$("#confirm_zongjijian").html(catlist.length);
		}
		
		
			//进入详情页面
		function getGoodDetail(gid,gname,gprice,gvipprice,gkucun,gimages)
		{
			window.location = "${pageContext.request.contextPath}/goodsdetail/detail.jsp?gid="+gid+"&gname="+gname+"&gprice="+gprice+"&gvipprice="+gvipprice+"&gkucun="+gkucun+"&gimages="+gimages;
		}
		
		//收货地址信息
		function getAllAddress(address)
		{
			if(address.adStatus==1){
			var lis='<li><a id="icon-location"><span class="mui-icon mui-icon-location"></span></a></li>'+
					'<input type="hidden" value="'+address.adId+'" id="order_id" />'+
					'<li style="padding: 10px;width: 80%;">'+
					'<p style="line-height: 30px;color: #000000;">收货人：<span>'+address.adName+'</span><span style="float: right;">'+address.adPhone+'</span></p>'+
					'<p style="line-height: 20px;color: #000000;">收货地址：<span><span style="color: red;">[默认]</span>'+address.adDetail+'</span></p>'+
					'</li>';
					$("#order_dizhi").html(lis);
			//$("#order_AllPrice").html((jine*1).toFixed(2)+(yunfei*1).toFixed(2)); //总金额
			}else{
				var lis='<li><a id="icon-location"><span class="mui-icon mui-icon-location"></span></a></li>'+
					'<input type="hidden" value="'+address.adId+'" id="order_id" />'+
					'<li style="padding: 10px;width: 80%;">'+
					'<p style="line-height: 30px;color: #000000;">收货人：<span>'+address.adName+'</span><span style="float: right;">'+address.adPhone+'</span></p>'+
					'<p style="line-height: 20px;color: #000000;">收货地址：<span>'+address.adDetail+'</span></p>'+
					'</li>';
					$("#order_dizhi").html(lis);
			//if(address.area.city.cityYunfei==0){
			//	$("#yunfei").html(address.area.city.ctYunfei);
			//}else{
			//	$("#yunfei").html(address.area.city.cityYunfei);
			//}
			}
		}
		//去付款
		$("#gopay").click(function(){
			if(orstatus == 0){
				window.location = "${pageContext.request.contextPath}/weixin/goodsdetail/submit-order.jsp?orid="+orid+"&orderId="+orderId+"&id=submit-order.html";
			}
			
		});
		//联系卖家
		$(".lianximaijia").click(function(){
			if(userid!=null){
				window.location  = "${pageContext.request.contextPath}/weixin/goodsdetail/kefu.jsp";
			}else{
				goLogin();
			}
		});
		
		//删除订单
		function deleteOrder() {
			if(orstatus == 0 || orstatus == 3){
	
				mui.confirm("删除该订单？", function(i) {
					if(i.index == 1) {
						mui.post("${pageContext.request.contextPath}/" + 'apporder.do?p=deleteOrder', {
							orid: orid
						}, function(data) {
							mui.toast("删除成功");
							mui.back();
							//location.reload();
						});
					}
				});
			}
		}
		
		//确认收货
		$("#shouhuo").click(function(){
			var index=$("#shouhuo").attr('index');
			mui.ajax(c+"apporder.do?p=editOrderStatus",{
				data:{orid:orid},
				type:"post",
				timeout: 3000,
				success: function(data){
					mui.toast("收货成功");
					$("#shouhuo").html("收 货 成 功");
					//plus.webview.currentWebview().opener().reload(true);
					mui.back();
				}	
			});
		});
		//申请退货	
		$("#returnhuo").click(function(){
			var index=$("#returnhuo").attr('index');
			if(index=='1'){
			$("#hideDiv").css("display","block");  //打开遮蔽背景层 
			window.location = "${pageContext.request.contextPath}/weixin/center/return-goods.jsp?orid="+orid;
			/*	mui.openWindow({
				url:'return-goods.html',
				extras:{
					orid:orid
				},
				styles:{
						top:'20%',
						width:'80%',
						bottom:'20%',
						height:'60%',
						left:'10%'
				},
				show:{
     				aniShow:'slide-in-right',//页面显示动画
     				duration:300,//页面动画持续时间，Android平台默认100毫秒，iOS平台默认200毫秒；
   				}
			});*/
			}
			if(index=='3')
			{
				mui.confirm("亲，确定已经发货了嘛？",function(e){
					if(e.index==0)
					{
						mui.post("${pageContext.request.contextPath}/"+"apporder.do?p=editReturnGoodsStatus",{grid:grid},function(data){
							if(data=="3")
							{
								$("#returnhuo").html("等待卖家确认收货");
								$("#returnhuo").attr("index",'2');
							}
						});
					}
				})
			}
		});
		window.addEventListener('rgoods',function(){
			$("#returnhuo").html('等 待 审 核');
			$("#returnhuo").attr('index','2');
		});
		
		//去登录界面
		function goLogin(){
			mui.toast("请先登录！");
			/*mui.openWindow({
				url: '/home/login.html',
			});*/
			window.location = "${pageContext.request.contextPath}/weixin/home/login.jsp";
		}	
		window.addEventListener('userinfo',function(event){
			location.reload();
			userid='${userinfo.usersId}';
		});
		
		(function($){
			$(".mui-scroll-wrapper").scroll({
			bounce: true,//滚动条是否有弹力默认是true
			indicators: true, //是否显示滚动条,默认是true
			});
			
			})(mui);
	</script>

</html>