<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>


<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<!--<meta content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;" name="viewport">-->
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<meta charset="utf-8">
<meta name="description" content="" /><!--网站描述-->
<meta name="keywords" content="" /><!--网站关键字-->
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0,maximum-scale=1.0"/>
<!--width - viewport的宽度 height - viewport的高度
initial-scale - 初始的缩放比例
minimum-scale - 允许用户缩放到的最小比例
maximum-scale - 允许用户缩放到的最大比例
user-scalable - 用户是否可以手动缩放-->
<link href="${pageContext.request.contextPath }/weixin/css/css.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/weixin/css/style.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/weixin/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/weixin/css/font-awesome.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/jquery.form.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/popwin.js"></script>
       
<title>卡卡挪车</title>

<style type="text/css">

body{ padding:0 0 10px 0; height: 100%; box-sizing: border-box; overflow: visible;}
.topA{
	position:fixed;
	border-bottom:1px solid #eee;
	z-index:100;
}

</style>

</head>
<body>
<input type="hidden" id="pathnuoche" value="${pageContext.request.contextPath }">
<div class="EvaCT" style="position: fixed; top:0; left: 0; z-index: 100;">
	<a href="#" onclick="list(this,-1)" class="EvaCTa">全部</a>
	<a href="#" onclick="list(this,0)"  class="EvaCTb">待付款</a>
	<a href="#" onclick="list(this,1)"  class="EvaCTb">待发货</a>
	<a href="#" onclick="list(this,2)"  class="EvaCTb">待收货</a>
</div>

<div id="wrapperX" style="padding-top: 50px;">	
	
	<ul id="orderList">
		<c:if test="${empty applydetails}">
			<li class="payBX">						
					<img src="${pageContext.request.contextPath }/weixin/images/NoData.png" style="width: 100px; display: block; margin: 0 auto; padding: 20px 0;"/>
			</li>
		</c:if>
		<c:if test="${!empty applydetails}">
			<c:forEach items="${applydetails }" var="list" >
				<li class="payBX">			
					<a href="${pageContext.request.contextPath }/ordercenter.do?method=showorder&openId=${list.weixinUser.openid }&orderid=${list.orderId}" class="paymentB">
						<img src="${pageContext.request.contextPath }/weixin/images/main_20.jpg">
						<div class="paymentBT">
							<div class="paymentBTa">卡卡挪车二维码车贴，保护亿万车主隐私</div>
								<div class="paymentBTb">
										<span>￥ ${list.totalFee/list.cardNum }</span>
										<strong>×${list.cardNum }</strong>
								</div>
						</div>
					</a>
					<ul class="pay_txt">
						<li style="font-size: 16px;">实付款<span><strong>￥ ${list.totalFee }</strong></span></li>
					</ul>
					<c:if test="${list.status==1}">
						<div class="OrderBut">
							<span class="red">等待买家付款</span>
							<a onclick="pay('${list.orderId}','${list.weixinUser.openid}')" class="butBlueX">立即付款</a>
							<a onclick="cancelOrder('${list.orderId}','${list.weixinUser.openid}')" class="butGrayX">取消订单</a>
						</div>
					</c:if>
					<c:if test="${list.status==2}">
						<div class="OrderBut">
							<span class="red">等待卖家发货</span>
						</div>
					</c:if>
					<c:if test="${list.status==3}">
						<div class="OrderBut">
							<span class="red">等待买家收货</span>
							<a onclick="showwuliu('${list.orderId}','${list.weixinUser.openid}')" class="butBlueX">查看物流</a>
							<a onclick="querenOrder('${list.orderId}','${list.weixinUser.openid}')" class="butGrayX">确认收货</a>
						</div>
					</c:if>
				</li>
			</c:forEach>
		</c:if>
	</ul>
</div>

<input type="hidden" id="pageAt" value="1"/>
<input type="hidden" id="status" value=""/>

<!-- 确认 弹窗 -->
<div class="pop" id="checkWin" style="display: none;">
	<div class="popC">
		<div class="pop_tit">操作确认</div>
		<div class="popCC"><strong id="checkMsgTip"></strong></div>
		<div class="popBut">
			<a onclick="hidePopWin()">取 消</a>
			<a id="btnCheck" class="butRed">确 认</a>
		</div>
	</div>
</div>

<!-- 提示 弹窗 -->
<div class="pop" id="msgWin" style="display: none;">
	<div class="popC">
		<div class="pop_tit">操作提示</div>
		<div class="popCC"><strong id="msgTip">提示语</strong></div>
		<div class="popBut">
			<a onclick="hidePopWin()" class="butRed">确 定</a>
		</div>
	</div>
