<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
session.setAttribute("page", 4);
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>个人中心</title>
		<meta name="viewport"
			content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="${pageContext.request.contextPath}/weixin/css/mui.min.css"
			rel="stylesheet" />
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/weixin/css/iconfont.css">
		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/weixin/js/jquery-2.1.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/shuaxin.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/layer/layer.js"></script>
	</head>

	<style>
html {
	overflow-x: hidden;
	overflow-y: hidden;
	height: 100%;
}

body {
	overflow-x: hidden;
	overflow-y: hidden;
	height: 100%;
}

.nav-header {
	background-color: #000000;
	color: white;
}

.nav-header h1 {
	text-align: left;
	padding-left: 25px;
}

.nav-header a {
	color: white;
}

.box-a {
	padding-top: 40px;
	height: 150px;
	text-align: center;
	background-image:
		url(${pageContext.request.contextPath}/weixin/images/muwu.jpg);
	background-size: 100% 100%;
}

.box-a img {
	height: 60px;
	border-radius: 100px;
}

.box-a p {
	color: white;
	font-size: 16px;
}

.box-b {
	height: 60px;
	text-align: center;
	border-bottom: 1px solid #efeff4;
}

.box-b button {
	margin-top: 15px;
	border-radius: 30px;
	width: 180px;
	height: 30px;
}

.box-c {
	overflow: hidden;
	background: white;
	height: 500px;
}

.box-c-1 {
	width: 25%;
	height: 72px;
	float: left;
	text-align: center;
	padding: 5px 0;
	border-right: 1px solid #efeff4;
	border-bottom: 1px solid #efeff4;
}

.box-c-1 img {
	width: 100%;
	height: 100%;
}

.box-c-2 {
	margin: 10px auto;
	height: 26px;
	width: 26px;
}

.box-c-1 p {
	font-size: 10px;
	margin-top: -3px;
	padding: 0px;
}

.userinfo {
	text-align: center;
	background: whitesmoke;
	height: 160px;
}

.userinfo img {
	width: 80px;
	height: 80px;
	margin-top: 30px;
}

