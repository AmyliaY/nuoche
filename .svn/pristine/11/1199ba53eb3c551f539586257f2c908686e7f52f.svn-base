<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%><!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>修改推荐人</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		
		<link href="../css/mui.min.css" rel="stylesheet" />
		
		<script src="../js/mui.min.js"></script>
		<script src="../js/jquery-1.9.0.min.js"></script>
	</head>
	<body>
		<header class="mui-bar mui-bar-nav" style="background: #ff7900;">
			<span class="mui-icon mui-icon-arrowleft mui-action-back" style="color: white;"></span>
			<span id="title" class="mui-title" style="color: white;"></span>
		</header>
		<form class="mui-input-group" style="margin-top: 50px;">
			<div class="mui-input-row" style="color: #8F8F94;">
				<label>手机号</label>
				<input type="text" id="usersPhone" class="mui-input-clear" placeholder="推荐人手机号码">
			</div>
		</form>
		<div class="mui-button-row">
			<button type="button" class="mui-btn" style="margin-top:15px;background-color: #ff7900; color: white;" id="updateButton" >保存</button>
		</div>
	</body>
	
	<script>
		mui.init();
		var usersPhone=null;
		var userid='${userinfo.usersId}';
		var txt=null;
		mui.plusReady(function(){
			var opener=plus.webview.currentWebview().opener().id;
			if(opener=="center/mytuijianren.html"){
				document.getElementById('title').innerText="修改推荐人";
				txt="修改成功！";
			}
			if(opener=="center.html"){
				document.getElementById('title').innerText="添加推荐人";
				txt="添加成功！";
			}
			
			usersPhone=plus.webview.currentWebview().usersPhone;
			if(usersPhone!=null){
				document.getElementById("usersPhone").value=usersPhone;
			}
		});
		$('#updateButton').click(function(){
			usersPhone=document.getElementById("usersPhone").value;
			userid='${userinfo.usersId}';
			if(usersPhone==""){
				mui.toast("请输入推荐人号码")	;
			}else{
				mui.ajax(SERVER_URL+'appuserinfo.do?p=updMytuijianren&phone='+usersPhone+'&userid='+userid,{
					type:'post',
					timeout:30000,
					success:function(data){
						if(data=="该用户不存在"){
							mui.toast("该用户不存在");
						}else{
							mui.toast(txt);
							mui.back();
						}
					}
				});
			}
		});
	</script>
	
</html>