</div>

<!-- loading 弹窗 -->
<div class="pop" id="loadingWin" style="display: none;">
	<div class="popC">
		<div class="popCC"><strong id="loadingMsg"></strong></div>	
	</div>
</div>

<div>
	
</div>

<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

<script type="text/javascript">
var host = "http://kknc.wang";
var link = host+"/attend.jsp";
var title="卡卡挪车扫码隐号挪车贴";
var desc = "保护隐私远离骚扰，千万车主都在用，速抢！";
var sharepic =host+"/static_files/images/logo.jpg";
var shareParams={
	title:title,
	desc:desc,
	link:link,
	sharepic:sharepic
};
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/weixin/js/wxshare.js"></script>
<script type="text/javascript">
		//  付款
	function pay(orderid,openid){
			showPopWin(0,"正在处理，请稍候...");
			var url="${pageContext.request.contextPath}/applyqrpay.do?method=toPayQrcode2";
			window.location=url+"&orderid="+orderid;
	}
	//  取消订单cancelOrder
	function cancelOrder(orderid,openid){
		showPopWin(2,"确定取消订单么亲？");
		$("#btnCheck").click(function(){
			showPopWin(0,"正在处理，请稍候...");
			var url="${pageContext.request.contextPath}/applyforqrcode.do?method=cancelOrder";
			var param={orderid:orderid,openid:openid};
			$.post(url,param,function(data){
				if(data=="yes")
				{
					showPopWin(0,"订单取消成功！正在为您跳转订单中心...");
					window.location.href="${pageContext.request.contextPath}/ordercenter.do?method=backordercenter&openid="+openid;			
				}else{
					showPopWin(2,"订单取消失败，请稍后重试！");
					window.location.href="${pageContext.request.contextPath}/ordercenter.do?method=backordercenter&openid="+openid;
				}
			});
		
		});
	}
	//  查看物流-----待完善
	function showwuliu(orderid,openid){
			showPopWin(0,"正在处理，请稍候...");
			var url="${pageContext.request.contextPath}/ordercenter.do?method=showwuliu";
			var param={orderid:orderid,openid:openid};
			//$.post(url,param,function(data){
			//	showPopWin(0,"支付成功！");
			//	window.location.href="${pageContext.request.contextPath}/ordercenter.do?method=backordercenter&openid="+openid;			
			//});
	}
	//  确认收货
	function querenOrder(orderid,openid){
			showPopWin(0,"正在处理，请稍候...");
			var url="${pageContext.request.contextPath}/ordercenter.do?method=querenOrder";
			var param={orderid:orderid,openid:openid};
			$.post(url,param,function(data){
				if(data=="yes")
				{
					showPopWin(0,"操作成功！正在为您跳转订单中心...");
					window.location.href="${pageContext.request.contextPath}/ordercenter.do?method=backordercenter&openid="+openid;			
				}
			});
	}
	function list(alink,action){
		var pathnuoche = $("#pathnuoche").val();
		alink.className="EvaCTa";
		$(alink).siblings().removeClass("EvaCTa").addClass("EvaCTb");
		if(action==-1){
			$("#status").val("");
		}else{
			$("#status").val(action);			
		}		
		$("#pageAt").val("0");
		isAppend = 0;
		//  根据状态查询
		if(action==-1)
		{
			//查全部
			var url="${pageContext.request.contextPath}/ordercenter.do?method=findAllorder";
			var param={};
			showPopWin(0,"正在处理，请稍候...");
			$.post(url,param,function(data){
				//  异步刷新不会跳转页面  提示框 showPopWin(0,"正在处理，请稍候...");  不会自动消失  手动关闭
				hideLoading();
				var json=eval("("+data+")");
				//alert(json[1].ctName);  
				if(json.length==0)
				{//当数据为空
					$("#orderList").html('<li class="payBX"><img src="${pageContext.request.contextPath}/weixin/images/NoData.png" style="width: 100px; display: block; margin: 0 auto; padding: 20px 0;"/></li>');
				}else{
					// 清空列表
					$("#orderList").empty();
					for(var i=0;i<json.length;i++)
					{
						var m='<li class="payBX">';
							m=m+'<a href="'+pathnuoche+'/ordercenter.do?method=showorder&openId='+json[i].weixinUser.openid+'&orderid='+json[i].orderId+'" class="paymentB">';
								m=m+'<img src="'+pathnuoche+'/weixin/images/main_20.jpg">';
								m=m+'<div class="paymentBT">';
									m=m+'<div class="paymentBTa">卡卡挪车二维码车贴，保护亿万车主隐私</div>';
										m=m+'<div class="paymentBTb">';
												m=m+'<span>￥ '+json[i].totalFee/json[i].cardNum +'</span>';
												m=m+'<strong>×'+json[i].cardNum+'</strong>';
										m=m+'</div>';
									m=m+'</div>';
							m=m+'</a>';
							m=m+'<ul class="pay_txt">';
							m=m+'<li style="font-size: 16px;">实付款<span><strong>￥ '+json[i].totalFee+'</strong></span></li>';
							m=m+'</ul>';
							if(json[i].status==1)
							{
								m=m+'<div class="OrderBut">';
									m=m+'<span class="red">等待买家付款</span>';
									m=m+'<a onclick="pay(\''+json[i].orderId+'\',\''+json[i].weixinUser.openid+'\')" class="butBlueX">立即付款</a>';
									m=m+'<a onclick="cancelOrder(\''+json[i].orderId+'\',\''+json[i].weixinUser.openid+'\')" class="butGrayX">取消订单</a>';
								m=m+'</div>';
							}
							else if(json[i].status==2)
							{
								m=m+'<div class="OrderBut">';
									m=m+'<span class="red">等待卖家发货</span>';
								m=m+'</div>';
							}
							else if(json[i].status==3)
							{
								m=m+'<div class="OrderBut">';
									m=m+'<span class="red">等待买家收货</span>';
									m=m+'<a onclick="showwuliu(\''+json[i].orderId+'\',\''+json[i].weixinUser.openid+'\')" class="butBlueX">查看物流</a>';
									m=m+'<a onclick="querenOrder(\''+json[i].orderId+'\',\''+json[i].weixinUser.openid+'\')" class="butGrayX">确认收货</a>';
								m=m+'</div>';
							}
						m=m+'</li>';
						$("#orderList").append(m);	
					}
				}	
			});
		}else if(action==0){
			//查待付款  orderstatus = 1 表示等待买家付款
			var orderstatus = 1;
			showPopWin(0,"正在处理，请稍候...");
			var url="${pageContext.request.contextPath}/ordercenter.do?method=findOrderByStatus";
			var param={orderstatus:orderstatus};
			$.post(url,param,function(data){
				hideLoading();
				var json=eval("("+data+")");
				//alert(json[1].ctName);  
				if(json.length==0)
				{//当数据为空
					$("#orderList").html('<li class="payBX"><img src="${pageContext.request.contextPath}/weixin/images/NoData.png" style="width: 100px; display: block; margin: 0 auto; padding: 20px 0;"/></li>');
				}else{
					// 清空列表
					$("#orderList").empty();
					for(var i=0;i<json.length;i++)
					{
						var m = '<li class="payBX">';
							m = m+'<a href="'+pathnuoche+'/ordercenter.do?method=showorder&openId='+json[i].weixinUser.openid+'&orderid='+json[i].orderId+'" class="paymentB">';
								m = m+'<img src="'+pathnuoche+'/weixin/images/main_20.jpg">';
								m = m+'<div class="paymentBT">';
									m = m+'<div class="paymentBTa">卡卡挪车二维码车贴，保护亿万车主隐私</div>';
										m = m+'<div class="paymentBTb">';
												m = m+'<span>￥ '+json[i].totalFee/json[i].cardNum +'</span>';
												m = m+'<strong>×'+json[i].cardNum+'</strong>';
										m = m+'</div>';
									m = m+'</div>';
							m = m+'</a>';
							m = m+'<ul class="pay_txt">';
							m = m+'<li style="font-size: 16px;">实付款<span><strong>￥ '+json[i].totalFee+'</strong></span></li>';
							m = m+'</ul>';
							if(json[i].status==1)
							{
								m = m+'<div class="OrderBut">';
									m = m+'<span class="red">等待买家付款</span>';
									m = m+'<a onclick="pay(\''+json[i].orderId+'\',\''+json[i].weixinUser.openid+'\')" class="butBlueX">立即付款</a>';
									m = m+'<a onclick="cancelOrder(\''+json[i].orderId+'\',\''+json[i].weixinUser.openid+'\')" class="butGrayX">取消订单</a>';
								m = m+'</div>';
							}
						m = m+'</li>';
						$("#orderList").append(m);	
					}
				}	
			});
		
		}else if(action==1){
			//查待待发货  orderstatus = 2  表示等待卖家发货
			var orderstatus = 2;
			showPopWin(0,"正在处理，请稍候...");
			var url="${pageContext.request.contextPath}/ordercenter.do?method=findOrderByStatus";
			var param={orderstatus:orderstatus};
			$.post(url,param,function(data){
				hideLoading();
				var json=eval("("+data+")");
				//alert(json[1].ctName);  
				if(json.length==0)
				{//当数据为空
					$("#orderList").html('<li class="payBX"><img src="${pageContext.request.contextPath}/weixin/images/NoData.png" style="width: 100px; display: block; margin: 0 auto; padding: 20px 0;"/></li>');
				}else{
					// 清空列表
					$("#orderList").empty();
					for(var i=0;i<json.length;i++)
					{
						var m = '<li class="payBX">';
							m = m+'<a href="'+pathnuoche+'/ordercenter.do?method=showorder&openId='+json[i].weixinUser.openid+'&orderid='+json[i].orderId+'" class="paymentB">';
								m = m+'<img src="'+pathnuoche+'/weixin/images/main_20.jpg">';
								m = m+'<div class="paymentBT">';
									m = m+'<div class="paymentBTa">卡卡挪车二维码车贴，保护亿万车主隐私</div>';
										m = m+'<div class="paymentBTb">';
												m = m+'<span>￥ '+json[i].totalFee/json[i].cardNum +'</span>';
												m = m+'<strong>×'+json[i].cardNum+'</strong>';
										m = m+'</div>';
									m = m+'</div>';
							m = m+'</a>';
							m = m+'<ul class="pay_txt">';
							m = m+'<li style="font-size: 16px;">实付款<span><strong>￥ '+json[i].totalFee+'</strong></span></li>';
							m = m+'</ul>';
							if(json[i].status==2)
							{
								m = m+'<div class="OrderBut">';
									m = m+'<span class="red">等待卖家发货</span>';
								m = m+'</div>';
							}
							
						m = m+'</li>';
						$("#orderList").append(m);	
					}
				}	
			});
			
		
		}else if(action==2){
			//查待待收货  orderstatus = 3 表示已发货
			var orderstatus = 3;
			showPopWin(0,"正在处理，请稍候...");
			var url="${pageContext.request.contextPath}/ordercenter.do?method=findOrderByStatus";
			var param={orderstatus:orderstatus};
			$.post(url,param,function(data){
				hideLoading();
				var json=eval("("+data+")");
				//alert(json[1].ctName);  
				if(json.length==0)
				{//当数据为空
					$("#orderList").html('<li class="payBX"><img src="${pageContext.request.contextPath}/weixin/images/NoData.png" style="width: 100px; display: block; margin: 0 auto; padding: 20px 0;"/></li>');
				}else{
					// 清空列表
					$("#orderList").empty();
					for(var i=0;i<json.length;i++)
					{
						var m = '<li class="payBX">';
							m = m+'<a href="'+pathnuoche+'/ordercenter.do?method=showorder&openId='+json[i].weixinUser.openid+'&orderid='+json[i].orderId+'" class="paymentB">';
								m = m+'<img src="'+pathnuoche+'/weixin/images/main_20.jpg">';
								m = m+'<div class="paymentBT">';
									m = m+'<div class="paymentBTa">卡卡挪车二维码车贴，保护亿万车主隐私</div>';
										m = m+'<div class="paymentBTb">';
												m = m+'<span>￥ '+json[i].totalFee/json[i].cardNum +'</span>';
												m = m+'<strong>×'+json[i].cardNum+'</strong>';
										m = m+'</div>';
									m = m+'</div>';
							m = m+'</a>';
							m = m+'<ul class="pay_txt">';
							m = m+'<li style="font-size: 16px;">实付款<span><strong>￥ '+json[i].totalFee+'</strong></span></li>';
							m = m+'</ul>';
							if(json[i].status==3)
							{
								m = m+'<div class="OrderBut">';
									m = m+'<span class="red">等待买家收货</span>';
									m = m+'<a onclick="showwuliu(\''+json[i].orderId+'\',\''+json[i].weixinUser.openid+'\')" class="butBlueX">查看物流</a>';
									m = m+'<a onclick="querenOrder(\''+json[i].orderId+'\',\''+json[i].weixinUser.openid+'\')" class="butGrayX">确认收货</a>';
								m = m+'</div>';
							}
						m = m+'</li>';
						$("#orderList").append(m);	
					}
				}	
			});
		
		}	
	}

</script>

</body>

</html>
