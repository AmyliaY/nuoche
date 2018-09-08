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
			<h1 style="color: white;" class="mui-title">卡卡商城</h1>
		</header>

        <div class="mui-content">
        	
        	<div class="top3">
        		<div class="mui-input-row">
					<input type="text" class="mui-input-clear ren" placeholder="手机号 " id="txtUserName">
				</div>
				
				<div class="pwd mui-input-row" style="height: 60px;">
					<input id="yzm" type="text" class="" placeholder="验证码" style="float: left;width:50%;text-indent: 25px;">
					<button type="button" id="btnYz" style="width: 50%;" class="mui-btn  mui-btn-block" >获取验证码</button>
				</div>
			</div>	
			
			<!--<div class="top"><span id="nextone"  disabled="disabled" style="margin-top: 20px;">下一步</span></div>-->
				<button class="top" id="nextone">下一步</button>
        </div>
	</body>
    <script  type="text/javascript">
    
        var miao = 10; //获取验证码等待10s后可再用,值会变
	 	var Maxtime = 10; //获取验证码总等待10s，值不变
		//获取元素
		var uname = $("#txtUserName"); //用户名Object
		var yzm = $("#yzm"); //验证码Object
	    mui.init();


    	 //1.获取验证码按钮事件
		$("#btnYz").click(function() {
			var reg = /^(13[0-9]|15[012356789]|17[0-9]|18[0-9]|14[57])[0-9]{8}$/;
			if (!reg.test(uname.val())) {
				mui.toast('抱歉，请输入正确的手机号!');
				return;
			}
			mui.ajax("${pageContext.request.contextPath}" + "/message.do?method=fows&iphone=" + uname.val(),{
				type: "post",
				timeout:30000,
				success: function(data) {
					if (data == "false") {
						mui.toast("请先注册");
						return;
					} else {
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
	
	
	
	    //2.检查验证码是否正确
		$("#nextone").click(function() {
			
			
			
			var a = uname.val();
			var yzcode = $.trim(yzm.val()); //输入的验证码值
              if(!(/^1[3|4|5|7|8][0-9]{9}$/.test(a))){ 
				return;
			}else{
				mui.ajax({
				url: "${pageContext.request.contextPath}" + "/message.do?method=code&code=" + yzcode + "&mobile=" + uname.val(),
				type: "get",
				dataType: 'text',
				success: function() {
						window.location = "${pageContext.request.contextPath}/weixin/home/forgetpws2.jsp?uname="+a;
				},
				error: function() {
					mui.toast('网络异常,请稍候再试');
				}
			});
				
			}
		
		
			
			
		});
	
	
    </script>
</html>
