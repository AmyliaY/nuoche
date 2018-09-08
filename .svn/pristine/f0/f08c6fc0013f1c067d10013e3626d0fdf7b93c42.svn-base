<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.setAttribute("page", 4);
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
<link href="${pageContext.request.contextPath}/weixin/css/css.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/weixin/css/style.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/weixin/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/weixin/css/font-awesome.css" rel="stylesheet" type="text/css">

<style type="text/css">
	body{ padding: 0 0 10px 0; height: 100%; box-sizing: border-box; overflow: visible;}
</style>

<script type="text/javascript" src = "${pageContext.request.contextPath}/weixin/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath}/weixin/js/jquery.form.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath}/weixin/js/popwin.js"></script>
         
<title>我的钱包</title>

</head>
<body>

<div id="wrapperX">
	<ul>
		<li class="main_menuAT">
			<a><span>我的余额</span></a>
			
		</li>
		
		
		<li class="main_menuAC">
			<a style="color:#3598db;"><strong><fmt:formatNumber value="${tjmap.ketixiansum}" type="currency"/></strong><br /><span>可提现余额</span></a>
			<a   style="color:#3598db;"><strong><fmt:formatNumber value="${tjmap.ketixianzhongsum}" type="currency"/></strong><br /><span>提现中金额</a>
			<a  style="border: none;color:#3598db;"><strong><fmt:formatNumber value="${tjmap.yitixiansum}" type="currency"/></strong><br /><span>已提现</span></a>
		</li>
		<!--<li class="butB">
			<a href="/ucenter/mypoint/list.do" class="butBlue">积分明细</a> 
			<a class="butRed" style="float: right;" onclick="tixian()">我要提现</a>
		</li>-->
		<!--<li class="butC"><a class="butWhite" onclick="invite()">邀请好友</a></li>-->
		
		<li class="butC" style="margin-top:15px"><a class="butWhite" href="${pageContext.request.contextPath }/weixin/shenqingtixian.jsp">申请提现</a></li>
	</ul>
</div>

<input type="hidden" id="userId" value="7924"/>
<input type="hidden" id="openid" value="o-mkH1EKhNzK6Y_rM48rxkYEynkA"/>

<div>
	<input type="hidden" id="noncestr" value="3abc013f25b040aea2e597d65d4ddfc5"/>
	<input type="hidden" id="timestamp" value="1523103627"/>
	<input type="hidden" id="sign" value="b72e08d829a3640654a4fbd6f29de5ebd8e18a77"/>
	<input type="hidden" id="appId" value="wxfe8112ded32a6e1a"/>	
	<input type="hidden" id="host"  value=""/>
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

<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>







</body>




</html>