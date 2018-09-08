<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>系统消息</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="${pageContext.request.contextPath}/weixin/css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weixin/css/app.css" />
		<script src="${pageContext.request.contextPath}/weixin/js/jquery-1.9.0.min.js"></script>
		
	</head>
	<style>
			li{
			list-style: none;
			font-size: 15px;
		}
		.mui-table-view-cell{
			margin-left: -15px;
			padding-left: 20px;
			padding-right: 0px;
		}
		#title{
			width: 100%;
			margin: 0px auto;
			margin-top: 55px;
		}
		#title div{
			width: 40%;
			margin-left: 10%;
		}
		#title ul{
			width: 60%;
			margin-top: -58px;
			margin-left: 40%;
		}
		#txt{
			width: 90%;
			height: auto;
			margin: 0px auto;
			margin-top: 20px;
			border: 1px solid #e6e6e6;
			padding: 10px;
			text-indent: 2em;
			font-family: "宋体";
			font-size:14px;
		}
		#foot{
			width: 70%;
			height: auto;
			margin: 0px auto;
			text-align: center;
			margin-top: 35px;
			padding: 5px;
			word-break: break-all;
			color: #e6e6e6;
			font-size: 15px;
		}
	</style>
	<body style="background-color: white;">
		<header class="mui-bar mui-bar-nav" id="toubu" style="background-color: #FF7900;">
			<a class="mui-icon mui-icon-back mui-action-back mui-pull-left" id="fuwupagexx" index="1" style="color: white;"></a>
			<span class="mui-title" id="shopname" index="1" style="color: white;">关于我们</span>
		</header>
		<div id="title">
			<div>
				<img id="appimg" src="${pageContext.request.contextPath}/weixin/images/shoplogo.png" height="10%" width="50%"/>
			</div>
			<ul >
				<li><span style="color: #000;font-size: 18px;margin-left: -50px;" id="appname"></span></li>
				<!-- <li><h5>www.yixun.com</h5></li> -->
			</ul>	
		</div>
		<div id="txt">
		</div>
		<div class="mui-content" style="padding-top: 0px;background-color: white;margin-top: 15px;">
			<ul class="mui-table-view" style="width: 90%; margin: 0px auto;">
				<li class="mui-table-view-cell">
					<a class="mui-navigate-right">
						<span>版本信息：</span>
						<span id="appbanben"></span>
					</a>
				</li>
			</ul>
		</div>
		<div id="foot" style="">
			<span id="appdate"></span><br />
 			<span id="appcorp"></span>
		</div>
	</body>
	<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
	<script>
		//mui.plusReady(function(){
			window.onload = function(){
				mui.ajax("${pageContext.request.contextPath}/"+'appLunbo.do?p=guanyume',{
					type:"post",
					timeout:30000,
					success:function(data){
						var map=eval("("+data+")");
						$("#appname").html(map.appname);
						$("#txt").html(map.appdetail);
						$("#appbanben").html(map.appbanben);
						$("#appdate").html(map.appdate);
						$("#appcorp").html(map.appcorp);
						$("#appimg").attr('src',"${pageContext.request.contextPath}/"+map.appimg);
					}
				});
			}
			
		//});
	</script>
</html>
