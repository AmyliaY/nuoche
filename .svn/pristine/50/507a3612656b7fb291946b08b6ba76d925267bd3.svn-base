<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>

<html lang="zh-CN">
<head>
<link href="${pageContext.request.contextPath }/weixin/css/css.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/weixin/css/style.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/weixin/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/weixin/css/font-awesome.css" rel="stylesheet" type="text/css">

<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<!--<meta content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;" name="viewport">--><!--禁用其缩放（zooming）功能-->

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


<script type="text/javascript" src = "https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/popwin.js"></script>




         
<title>卡卡挪车</title>

</head>
<body>

<div id="wrapper" style="top:0">
	<ul>
		<li class="main_top">
			<div class="main_head">
			    <img src="${weixinUser.headimage }">
			    <span>${weixinUser.nickname }</span>
			</div>
		</li>		
		<li>
			<a  class="main_list">
			    <img src="${pageContext.request.contextPath }/weixin/images/main_07.jpg"/>
			    <span>电话号码：<strong onclick="changeTel()">${pcuser.tel }</strong>
			    </span>
		    	
			</a>
		</li>
		<li>
			<a class="main_list">
			    <img src="${pageContext.request.contextPath }/weixin/images/main_07.jpg"/>
			    <span>车牌号码：
			        <c:if test="${empty pcuser}" var="f">
			    		<strong onclick="bindCepai()">绑定车牌</strong>
			    	</c:if>
			    	
			    	<c:if test="${not f}">
			    	   <strong>${pcuser.plateNumber }</strong>
			    	</c:if>
			    </span>
		    	
			</a>
		</li>
		<li style="display: none;">
			<a  class="main_list">
			    <img src="${pageContext.request.contextPath }/weixin/images/main_07.jpg"/>
			    <span>到期时间：
			    	<c:if test="${empty requestScope.pcuser}" var="f">
			    		<strong></strong>
			    	</c:if>
			    	<c:if test="${not empty pcuser}">
			    	   <strong >${overdueTime}</strong><strong style="text-align: right" onclick="xufei()">点击续费</strong>
			    	</c:if> 
			    	<%-- <strong >${pcuser.overdueTime}</strong>
			    	<button onclick="xufei()" value="续费" style=""></button> --%>
			    </span>
			</a>
		</li>
		
		
		<li class="main_menu">
			<a href="${pageContext.request.contextPath }/ordercenter.do?method=index&openid=${openid }" style="width:50%"><img src="${pageContext.request.contextPath }/weixin/images/main_25.jpg" ><span>订单中心</span></a>
			<a href="${pageContext.request.contextPath }/moveCarDetail.do?method=index&openid=${openid }&page=1" style="border-right: none;width:50%"><img src="${pageContext.request.contextPath }/weixin/images/main_14.jpg" ><span>挪车记录</span></a>  
			<a href="${pageContext.request.contextPath }/mymoney.do?p=allmoney" style="width:33.33%"><img src="${pageContext.request.contextPath }/weixin/images/main_22.jpg"><span>我的钱包</span></a>
			<a href="${pageContext.request.contextPath }/weixin/myExtention.jsp" style="width:33.33%"><img src="${pageContext.request.contextPath }/weixin/images/main_16.jpg"><span>我的推广</span></a>
			<a href="${pageContext.request.contextPath }/aboutwe.do?p=aboutwe" style="width:33.33%"><img src="${pageContext.request.contextPath }/weixin/images/main_22.jpg"><span>关于我们</span></a>
		</li>
	</ul>
</div>

<footer class="footA">
	<span>
		<a>
			<strong><i></i></strong>
		</a>
	</span>
	<div></div>
</footer>


<script type="text/javascript">
    	
    	
	   
	    function bindCepai()
	    {
	      location = "${pageContext.request.contextPath }/move.do?p=moveCar";
	    }
	   
	    function changeTel()
	    {
	      location = "${pageContext.request.contextPath }/changeTel.do?p=changeTel&oldtel=${pcuser.tel }";
	    }

		function xufei()
		{
			location = "${pageContext.request.contextPath }/userxufei.do?p=userxufei&openid=${weixinUser.openid}";
		}
    </script>


</body>

</html>
