<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="../css/mui.min.css" rel="stylesheet" />
		<script src="../js/mui.min.js"></script>
		<script src="../js/jquery-1.9.0.min.js"></script>
		

	</head>

	<style>
		.nav-header {
			background-color: #000000;
			color: white;
		}
		
		.nav-header h1 {
			text-align: left;
		}
		
		.nav-header a {
			color: white;
		}
		
		#name-div {
			margin-top: 10px;
			padding: 0 8px;
		}
		
		#name {
			border: none;
			background: none;
			border-bottom: 1px solid #FF6700;
			font-size: 16px;
			margin-bottom: 10px;
		}
		
		.box-a {
			padding: 0 8px;
		}
		
		.tishi {
			margin-bottom: 12px;
			font-size: 12px;
		}
		
		#updata {
			width: 100%;
			background-color: #FF6700;
			color: white;
			height: 40px;
			font-size: 16px;
		}
	</style>

	<body>

		<header class="mui-bar mui-bar-nav" style="background: #ff7900;">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
			<h1 class="mui-title" style="color: white;">我的昵称</h1>
		</header>
		<div class="mui-content">
			<form>
				<div class="mui-input-row" id='name-div'>
					<input type="text" class="mui-input-clear" id="name" />
				</div>
				<div class="box-a">
					<p class="tishi">注意：请不要包含敏感词汇，长度在3-24个字符之间</p>
					<input type="button" id="updata" value="保存" />
				</div>
			</form>
		</div>

		<script type="text/javascript">
			mui.init();
			mui.plusReady(function() {
			${userinfo.usersId}ntWebview();
				oldname = user.username;
				userid = '${userinfo.usersId}';
				$("#name").val(user.username);

			
			document.getElementById("updata").addEventListener("tap", function() {
				var newname = $("#name").val().trim();
				if(newname == oldname) {
					mui.toast("新的昵称不能和之前相同");
					return;
				}
				if(newname.length<3||newname > 24){
					mui.toast("昵称应在3-24个字符之间");
					return;
				}
				mui.ajax(SERVER_URL + "/appuserinfo.do?p=updUsername", {
					data: {
						userid: userid,
						username: newname,
					},
					type: "post",
					timeout: 30000,
					success: function(data) {
						if("exist" == data) {
							mui.toast("用户名已存在")
						}
						if("success" == data) {
							mui.toast("修改成功!");
							plus.webview.currentWebview().opener().reload();
							mui.back();
						}
					},
					error: function() {
						mui.toast('网络异常,请稍候再试');
					}
				})
			})
			})
		</script>
	</body>

</html>