<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>


<!DOCTYPE html>
<html lang="zh-CN">
<head>

<!--<base href="/static_files/"/>
-->
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

<style>
	body{ padding:0; height: 100%; box-sizing: border-box; overflow: visible;}
	.topA{ position: fixed; top: 0; left: 0;}
	.footA{ position: fixed; bottom: 0; left: 0;}
	.wrapperX{ width: 100%;}
	.aboutNew{ width: 100%; height: 35px; margin-top: 15px; line-height: 35px; background-color: #ebeff2; overflow: hidden; border-radius:3px;}
	.aboutNew a{ width: 50%; display: block; line-height: 35px; float: left;}
	.aboutNewA{ background-color: #008dde; color: #fff;}
	.aboutNewB{ color: #999;}
</style>
         
<title>卡卡挪车</title>

</head>
<body>

<form id="form">
	<input type="hidden" name="orderNo" value="512018040720402168428"/>
	
	<div id="wrapperX">
		
		<ul>
			<!--<li><img src="images/pay_banner.jpg" style="width: 100%; display: block;"></li>-->
			<li>
				<ul class="fillList lineHeightA" style="margin-top: 0; border-top: none;">
					<li>
						<span class="fill_inA">姓&emsp;&emsp;&nbsp;名：</span>
						<span class="fill_inB"><input type="text" placeholder="请输入" name="postReceiver"></span>
					</li>
					<li>
						<span class="fill_inA">手机号码：</span>
						<span class="fill_inB"><input type="tel" placeholder="请输入" name="postTel"></span>
					</li>
				</ul>
				<ul class="fillList lineHeightA">
					<li>
						<span class="fill_inA">所在省份：</span>
						<span class="fill_inB">
							<select name="province" id="prid" onchange="findByidCity()">
								<c:forEach items="${plist}" var="p">
									<option value="${p.prId}" >${p.prName}</option>
								</c:forEach>
							</select>
						</span>
					</li>
					<li>
						<span class="fill_inA">所在地市：</span>
						<span class="fill_inB">
							<select name="city" id="city" onchange="findByIdArea()"></select>
						</span>
					</li>
					<li>
						<span class="fill_inA">所在区县：</span>
						<span class="fill_inB">
							<select name="district" id="arid"></select>
						</span>
					</li>
					<li>
						<span class="fill_inA">详细地址：</span>
						<span class="fill_inB"><input type="text" placeholder="请输入" name="postAddr"></span>
					</li>
					<li>
						<span class="fill_inA">支付方式：</span>
						<span class="fill_inB">
							<select name="payway" id="payway">
								<option value="2">微信支付</option>							
							</select>
						</span>
					</li>					
				</ul>
			</li>
			<li>
				<div class="con_a">
					<a onclick="subOrder()" class="butA butRed" style="margin-top: 0;">确认订单</a>
					<!--<div class="Reminder">
						<strong>温馨提示</strong>
						<span>本车贴是由韵达快递承运，一般情况下48小时内可快递到您的手上，请注意查收。</span>
					</div>-->
				</div>
			</li>
		</ul>
	</div>
</form>










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
	<input type="hidden" id="noncestr" value="2b37024582544440b13746516d73fada"/>
	<input type="hidden" id="timestamp" value="1523104821"/>
	<input type="hidden" id="sign" value="381b1452ea2cadf52a658bb879bd9da625a74ef5"/>
	<input type="hidden" id="openid" value="${openid }"/>	
	<input type="hidden" id="host"  value=""/>
</div>

<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

<script type="text/javascript">
var host = "http://kknc.wang";
var link = host+"/attend.jsp";
var title="卡卡扫码隐号挪车贴";
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

<script src="${pageContext.request.contextPath }/weixin/js/pop.js"></script>
<div class="pop" id="PoP" style="display: none;">
	<div class="popC">
		<div class="yesMoney">确认付款：¥51.00</div>
		<a href="#" class="main_list">
			<img src="images/wx.png">
			<span>微信支付</span>
		    <div class="main_listR"><i class="fa fa-angle-right" aria-hidden="true"></i></div>
		</a>
		<a href="#" class="main_list" style="border-bottom: none;">
			<img src="images/zfb.png">
			<span>支付宝支付</span>
		    <div class="main_listR"><i class="fa fa-angle-right" aria-hidden="true"></i></div>
		</a>
		<div class="popBut">
			<a onclick="PoP_close()">取 消</a>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	findByidCity();
	findByIdArea();
});

	function subOrder(){
		var form = document.getElementById("form");
		var name = form.postReceiver.value;
		var tel = form.postTel.value;
		var pro = $(form.province).find("option:selected").html();
		var city = $(form.city).find("option:selected").html();
		var district = $(form.district).find("option:selected").html();
		var postAddr = form.postAddr.value;
		
		if(name.trim()==""){
			showPopWin(1,"请填写收货人姓名");
			return;
		}
		
		if(tel.trim()==""){
			showPopWin(1,"请填写收货人联系电话");
			return;
		}
		
		if(!checkPhone(tel)){
			showPopWin(1,"联系电话格式不正确");
			return;
		}
		
		if(pro.trim()=="" || city.trim()=="" || district.trim()=="" || postAddr.trim()==""){
			showPopWin(1,"请将收货地址填写完整");
			return;
		}
		var address = pro+" "+city+" "+district+" "+postAddr;
		form.postAddr.value = address;
		var p = $(form).serialize();
		showPopWin(0,"正在处理，请稍候...");
		//window.location.href="${pageContext.request.contextPath}/applyforqrcode.do?method=submitaddr&name="+name+"&tel="+tel+"&address="+address;
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/applyforqrcode.do?method=submitaddr",
			data:{name:name,tel:tel,address:address},	
			success:function(data){
				if(data =="yes")
				{
					showPopWin(0,"订单已生成，正前往支付页面，请稍候...");
					window.location.href="${pageContext.request.contextPath}/applyforqrcode.do?method=showorder";			
				}

			},
			error:function(){
				showPopWin(1,"请求提交失败，请稍后重试！");
			}
		});
		
		
		
		/*
		var url="${pageContext.request.contextPath}/applyforqrcode.do?method=submitaddr";
		var param={name:name,tel:tel,address:address};
		$.post(url,param,function(data){
			if(data =="yes")
			{
				showPopWin(0,"订单已生成，正前往支付页面，请稍候...");
				window.location.href="${pageContext.request.contextPath}/applyforqrcode.do?method=showorder";			
			}
			
		});
		*/
		
		
		
	/*	
		$.ajax({
			url:'/pay/checkOrder.do',
			type:'post',
			dataType:'json',
			data:p,
			success:function(jd){
				if(jd.retcode==0){
					showPopWin(0,"订单已生成，正前往支付页面，请稍候...");
					window.location.replace("/pay/pay.do?orderNo="+jd.retdata);
				}else{
					showPopWin(1,jd.retmsg);
				}				
			},
			error:function(){
				showPopWin(1,"请求提交失败，请稍后重试！");
			}
		});
		*/
	}



