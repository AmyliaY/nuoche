<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>

<!--<base href="/static_files/"/>-->

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

<!--页面滚动插件-->
<script src="${pageContext.request.contextPath }/weixin/js/iscroll.js"></script>

<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/jquery.form.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/popwin.js"></script>
         
<title>卡卡挪车</title>

</head>
<body>

<div id="wrapper" style="top: 0;bottom:0">
	<ul>
		<li class="paymentIngT"><i class="fa fa-shopping-cart" aria-hidden="true"></i> 等待买家付款</li>
		<li class="paymentA">
			<span>
				<strong style="width: 50%;">${applydetail.buyer }</strong>
				<strong style="width: 50%;">${applydetail.buyerTel }</strong>
				<strong style="width: 100%;">${applydetail.buyerAddr }</strong>
			</span>
		</li>
		<li class="paymentB">
			<img src="${pageContext.request.contextPath }/weixin/images/main_20.jpg">
		    <div class="paymentBT">
		    	<div class="paymentBTa">卡卡挪车二维码车贴，保护亿万车主隐私</div>
		    	<div class="paymentBTb">
		    	    <span>¥ ${applydetail.totalFee/applydetail.cardNum }</span>
		    	    <strong>×${applydetail.cardNum }</strong>
		    	</div>
		    </div>
		</li>
		<li>			
			<ul class="pay_txt">
				<!--  <li>运费<span>¥ 0.00</span></li>-->
						<!--  <li>购物优惠<span>－¥ 0.00</span></li>-->
				<li style="font-size: 16px;">实付款<span><strong>¥ ${applydetail.totalFee }</strong></span></li>
			</ul>
			<div class="pay_txt" style="color: #999;">
				车贴编号： <br />
			</div>
			<div class="pay_txt" style="color: #999;">
				订单编号：  ${applydetail.orderId }<br />创建时间： ${applydetail.created }
			</div>
			<div class="pay_txt" style="color: #999;">
				支付方式： 
						
						微信支付
						 
			</div>
		</li>
		<c:if test="${applydetail.status==1}">
			<li class="butB">
				<a onclick="cancelOrder('${applydetail.orderId}','${applydetail.weixinUser.openid}')" class="butGray">取消订单</a>
				<a id="btnPay" class="butBlue" style="float: right;">付 款</a>
			</li>			
		</c:if>
		<c:if test="${applydetail.status==2}">
			<li class="butB">
				<span class="red">等待卖家发货</span>
			</li>			
		</c:if>
		<c:if test="${applydetail.status==3}">
			<li class="butB">
				<a onclick="showwuliu('${applydetail.orderId}','${applydetail.weixinUser.openid}')" class="butBlueX">查看物流</a>
				<a onclick="querenOrder('${applydetail.orderId}','${applydetail.weixinUser.openid}')" class="butGrayX">确认收货</a>
			</li>
		</c:if>
		
		

	</ul>
</div>



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
	<input type="hidden" id="orderid" value="${applydetail.orderId }"/>
	<input type="hidden" id="timestamp" value="${applydetail.created }"/>
	<input type="hidden" id="money" value="${applydetail.totalFee }"/>
	<input type="hidden" id="openid" value="${applydetail.weixinUser.openid }"/>	
	<input type="hidden" id="host"  value=""/>
</div>

<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

<script type="text/javascript">
var host = "http://kknc.wang";
var link = host+"/attend.jsp";
var title="扫码隐号挪车贴";
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

 <input type="hidden" value="5100" id="orderPrice" />
 <input type="hidden" value="2" id="payway" />
 <input type="hidden" value="01c0e2c26fae46e3adaa56d379e754b6" id="pay_noncestr" />
 <input type="hidden" value="1f9b5b3da8e472de18e7c39ae68f8268" id="pay_sign" />
 <input type="hidden" value="1523105217" id="pay_timestamp" />
 <input type="hidden" value="prepay_id=wx072046570607250a5e6b52411787268562" id="pay_package" />
 
 <script type="text/javascript">
      	
 	    var payBtn = document.getElementById("btnPay");
 	    
	   //  付款
	   	payBtn.onclick=function(){
	   		showPopWin(0,"正在处理，请稍候...");
	   		var money = document.getElementById("money").value;
 	   		var orderid = document.getElementById("orderid").value;
   			var openid = document.getElementById("openid").value;
			var url="${pageContext.request.contextPath}/applyqrpay.do?method=toPayQrcode";
			window.location=url+"&orderid="+orderid+"&money="+money;
	  	 }
	  	 
	  	 //  取消订单
	function cancelOrder(orderid,openid)
	{
		showPopWin(2,"确定取消订单么？");
		$("#btnCheck").click(function(){
			showPopWin(0,"正在处理，请稍候...");
			var url="${pageContext.request.contextPath}/applyforqrcode.do?method=cancelOrder";
			var param={orderid:orderid,openid:openid};
			$.post(url,param,function(data){
				if(data=="yes")
				{
					showPopWin(0,"trz订单取消成功！正在为您跳转订单中心...");
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
		
		
		
		
 </script>

</body>

</html>


