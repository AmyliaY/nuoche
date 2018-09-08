<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.setAttribute("page", 0);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>支付成功</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<!--标准css-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/mui.min.css" />

	</head>
	<style>
		img {
			width: 18%;
			height: 18%;
		}
		
		.photo {
			text-align: center;
			margin-top: 45%;
		}
		
		.success {
			text-align: center;
			font-family: "黑体";
			color: black;
			font-size: 18px;
			letter-spacing: 3px;
		}
		
		.answer {
			text-align: center;
			font-family: "黑体";
			color: black;
			font-size: 11px;
			line-height: 5px;
		}
		body{
			
			background: white;
		}
	</style>

	<body>
		<!-- 客户地址页面标题 -->
		<header class="mui-bar mui-bar-nav" style="background: #ff7900;">
			<h1 class="mui-title" style="color: white;">支付成功</h1>
		</header>
		<p class="photo"><img src="${pageContext.request.contextPath}/weixin/images/success2.png" /></p>
		<p class="success">恭喜您支付成功</p>
		<br />

		<div style="width:100%;height:  60px;  border-top: 0px #E3E3E3 solid;text-align: center;">
			<input id="confirmBtn1" type="button" value="首 页" class="fk_button" style="background: #ff7900;width:120px; color: #FFFFFF;font-size: 15px;" onclick="goIndex()"/>
			<input id="confirmBtn2" type="button" value="个人中心" class="fk_button" style="background: #ff7900;width:120px;color: #FFFFFF;font-size:15px;" onclick="goHome()"/>
		</div>

		<!--<table>
	  	<tr>
	  		<td class="anniu">	<span class="mui-btn mui-btn-success">
					绿色
				</span></td>
				<td  class="anniu">	<span class="mui-btn mui-btn-success">
					绿色
				</span></td>
	  	</tr>
	  	
	  </table>-->

		<!--<table align="center">
			<tr>恭喜你参与成功</tr>
			<tr>恭喜你参与成功</tr>
		</table>-->

	</body>
	<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>	
	<script>
		mui.init();
		//去首页
		function goIndex() {
			window.top.location = "${pageContext.request.contextPath}/weixin/index-main2.jsp";
		}
		
		//去个人中心
		function goHome() {
			window.top.location = "${pageContext.request.contextPath}/weixin/center2.jsp";
		}
		
		
		
		
		
		
		
	</script>
	<html>