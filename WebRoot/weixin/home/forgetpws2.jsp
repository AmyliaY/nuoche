<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.getSession().setAttribute("page", 0);
%>
<!DOCTYPE html>
<html>
	<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<title></title>
        <script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/jquery-1.9.0.min.js"></script>
		<link href="${pageContext.request.contextPath}/weixin/css/mui.min.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/weixin/home/loginapp.css" rel="stylesheet" />
		 

	</head>
	<body>
		<header class="mui-bar mui-bar-nav" style="background-color: #FF7900;">
			<a style="color: white;" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left jiantou" style="background-color: #FF7900;"></a>
			<h1 style="color: white;" class="mui-title">米禾商城</h1>
		</header>
        <div class="mui-content">
            <div class="top3">
				<div class="mui-input-row">
					<input type="password" class="mui-input-clear ren1" placeholder="新密码" id="txtPassWord">
				</div>
				
				<div class="mui-input-row">
					<input type="password" class="mui-input-clear ren1" placeholder="确认密码" style="border-top: hidden;border-bottom: hidden;" id="txtPassWord1">
				</div>
				
			</div>
			
			<button class="top" id="btnregist">确认</button>
	    </div>
	</body>
	<script type="text/javascript">
		
	    mui.init();
	    var pwd = $("#txtPassWord"); //密码Object
		var pwd2 = $("#txtPassWord1"); //确认密码Object
		var uname='${param.uname}';
		//2.点击注册 按钮事件
		$("#btnregist").click(function() {
			var pass1 = $.trim(pwd.val());
		
			var pass2 = $.trim(pwd2.val());
			
			
			if(pass1.length<6){
				mui.toast('密码长度不小于六位');
				pwd.val("");
				pwd2.val("");
				return;
			}
			if (pass1 != pass2) {
				mui.toast('输入的两次密码不相同，请重新输入!');
				pwd.val("");
				pwd2.val("");
				return;
			}
			mui.ajax({
							url: "${pageContext.request.contextPath}" + "/users.do?p=updatepws",
							data: {
								userName: uname,
								pwd: pass1,
							},
							type: "post",
							success: function() {
								mui.toast("修改密码");
								window.location = "${pageContext.request.contextPath}/weixin/home/login.jsp";
							},
							error: function() {
								mui.toast('网络异常,请稍候再试');
							}
						});
			});
	
	
		
		
		
		
		
		
		
		
		
		
	</script>
</html>