.userName {
	font-size: 16px;
	color: black;
}
</style>

	<body>
		<header id="header" class="mui-bar mui-bar-nav nav-header"
			style="background-color: #FF7900;">
		<h1 class="mui-title"
			style="text-align: center; background-color: #FF7900; color: white;">
			个人中心
		</h1>
		</header>
		<div class="mui-content">
			<!-- 这里是未登录 -->
			<div class="userinfo" id="login">
				<img src="${pageContext.request.contextPath}/weixin/img/ve.png"
					style="border-radius: 30px;" />
				<p class="userName">
					立即登录
				</p>
				<div style="margin-top: 22px;">
					<hr />
				</div>
			</div>
			<div class="userinfo" id="userinfo" style="display: none;">
				<img src="${pageContext.request.contextPath}/weixin/img/ve.png"
					id="edit_img" style="border-radius: 30px;" />
				<p class="userName">
				</p>
			</div>
			<div class="box-b" id="jifen" style="display: none;">
				<button id='alertBtn' type="button"
					class="mui-btn mui-btn-blue mui-btn-outlined">
					我的积分:1005
				</button>
			</div>
			<div class="box-c">
				<div class="box-c-1" id="Top-Up">
					<div class="box-c-2">
						<img
							src="${pageContext.request.contextPath}/weixin/img/center/chongzhi.png">
					</div>
					<p>
						充值中心
					</p>
				</div>
				<div class="box-c-1">
					<div class="box-c-2" id='goods-order'>
						<img
							src="${pageContext.request.contextPath}/weixin/img/center/order.png">
					</div>
					<p>
						商品订单
					</p>
				</div>
				<div class="box-c-1">
					<div class="box-c-2" id='address'>
						<img
							src="${pageContext.request.contextPath}/weixin/img/center/address.png">
					</div>
					<p>
						收货地址
					</p>
				</div>
				<div class="box-c-1">
					<div class="box-c-2" id="collection">
						<img
							src="${pageContext.request.contextPath}/weixin/img/center/details.png">
					</div>
					<p>
						我的收藏
					</p>
				</div>
				<div class="box-c-1" id="systemmessage" style="display: none;">
					<div class="box-c-2">
						<img
							src="${pageContext.request.contextPath}/weixin/img/center/dianpu.png">
					</div>
					<p>
						系统消息
					</p>
				</div>
				<div class="box-c-1" id="gonggao" style="display: none;">
					<div class="box-c-2">
						<img
							src="${pageContext.request.contextPath}/weixin/img/center/shezhi.png">
					</div>
					<p>
						系统公告
					</p>
				</div>
				<div class="box-c-1" id="tongzhi" style="display: none;">
					<div class="box-c-2">
						<img
							src="${pageContext.request.contextPath}/weixin/img/center/address.png">
					</div>
					<p>
						通知
					</p>
				</div>
				<div class="box-c-1" id="xiaxian">
					<div class="box-c-2">
						<img
							src="${pageContext.request.contextPath}/weixin/img/center/tuandui.png">
					</div>
					<p>
						已推荐的会员
					</p>
				</div>
				<div class="box-c-1" id="erweima">
					<div class="box-c-2">
						<img
							src="${pageContext.request.contextPath}/weixin/img/center/record.png">
					</div>
					<p>
						我的二维码
					</p>
				</div>
				<!--
                	<div class="box-c-1" id="tuijianren">
					<div class="box-c-2"><img src="img/center/phone.png"></div>
					<p>推荐人</p>
					</div>
                -->
				<div class="box-c-1" id="zhuxiao_login">
					<div class="box-c-2">
						<img
							src="${pageContext.request.contextPath}/weixin/images/user-photo.png">
					</div>
					<p>
						注销
					</p>
				</div>
				<div class="box-c-1" id="guanyume" style="display: none;">
					<div class="box-c-2">
						<img
							src="${pageContext.request.contextPath}/weixin/images/i-wo.png">
					</div>
					<p>
						关于我们
					</p>
				</div>
				<div class="box-c-1" id="dianpu" style="display: none;">
					<div class="box-c-2">
						<img
							src="${pageContext.request.contextPath}/weixin/img/center/dianpu.png">
					</div>
					<p>
						我的店铺
					</p>
				</div>
			</div>
			<script type="text/javascript">
			//得到工程路径
