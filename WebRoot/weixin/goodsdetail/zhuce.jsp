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

		<title>登陆</title>
		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/jquery-1.9.0.min.js"></script>
		<link href="${pageContext.request.contextPath}/weixin/css/mui.min.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/weixin/home/loginapp.css" rel="stylesheet" />
		 

	</head>

	<body>

		<header class="mui-bar mui-bar-nav" style="background: #ff7900;">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
			<span class="mui-title" style="color: white;">卡卡商城</span>
		</header>

		<div class="mui-content">

			<div class="top3">
				<div class="mui-input-row">
					<input type="text" class="mui-input-clear ren" placeholder="昵称 " id="usersName">
				</div>
				<div class="mui-input-row">
					<input type="text" class="mui-input-clear ren" placeholder="手机号 " id="txtUserName">
				</div>

				<div class="mui-input-row">
					<input type="password" class="mui-input-clear ren1" placeholder="密码" id="txtPassWord">
				</div>
				<div class="mui-input-row">
					<input type="password" class="mui-input-clear ren1" placeholder="确认密码" style="border-top: hidden;border-bottom: hidden;" id="txtPassWord1">
				</div>
				<div class="pwd mui-input-row" style="height: 60px;">
					<input id="yzm" type="text" class="" placeholder="验证码" style="float: left;width:50%;text-indent: 25px;">
					<button type="button" id="btnYz" style="width: 50%;" class="mui-btn  mui-btn-block" >获取验证码</button>
				</div>
			</div>

			<button class="top" id="btnregist">注 册</button>
		</div>
	</body>
	<script type="text/javascript">
	    var miao = 10; //获取验证码等待10s后可再用,值会变
	 	var Maxtime = 10; //获取验证码总等待10s，值不变
		//获取元素
		var username=$("#usersName");	//昵称Object
		var uname = $("#txtUserName"); //用户名Object
		var pwd = $("#txtPassWord"); //密码Object
		var pwd2 = $("#txtPassWord1"); //确认密码Object
		var yzm = $("#yzm"); //验证码Object
	
	
	    mui.init();

	    //1.获取验证码按钮事件
		$("#btnYz").click(function() {
			var reg = /^(13[0-9]|15[012356789]|17[0-9]|18[0-9]|14[57])[0-9]{8}$/;
			if (!reg.test(uname.val())) {
				mui.toast('抱歉，请输入正确的手机号!');
				return;
			}
			mui.ajax("${pageContext.request.contextPath}" + "/message.do?method=get&iphone=" + uname.val()+"&username="+username.val(),{
				type: "post",
				timeout:30000,
				success: function(data) {
					if (data == "false") {
						mui.toast("该手机号已经被注册!");
						return;
					} else if(data=="nameFalse"){
						mui.toast("该昵称已经被使用!");
						username.val("");
						return;
					}else {
						$("#btnYz").attr("disabled", true);
						jishi = setInterval(function() {
							$("#btnYz").text(miao + "s后可以再次发送");
							miao = miao - 1;
							if (miao == 0) {
								$("#btnYz").attr("disabled", false);
								$("#btnYz").text("获取验证码");
								miao = Maxtime;
								clearTimeout(jishi);
							}
						}, 1000);
					}
				},
				error: function() {
					mui.toast('网络异常,请稍候再试');
				}
			});
		});
	
		var index=0;
	    //2.点击注册 按钮事件
		$("#btnregist").click(function() {
			var pass1 = $.trim(pwd.val());
			var pass2 = $.trim(pwd2.val());
			var reg = /^(13[0-9]|15[012356789]|17[0-9]|18[0-9]|14[57])[0-9]{8}$/;
			if(username.val()=="" || username.val()==null)
			{
				mui.toast('请输入昵称');
				return;
			}
			if (!reg.test(uname.val())) {
				mui.toast('请输入正确的手机号!');
				return;
			}
			if(pass1.length<6){
				alert("密码长度不小于6位")
				pwd.val("");
				pwd2.val("");
			}
			if (pass1 != pass2) {
				mui.toast('输入的两次密码不相同，请重新输入!');
				pwd.val("");
				pwd2.val("");
				return;
			}
			var yzcode = $.trim(yzm.val()); //输入的验证码值
			index+=1;
			if(index==1){
			document.getElementById("btnregist").disabled = true;
			document.getElementById("btnregist").innerHTML = "正在注册..."
			mui.ajax({
				url: "${pageContext.request.contextPath}" + "/message.do?method=code&code=" + yzcode + "&mobile=" + uname.val(),
				type: "get",
				dataType: 'text',
				success: function(data) {
					if (data == "yes") {
						mui.ajax({
							url: "${pageContext.request.contextPath}" + "/users.do?p=zhuce",
							data: {
								userName: uname.val(),
								pwd: pass1,
								username:username.val()
							},
							type: "post",
							success: function() {
								mui.toast("注册成功!");
								window.top.location ="${pageContext.request.contextPath}/weixin/home/login.jsp";
							},
							error: function() {
								mui.toast('网络异常,请稍候再试');
							}
						});
					} else {
						index=0;
						mui.toast("验证码错误!");
						yzm.val("");
						document.getElementById("btnregist").disabled = false;
						document.getElementById("btnregist").innerHTML = "注  册"
					}
				},
				error: function() {
					mui.toast('网络异常,请稍候再试');
				}
			});
			}
		});
	
	
	
	
	
	
	
	
	
	
	
	
	
	</script>
	
	

</html>