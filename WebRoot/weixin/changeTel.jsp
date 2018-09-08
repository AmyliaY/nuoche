<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<link href="${pageContext.request.contextPath }/weixin/css/css.css?v1" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/weixin/css/style.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/weixin/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/weixin/css/font-awesome.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/jquery.form.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/popwin.js?v1"></script>

    
<title>卡卡挪车</title>

<style type="text/css">
	
	.fillList_butB{ width: 80px; height: 30px; line-height: 30px; 
	background-color: #aaaaaa; display: block; border-radius: 3px; 
	color: #fff; font-size: 12px; 
	text-align: center;}	
	
</style>

</head>
<body>

<form id="form">
	<div id="wrapperX">
		<ul>
			<li class="main_menuAT">
				<a style="text-align: center"><span style="font-size:15px">修改绑定手机号</span></a>
			</li>
			<li>
				<ul class="fillList lineHeightA">
					
								
								
								<li>
									<span class="fill_inA">手机号码：</span>
									<span class="fill_inB"><input type="tel" placeholder="请输入" 
										name="tel" id="tel" maxlength="11" onkeyup="doTelValid(this)" value="${oldtel }"></span>
									<span class="fill_inC"><a onclick="changeTel()" id="btnChangeTel" class="fillList_butA">更换号码</a></span>
								</li>
								<li id="smscodePart" style="display:none">
									<span class="fill_inA">验证码：</span>
									<span class="fill_inB"><input type="password" placeholder="请输入" name="smscode"></span>
									<span class="fill_inC"><a id="btnSmscode" class="fillList_butA">获取验证码</a></span>
								</li>
						
						
					
					
				</ul>
			</li>
			<li>
				<div class="con_a">
					<a onclick="save()" class="butA butRed" style="margin-top: 0;">保存</a>
				</div>
			</li>
		</ul>
	</div>
</form>

<input type="hidden" id="oriTel" value="${pcuser.tel }"/>










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
	<input type="hidden" id="noncestr" value="e48bc333bc9641edaed0ab9be4d07c82"/>
	<input type="hidden" id="timestamp" value="1523701493"/>
	<input type="hidden" id="sign" value="730ada00bf13b3977b30d3f8683d952a6e4b08c7"/>
	<input type="hidden" id="appId" value="wxfe8112ded32a6e1a"/>	
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
<script type="text/javascript" src="js/wxshare.js"></script>

<script type="text/javascript">
	
	var getTimes = 0;
	var timer = null;
	var secs = 60;
	var btnSmscode = document.getElementById('btnSmscode');
	
	function changeTel(){
		$("#tel").val("");
		$("#smscodePart").show();
		$("#btnChangeTel").hide();
	}
	
	$(function(){
		var oriTel = $("#oriTel").val(); 
		if(oriTel.trim()==""){
			phoneValid = true;
		}else{
			phoneValid=false;
		}
		if(phoneValid){
			//未绑定号码
			$("#smscodePart").show();
			btnSmscode.onclick = getSmsCode;
			$("#btnChangeTel").hide();
		}else{
			$("#smscodePart").hide();
			btnSmscode.onclick = null;
			$("#btnChangeTel").show();
		}	
	});
	
	function doTelValid(input){
		var oriTel = $("#oriTel").val(); 
		var newTel = input.value.trim();
		if(oriTel==""){			
			phoneValid = true;
		}else{
			if(newTel.length>=11){
				if(oriTel!=newTel){
					getTimes = 0;
					phoneValid=true;
					$("#smscodePart").show();
					btnSmscode.onclick = getSmsCode;
					$("#btnChangeTel").hide();
				}else{
					phoneValid=false;
					$("#smscodePart").hide();
					btnSmscode.onclick = null;
					$("#btnChangeTel").show();
				}
			}else{
				phoneValid=false;
			}
		}		
		if(phoneValid){
			//未绑定号码
			
			//$("#btnChangeTel").hide();
		}else{
			
			//$("#btnChangeTel").show();
		}	
	}
	
	function getSmsCode(){
		var tel = document.getElementById("tel").value;
		if(tel==""){
			showPopWin(1,"请输入手机号码");
			return;
		}
		if(!checkPhone(tel)){
			showPopWin(1,"手机号格式不正确");
			return;
		}
		showPopWin(0,"正在处理，请稍候...")
		$.ajax({
			url:'${pageContext.request.contextPath}/changeTel.do?p=getsmscode',
			type:'post',
			dataType:'json',
			data:'phone='+tel,
			success:function(jd){
				if(jd=="1"){
					getTimes++;
					//showPopWin(1,"您会接到电话号码为9521295151的语音验证码播报，请注意接听！");
					showPopWin(1,"验证码已下发，请注意查收！");
					btnSmscode.className='fillList_butB';
					btnSmscode.onclick = null;
					timeCount();
				}			
			}
		});
	}
	
	function timeCount(){
		
		timer = setInterval(function(){			
			btnSmscode.innerHTML="重新获取("+secs+")";
			secs--;
			if(secs<1){
				btnSmscode.className='fillList_butA';
				btnSmscode.innerHTML="获取验证码";
				clearInterval(timer);
				secs=60;
				if(getTimes<2){
					btnSmscode.onclick = getSmsCode;
					return;
				}else{
					btnSmscode.onclick = null;
					return;
				}				
			}
		},1000);
	}	
	
	function save(){
		var form = document.getElementById("form");
		var linktel = form.tel.value;
		var smscode = form.smscode.value;
		var oriTel = $("#oriTel").val(); 
		
		if(oriTel.trim()==linktel.trim()){
			return;
		}
		
		if(linktel==""){
			showPopWin(1,"请输入手机号码");
			return;
		}
		if(!checkPhone(linktel)){
			showPopWin(1,"手机号格式不正确");
			return;
		}
		if(smscode.trim()==""){
			showPopWin(1,"请输入验证码");
			return;
		}
		
		var p = $(form).serialize();
		showPopWin(0,"正在处理，请稍候...");
		$.ajax({
			url:'${pageContext.request.contextPath}/changeTel.do?p=savetel',
			type:'post',
			dataType:'json',
			data:p,
			success:function(jd){
				if(jd=="1"){
					showPopWin(0,"修改成功！");
					window.location.replace("${pageContext.request.contextPath}/personCenter.do?p=reindex");
				}else{
					showPopWin(1,"修改失败！");
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