function getRootPath() {
	//http://localhost:8083/uimcardprj/share/meun.jsp
	var curWwwPath = window.document.location.href;
	//uimcardprj/share/meun.jsp
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	//http://localhost:8083
	var localhostPaht = curWwwPath.substring(0, pos);
	// uimcardprj
	var projectName = pathName
			.substring(0, pathName.substr(1).indexOf('/') + 1);
	if (projectName == "/pc" || projectName == "/admin" || projectName == "/weixin"  || projectName == "/wap")
		projectName = "";

	return (localhostPaht+projectName);
}
var root = getRootPath();
				mui.init({
					keyEventBind: {
						backbutton: false
					}
				});

				window.addEventListener("showMsg", function(e) {

					layer.open({
						content: '<div style="height:100%;width:100%"><div><img src="${pageContext.request.contextPath}/weixin/images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>再按一次退出！</div>',
						time: 1
					});
				})
				
				var Userinfo = null; //会员信息
				var userid = '${userinfo.usersId}'; //会员ID
				var userPhone = '${userinfo.usersPhone}'; //会员手机号码
				//会员登录成功后自定义事件
				if(userid.trim().length > 0){
					Usershow(Userinfo);
				}else{
					//window.top.location = "${pageContext.request.contextPath}/weixin/home/login.jsp";					
				}
				window.addEventListener("userinfo", function(event) {
					Usershow(Userinfo);
					//location.reload();
					//plus.webview.getWebviewById('collection/collection.html').reload();
					//plus.webview.getWebviewById('shopingcart/cart.html').reload();
					//plus.webview.getWebviewById('crowdfunding/crowdfunding.html').reload();
					//shuaxin();
				});
				//			alert(Userinfo);
				//显示会员信息
				function Usershow(Userinfo) {
					$("#login").css('display', 'none');
					$("#userinfo").css('display', 'block');
					//如果用户未设置头像则用默认头像
					if(${not empty userinfo.usersHeadimg}) {
						$('#userinfo').find('img').attr('src', "${pageContext.request.contextPath}/${userinfo.usersHeadimg}"); //用户头像
					} else if (${not empty weixinuser.headimage}) {
						$('#userinfo').find('img').attr('src', "${weixinuser.headimage}"); //用户头像	
					}
					else 
					{
					  $('#userinfo').find('img').attr('src', "${pageContext.request.contextPath}/weixin/images/user-photo.png"); //用户头像user-photo.png
					}
					$('#userinfo').find('.userName').html('${userinfo.usersName}'); //用户昵称
					$('#jifen').css('display', 'block'); //显示div盒子
					$('#alertBtn').html('我的积分:${userinfo.usersIntegral}') //用户积分
				}
				/*我的积分*/
				$("#alertBtn").click(function() {
					//					var integral = document.getElementById("alertBtn").innerText.substring(5);
					//					mui.openWindow({
					//						url: 'jifen/integral.html',
					//						extras: {
					//							integral: integral
					//						}
					//					});
					
			      // window.top.location="${pageContext.request.contextPath}/weixin/center/jifenzhuanran.jsp";	
					/*mui.openWindow({
						url: "center/payrecords.html",
						id: "payrecords",

						extras: {
							userid: userid,
						}
					});*/
				});
				$("#collection").click(function() {
					/*mui.openWindow({
						url: "/collection/collection.html",
						id: "collection.html"
					});*/
                 
                     
                     window.top.location="${pageContext.request.contextPath}/weixin/collection/collection_center.jsp";	
					//				var aniShow = {};
					//				//选项卡点击事件
					//				var targetTab = this.getAttribute('href');
					//				
					//				//显示目标选项卡
					//				//若为iOS平台或非首次显示，则直接显示
					//				if(mui.os.ios || aniShow[targetTab]) {
					//					plus.webview.show(targetTab);
					//				} else { 
					//					//否则，使用fade-in动画，且保存变量
					//					var temp = {};
					//					temp[targetTab] = "true";
					//					mui.extend(aniShow, temp);
					//					plus.webview.show(targetTab, "pop-in", 300);
					//				}
					//				//更改当前活跃的选项卡(修改样式以及父界面的activeTab属性使父界面得到当前的活跃界面是收藏而不是原来的个人中心)
					//				plus.webview.currentWebview().parent().evalJS("$('.mui-tab-item').removeClass('mui-active');$('#sc').addClass('mui-active');activeTab='collection/collection.html';");
					//				//隐藏当前个人中心界面;
					//				plus.webview.currentWebview().hide();
					//				//显示收藏界面
					//				plus.webview.getWebviewById('collection/collection.html').show();

				});
				//已推荐的会员
				$('#xiaxian').click(function() {
					if(userid == null || userid == "") {
						mui.openWindow({
							url: '${pageContext.request.contextPath}/weixin/home/login.jsp',
							show: {
								duration: 250
							}
						});
						mui.toast('请先登录');
						return;
					} else {
						mui.openWindow({
							url: '${pageContext.request.contextPath}/weixin/jifen/xiaxian.jsp',
						});
					}
				});
				//系统消息
				$("#systemmessage").click(function() {
					if(userid == null || userid == "") {
						mui.openWindow({
							url: '${pageContext.request.contextPath}/weixin/home/login.jsp',
							show: {
								duration: 250
							}
						});
						mui.toast('请先登录');
						return;
					} else {
						mui.openWindow({
							url: '${pageContext.request.contextPath}/weixin/center/systemmessages.jsp',

						});
					}
				});
				/**
				$("#tuijianren").click(function(){
					if(userid == null || userid == "") {
						mui.openWindow({
							url: 'home/login.html',
							show: {
								duration: 250
							}
						});
						mui.toast('请先登录');
						return;
					} else {
						mui.ajax("${pageContext.request.contextPath}/"+'appuserinfo.do?p=getMytuijianren&userid='+userid,{
							type:'post',
							timeout:30000,
							success:function(data){
								var map=eval("("+data+")");
								if(map.list.length==0){
									mui.openWindow({
										url: 'center/updtuijianren.html',//添加推荐人
										extras: {
											
										}
									});
								}else{
									mui.openWindow({
										url: 'center/mytuijianren.html',//显示我的推荐人
										extras: {
											
										}
									});
								}
							}
						});
					}
				});
				**/
				$("#edit_img").click(function() {
					if(mui.os.plus) {
						var a = [{
							title: "拍照"
						}, {
							title: "从手机相册选择"
						}];
						plus.nativeUI.actionSheet({
							title: "修改头像",
							cancel: "取消",
							buttons: a
						}, function(b) { /*actionSheet 按钮点击事件*/
							switch(b.index) {
								case 0:
									break;
								case 1:
									paizhao(); /*拍照*/
									break;
								case 2:
									getImg(); /*打开相册*/
									break;
								default:
									break;
							}
						})
					}

				});
				//拍照
				function paizhao() {
					var c = plus.camera.getCamera();
					c.captureImage(function(e) {
						plus.io.resolveLocalFileSystemURL(e, function(entry) {
							var s = entry.toLocalURL(); //得到文件名字
							uploadImages(s); //上传图片
						}, function(e) {
							console.log("读取拍照文件错误：" + e.message);
						});
					}, function(s) {
						console.log("error" + s.message);
					});
				}
				//从相册选择
				function getImg() {
					plus.gallery.pick(function(a) {
						plus.io.resolveLocalFileSystemURL(a, function(entry) {
							var img = entry.fullPath;
							uploadImages(img);

						}, function(e) {
							console.log("读取图片错误：" + e.message);
						});
					}, function(a) {
						console.log("读取图片异常", a.message)
					});
				};
				//上传头像图片
				function uploadImages(imgPath) {
					var image = document.getElementById("edit_img");
					image.src = imgPath;

					image.onload = function() {
						var imgdata = getBase64Image(image);
						mui.ajax("${pageContext.request.contextPath}/" + 'applogin.do?p=uploadHeadimg&id=' + userid, {
							data: {
								imgPath: imgPath,
								imgdata: imgdata,
								userPhone: userPhone
							},
							type: 'post',
							timeout: 30000,
							success: function(data) {
								if(data == "true") {
									mui.alert("更改头像成功");

								} else {
									mui.alert("更改头像失败");
									
								}
							},
							error: function(xhr, type, errorThrown) {
								//异常处理；
								if(type == 'timeout') {
									layer.open({
										content: '<div style="height:100%;width:100%"><div><img src="images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器开了小差，请求超时了</div>',
										time: 2
									});
									//$(".hidden_div2").show();
									//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
									return;
								}
								if(type == 'abort') {
									layer.open({
										content: '<div style="height:100%;width:100%"><div><img src="images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>亲，您的网络有点问题哦！</div>',
										time: 2
									});
									//$(".hidden_div2").show();
									//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
									return;
								} else {
									layer.open({
										content: '<div style="height:100%;width:100%"><div><img src="images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器拒绝了连接，稍后再试吧！</div>',
										time: 2
									});
									//$(".hidden_div2").show();
									//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
									return;
								}
							}
						});
					}

				}
				//将图片压缩转成base64  
				function getBase64Image(img) {
					var canvas = document.createElement("canvas");
					var width = img.width;
					var height = img.height;
					// calculate the width and height, constraining the proportions  
					if(width > height) {
						if(width > 100) {
							height = Math.round(height *= 100 / width);
							width = 100;
						}
					} else {
						if(height > 100) {
							width = Math.round(width *= 100 / height);
							height = 100;
						}
					}
					canvas.width = width; /*设置新的图片的宽度*/
					canvas.height = height; /*设置新的图片的长度*/
					var ctx = canvas.getContext("2d");
					ctx.drawImage(img, 0, 0, width, height); /*绘图*/
					var dataURL = canvas.toDataURL("image/png", 0.8);
					return dataURL.replace("data:image/png;base64,", "");
				}

				function updateUserTimer() {
							mui.post("${pageContext.request.contextPath}/" + "applogin.do?p=getUsersinfo", function(data) {
									if(data == "请先登录") {

									} else {
										var json = eval("(" + data + ")");
										$('#alertBtn').html('我的积分:' + json.usersIntegral) //用户积分
									}
								}

							);

					//});

				}
				updateUserTimer();
				window.setInterval("updateUserTimer()", 5000);

				//mui.plusReady(function() {
				/*
				window.onload = function (){
					var username = null;
					var userpwd = null;
					$.post("${pageContext.request.contextPath}/wapUser.do?p=login",function(data){
		               if (data=="请先登录")
		               {
		                  
		                 // mui.toast("自动登录失败");
		               }
		              else
		               {
		                  Userinfo  = eval("("+data+")");
		                  userid = Userinfo.usersId;
					      userPhone = Userinfo.usersPhone;
					      Usershow(Userinfo);
		                  //mui.toast("自动登录成功");
		               }
		             });
		          }*/
					
					//判断会员是否登录
					
					/*else{
					mui.ajax("${pageContext.request.contextPath}/"+'applogin.do?p=getUsersinfo',{
					type:"post",
					success:function(data)
					{
						if(data=="请先登录")
						{
							mui.toast("请先登录");
							mui.openWindow({
								url:'/home/login.html'
							});
						}else{
							//var json =eval("("+data+")");
							Usershow(data);
						}
					}
					});
					}*/
					//注销
					$("#zhuxiao_login").click(function() {
						mui.confirm("确定要注销吗？", function(e) {
							if(e.index == 1) {
								$.post("${pageContext.request.contextPath}/weixin_login.do?p=zhuxiao", {}, function(data) {
									window.top.location = "${pageContext.request.contextPath}/weixin/index-main.jsp";
								});
							}
						});
					});
				//});
				//登录
				$("#login").click(function() {
					mui.openWindow({
						url: '${pageContext.request.contextPath}/weixin/home/login.jsp',
						show: {
							duration: 250
						}
					});
				});

				//订单页面
				$("#goods-order").click(function() {
					mui.post("${pageContext.request.contextPath}/" + 'applogin.do?p=getUsersinfo', {}, function(data) {
						if(data == "请先登录") {
							goLogin();
							return;
						}
						
						window.top.location="${pageContext.request.contextPath}/weixin/center/order.jsp?userid="+userid;
						/*mui.openWindow({
							url: 'center/order.html',
							show: {
								duration: 250
							},
							extras: {
								userid: userid
							}
						});*/
					});
				});
				//二维码
				$("#erweima").click(function() {
					mui.post("${pageContext.request.contextPath}/" + 'applogin.do?p=getUsersinfo', {}, function(data) {
						if(data == "请先登录") {
							goLogin();
							return;
						}
						
						window.top.location="${pageContext.request.contextPath}/weixin/center/myerweima.jsp?userid="+userid+"&userPhone="+userPhone;
						/*mui.openWindow({
							url: 'center/myerweima.html',
							show: {
								duration: 250
							},
							extras: {
								userid: userid,
								userPhone: userPhone
							}
						});*/
					});
				});
				//收货地址
				$("#address").click(function() {
					if(userid == null || userid == "") {
						mui.openWindow({
							url: '${pageContext.request.contextPath}/weixin/home/login.jsp',
							show: {
								duration: 250
							}
						});
						mui.toast('请先登录');
						return;
					}
					
					
					window.top.location="${pageContext.request.contextPath}/weixin/center/address.jsp?userid="+userid;
					/*mui.openWindow({
						url: 'center/address.html',
						id: 'center/address.html',
						show: {
							duration: 250
						},
						extras: {
							userid: userid
						},
						show: {
							autoShow: true
						}
					});*/
				});

				//充值中心
				$("#Top-Up").click(function() {
					mui.post("${pageContext.request.contextPath}/" + 'applogin.do?p=getUsersinfo', {}, function(data) {
						if(data == "请先登录") {
							goLogin();
							return;
						}
						
						window.top.location="${pageContext.request.contextPath}/weixin/center/recharge.jsp?userid="+userid;
						/*mui.openWindow({
							url: 'center/recharge.html',
							id: 'center/recharge.html',
							show: {
								duration: 250
							},
							extras: {
								userid: userid
							}
						});*/
					});
				});
				//系统公告
				$("#gonggao").click(function() {
					if(userid == null || userid == "") {
						mui.openWindow({
							url: '${pageContext.request.contextPath}/weixin/home/login.jsp',
							show: {
								duration: 250
							}
						});
						mui.toast('请先登录');
						return;
					} else {
						
						window.top.location="${pageContext.request.contextPath}/weixin/jifen/gonggao.jsp?userid="+userid;
						/*mui.openWindow({
							url: 'jifen/gonggao.html',
							show: {
								duration: 250
							},
							extras: {
								userid: userid
							}
						});*/
					}
				});
				//通知
				$("#tongzhi").on('tap', function() {
					if(userid == null || userid == "") {
						mui.openWindow({
							url: '${pageContext.request.contextPath}/weixin/home/login.jsp',
							show: {
								duration: 250
							}
						});
						mui.toast('请先登录');
						return;
					} else {
						window.top.location="${pageContext.request.contextPath}/weixin/center/tongzhi-main.jsp?userid="+userid;
						/*mui.openWindow({
							url: 'center/tongzhi-main.html',
							show: {
								autoShow: true
							},
							extras: {
								userid: userid
							}
						});*/
					}
				});
				//关于我们
				$("#guanyume").click(function() {
					mui.openWindow({
						url: '${pageContext.request.contextPath}/weixin/center/guanyume.jsp',
						show: {
							duration: 250
						}
					});
				});
				//去登录界面
				function goLogin() {
					mui.openWindow({
						url: '${pageContext.request.contextPath}/weixin/home/login.jsp',
						show: {
							duration: 250
						}
					});
					mui.toast('请先登录');
				};
				//修改昵称
				$(".userName").click(function() {
					username = $("#userinfo").find(".userName").html();
					window.top.location="${pageContext.request.contextPath}/weixin/center/upd-name.jsp?userid="+userid+"&username="+username;
					/*mui.openWindow({
						url: 'center/upd-name.html',
						show: {
							duration: 250
						},
						extras: {
							userid: userid,
							username: username
						}
					});*/
				})
				
				
				//我的店铺
				$("#dianpu").click(function() {
					if(userid == null || userid == "") {
						mui.openWindow({
							url: '${pageContext.request.contextPath}/weixin/home/login.jsp',
							show: {
								duration: 250
							}
						});
						mui.toast('请先登录');
						return;
					}
	mui.ajax(root + "/wapUser.do?p=getLM", 
	      {
			type: 'post', //HTTP请求类型
			timeout: 30000, //超时时间设置为10秒；
			data:{
			 userid:userid
			},
		success: function(n) {
		
			if(n==0){
			  window.top.location="${pageContext.request.contextPath}/weixin/center/dianpu-no.jsp";
			}else{
			  ajax();
			}	
		},
		error: function(xhr, type, errorThrown) {
			//异常处理；
			if(type == 'timeout') {
				layer.open({
					content: '<div style="height:100%;width:100%"><div><img src="weixin/images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器开了小差，请求超时了</div>',
					time: 2
				});
				return;
			}
			if(type == 'abort') {
				layer.open({
					content: '<div style="height:100%;width:100%"><div><img src="weixin/images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>亲，您的网络有点问题哦！</div>',
					time: 2
				});
				return;
			} else {
				layer.open({
					content: '<div style="height:100%;width:100%"><div><img src="weixin/images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器拒绝了连接，稍后再试吧！</div>',
					time: 2
				});
				return;
			}
		}
	});
					
});
function ajax(){
   mui.ajax(root+"/wapUser.do?p=getdianpu",
      {
        type:'post',
        timeout:30000,
        data:{userid:userid},
        success: function(n){
           if(n==0){
              window.top.location="${pageContext.request.contextPath}/wapUser.do?p=gettype&userid="+userid;
           }else{
              window.top.location="${pageContext.request.contextPath}/wapUser.do?p=getById&userid="+userid;
           }
        },
        error: function(){
      
        }
      }
   );
}
	
			</script>
	</body>

</html>