//根据省ID 查出市级
function findByidCity()
{
	//showPopWin(0,"查询城市执行了...");
	var prid=$("#prid").val();
	var ctid="${city}";
	var arid="${arid}";
	if(prid.trim()=="")		//省ID 不能为-1
	{
		prid=-1;   
	}
	
	
	var url="${pageContext.request.contextPath}/address.do?p=findByidCity";
	var param={prid:prid};
	$.post(url,param,function(data){
		
		var json=eval("("+data+")");
		//alert(json[1].ctName);
		$("#city").empty();
		for(var i=0;i<json.length;i++)
		{
				$("#city").append('<option value='+json[i].ctId+'>'+json[i].ctName+'</option>');
					
		}
		 findByIdArea();
	});
}
//根据市ID 查出区/县级
function findByIdArea()
{   
	//showPopWin(0,"查询地区执行了...");
	var prid=$("#prid").val();
	var crid=$("#city").val();
	var arid="${arid}";
	if(prid.trim() == ""){
	  crid = -1;
	  
	}
	var url="${pageContext.request.contextPath}/address.do?p=findByIdArea";
	var param={crid:crid};
	$.post(url,param,function(data){
		var json=eval("("+data+")");
		//alert(json);
		$("#arid").empty();
		for(var i=0;i<json.length;i++){
			
				$("#arid").append('<option value='+json[i].arId+'>'+json[i].arName+'</option>');
			
			
		}
	});
	
	
}
	
</script>

</body>

</html>
