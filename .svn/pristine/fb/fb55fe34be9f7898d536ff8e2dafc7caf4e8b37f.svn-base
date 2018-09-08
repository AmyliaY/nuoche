<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/jquery.form.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/popwin.js"></script>

	<script src="${pageContext.request.contextPath }/weixin/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/weixin/js/mui.min.js"></script>
    
    <script type="text/javascript" charset="UTF-8">
      	mui.init();
    </script>


<!--页面滚动插件-->
<script src="${pageContext.request.contextPath }/weixin/js/iscroll.js"></script>
         
<title>卡卡挪车</title>


</head>
<body>



<div id="wrapper" style="top: 0;bottom:0">
	<ul>
		<!--<li><img src="images/pay_banner.jpg" style="width: 100%; display: block;"></li>-->
		
		<li>
			<ul class="fillList lineHeightA" style="margin-top: 0; border-top: none;">
				<li >
					<span class="fill_inA" style="width: 30%;">充值分钟数：</span>
					<span class="fill_inBs" id="" style="height: 100%; " >
							<div style="width: 50%;height: 100%; float: right;" >
							<button style="width: 30px;height: 26px;border-radius:1px;border: 1px #B7B7B7 solid;background-color: #FFFFFF;" type="button" id="" onclick="minusAmount()">-</button>
							<input style="width: 30%;height: 100%;text-align: center;border-style: none;" type="text" value="1" id="account"/>
							<button style="width: 30px;height: 26px;border-radius:1px;border: 1px #B7B7B7 solid;background-color: #FFFFFF;" type="button" onclick="addAmount()">+</button>
							</div>
					</span>
					
				</li>	
					
						<li>
							<span class="fill_inA" style="width: 30%;">每分钟单价：</span>
							<span class="fill_inBs" style="color: #999" id="price">${czhfPrice }<span style="float: right;">&nbsp;元</span></span>
							
						</li>
					
				<li>
					<span class="fill_inA" style="width: 30%;">合计总金额：</span>
					<span class="fill_inBs" id="totalPrice" >${czhfPrice }元</span>
				</li>
			</ul>
		</li>
		<li>
			<div class="con_a">
				<a onclick="subOrder()" class="butA butRed" style="margin-top: 0;">购买</a>
			</div>
		</li>
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
	<input type="hidden" id="noncestr" value="27ba7343a1af4234be607af6fbe46502"/>
	<input type="hidden" id="timestamp" value="1523104384"/>
	<input type="hidden" id="sign" value="490b032a9a55f27f498ad7d3696bbbf2ffb2b632"/>
	<input type="hidden" id="openid" value="${openid }"/>	
	<input type="hidden" id="host"  value=""/>
</div>

<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

<script type="text/javascript">
var host = "http://kknc.wang";
var link = host+"/attend.jsp";
var title="卡卡挪车贴";
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
//  数量加
function addAmount(){
	var account = parseInt($("#account").val());
	account++;
	$("#account").val(account);
	//$("#amount_show").html(account);
	calPrice();	
}
// 数量减
function minusAmount(){
	var account = parseInt($("#account").val());
	if(account>0){
		account--;
		$("#account").val(account);
		//$("#amount_show").html(account);
		calPrice();
	}		
}

function calPrice(){
	var account = parseInt($("#account").val());
	var price = parseFloat($("#price").html());
	if(price>0){
		var tp = price*account;
		tp = tp.toFixed(2);
		$("#totalPrice").html(tp+"元");		
	}
}

function subOrder(){
		next();
}

function next(){	
	var account = parseInt($("#account").val());
	var price = parseFloat($("#price").html());
	var sum = price*account;
	if(account<1){
		showPopWin(1,"请确定购买分钟数...");
		return;
	}
	showPopWin(0,"正在处理，请稍候...");
	
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath}/move.do?p=submitnum&account="+account+"&sum="+sum,
		success:function(data){
			if(data =="yes")
			{
				showPopWin(0,"订单已生成，正前往支付页面，请稍候...");
				window.location.href="${pageContext.request.contextPath}/move.do?p=showorder";			
			}

		},
		error:function(){
			showPopWin(1,"请求提交失败，请稍后重试！");
		}
	});
	
}

</script>


</body>

</html>

