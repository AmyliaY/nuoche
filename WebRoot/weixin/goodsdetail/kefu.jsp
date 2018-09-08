<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>联系官方客服</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<title></title>
		<link href="${pageContext.request.contextPath}/weixin/css/mui.min.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/weixin/css/mui.imageviewer.css" rel="stylesheet" />
		<link href="kefu.css" rel="stylesheet" />
		<script src="${pageContext.request.contextPath}/weixin/js/jquery-1.9.0.min.js"></script>
		
		<script src="${pageContext.request.contextPath}/weixin/shuaxin.js"></script>
		
	</head>

	<body contextmenu="return false;" style="background: white;">
		<style type="text/css">
			#gname {
				line-height: 25px;
				width: 100%;
				padding: 0px 10px;
				font-size: 17px;
				display: -webkit-box;
				-webkit-box-orient: vertical;
				-webkit-line-clamp: 2;
				overflow: hidden;
			}
			
			.time{
				width: 50px;
				height: 50px;
			}
			
		</style>
		
			<style type="text/css">
			.mui-preview-image.mui-fullscreen {
				position: fixed;
				z-index: 20;
				background-color: #000;
			}
			.mui-preview-header,
			.mui-preview-footer {
				position: absolute;
				width: 100%;
				left: 0;
				z-index: 10;
			}
			.mui-preview-header {
				height: 44px;
				top: 0;
			}
			.mui-preview-footer {
				height: 50px;
				bottom: 0px;
			}
			.mui-preview-header .mui-preview-indicator {
				display: block;
				line-height: 25px;
				color: #fff;
				text-align: center;
				margin: 15px auto 4;
				width: 70px;
				background-color: rgba(0, 0, 0, 0.4);
				border-radius: 12px;
				font-size: 16px;
			}
			.mui-preview-image {
				display: none;
				-webkit-animation-duration: 0.5s;
				animation-duration: 0.5s;
				-webkit-animation-fill-mode: both;
				animation-fill-mode: both;
			}
			.mui-preview-image.mui-preview-in {
				-webkit-animation-name: fadeIn;
				animation-name: fadeIn;
			}
			.mui-preview-image.mui-preview-out {
				background: none;
				-webkit-animation-name: fadeOut;
				animation-name: fadeOut;
			}
			.mui-preview-image.mui-preview-out .mui-preview-header,
			.mui-preview-image.mui-preview-out .mui-preview-footer {
				display: none;
			}
			.mui-zoom-scroller {
				position: absolute;
				display: -webkit-box;
				display: -webkit-flex;
				display: flex;
				-webkit-box-align: center;
				-webkit-align-items: center;
				align-items: center;
				-webkit-box-pack: center;
				-webkit-justify-content: center;
				justify-content: center;
				left: 0;
				right: 0;
				bottom: 0;
				top: 0;
				width: 100%;
				height: 100%;
				margin: 0;
				-webkit-backface-visibility: hidden;
			}
			.mui-zoom {
				-webkit-transform-style: preserve-3d;
				transform-style: preserve-3d;
			}
			.mui-slider .mui-slider-group .mui-slider-item img {
				width: auto;
				height: auto;
				max-width: 100%;
				max-height: 100%;
			}
			.mui-android-4-1 .mui-slider .mui-slider-group .mui-slider-item img {
				width: 100%;
			}
			.mui-android-4-1 .mui-slider.mui-preview-image .mui-slider-group .mui-slider-item {
				display: inline-table;
			}
			.mui-android-4-1 .mui-slider.mui-preview-image .mui-zoom-scroller img {
				display: table-cell;
				vertical-align: middle;
			}
			.mui-preview-loading {
				position: absolute;
				width: 100%;
				height: 100%;
				top: 0;
				left: 0;
				display: none;
			}
			.mui-preview-loading.mui-active {
				display: block;
			}
			.mui-preview-loading .mui-spinner-white {
				position: absolute;
				top: 50%;
				left: 50%;
				margin-left: -25px;
				margin-top: -25px;
				height: 50px;
				width: 50px;
			}
			.mui-preview-image img.mui-transitioning {
				-webkit-transition: -webkit-transform 0.5s ease, opacity 0.5s ease;
				transition: transform 0.5s ease, opacity 0.5s ease;
			}
			@-webkit-keyframes fadeIn {
				0% {
					opacity: 0;
				}
				100% {
					opacity: 1;
				}
			}
			@keyframes fadeIn {
				0% {
					opacity: 0;
				}
				100% {
					opacity: 1;
				}
			}
			@-webkit-keyframes fadeOut {
				0% {
					opacity: 1;
				}
				100% {
					opacity: 0;
				}
			}
			@keyframes fadeOut {
				0% {
					opacity: 1;
				}
				100% {
					opacity: 0;
				}
			}
			/*.viewimg{
				max-width: 100%;
				height: auto;
			}*/
		</style>
		<header class="mui-bar mui-bar-nav" id="toubu" style="background: #FF7900;">
			<a class="mui-icon mui-icon-back mui-action-back mui-pull-left" id="fuwupagexx" index="1" style="color: white;"></a>
			<span class="mui-title" id="shopname" index="1" style="color: white;"></span>
		</header>
		<pre id='h'></pre>
		<script id='msg-template' type="text/template">
		</script>
		<div class="mui-content" style="background: white;">
			<!--<div style="text-align: center;margin-top: 20px;background-color: white;">
				<div class="mui-btn" style="background-color: white; width: 70px; height: 24px;margin-left: 0%;border: none;">
					<h6 style="line-height: 0px; color: gray;margin-left: -8px;" id="time"></h6></div>
			</div>-->
			<div id="kf-goodsdiv" style="border: 1px solid gainsboro;height: 35%;background-color: white;margin-top: 20px;display: none;">
				<img class="mui-media-object mui-pull-left" style=" float: left;width: 30%;height: auto;margin-top: 10px;margin-left: 10px;width: 110px;height: 100px;" id="kf-gimg" src="${pageContext.request.contextPath}/weixin/images/0.jpg">
				<div class="mui-media-body" style="margin-left: 140px;">
					<p id="kf-gname" style="margin-top: 10px;font-size: initial;color: black;"></p>
					<p style="font-size: larger;color: #FF7900;">￥<span id="kf-gprice"></span></p>
					<p style="font-size: 15px;color: gray;">累积售出:<span id="kf-gnum"></span></p>
				</div>
				<div style="margin-top: 20px;width: 100%;height: 20px;"></div>
				<button id="lj-sound" class="mui-btn mui-btn-negative mui-btn-block mui-btn-outlined" style="height: 30px; line-height: 5px; width: 140px; color: #FF7900; margin-left: 29%;font-size: 15px;">发送商品链接</button>
			</div>
			<div id='msg-list' style="background-color: whitesmoke;padding-bottom: 10px;">
				<div class="mui-popover">
					<div class="fuzhi" id="1" index="" onclick="fuzhi()">复制</div>
					<hr>
					<div class="shanchu" id="2" index="">删除</div>
				</div>
			</div>
		</div>
		<footer>
			<a href="#picture">
				<div class="footer-left iconbox-a bg-color-6" style="margin-bottom: 0px;">
					<input type="file" value="sdgsdg" id="demo_input" class="mui-icon mui-icon-camera" style="font-size: 28px;" />
				</div>
			</a>
			<!--
            	作者：offline
            	时间：2017-11-28
            	描述：
            -->

			<!-- actionsheet -->
			<div id="picture" style="margin-left: -12.5%;" class="mui-popover mui-popover-bottom mui-popover-action ">
				<!-- 可选择菜单 -->
				<ul class="mui-table-view" style="margin-top:-20% ;">
					<li class="mui-table-view-cell">
						<a  onclick="getImage()">拍摄</a>
					</li>
					<li class="mui-table-view-cell">
						<a id="alipay" onclick="mh_appendByGallery()">从相册选择</a>
					</li>

				</ul>
				<!-- 取消菜单 -->
				<ul class="mui-table-view">
					<li class="mui-table-view-cell">
						<a href="#picture"><b>取消</b></a>
					</li>
				</ul>
			</div>

			<div class="footer-center" >
				<textarea id='msg-text' type="text" class='input-text'></textarea>
			</div>
			<label for="" class="footer-right">
				<button id='msg-sound' type="button" class='input-sound'>发送</button>
			</label>
		</footer>
		<div id='sound-alert' class="rprogress" >
			<div class="rschedule"></div>
			<div class="r-sigh">!</div>
			<div id="audio_tips" class="rsalert">手指上滑，取消发送</div>
		</div>
		<input type="hidden" value="" class="neicun">
	</body>
	<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
	<script src="${pageContext.request.contextPath}/weixin/js/mui.imageViewer.js"></script>
	<script src="${pageContext.request.contextPath}/weixin/js/arttmpl.js"></script>
	<script type="text/javascript" charset="utf-8">
		mui.init();

		var yongtou = null; //用户头像
		var shopid = null;
		var userid = '${userinfo.usersId}';
		var goodlist = null; //商品信息
		var gid = null;
		var view = null;
		//mui.plusReady(function() {
			window.onload = function (){		
			//拍照
			//			function getImage() {
			//				alert("lall")
			//				var cmr = plus.camera.getCamera();
			//				cmr.captureImage( function ( p ) {
			//					
			//					plus.io.resolveLocalFileSystemURL( p, function ( entry ) {
			//						alert(entry);
			//					}, function ( e ) {
			//						//outLine( "读取拍照文件错误："+e.message );
			//					} );
			//				}, function ( e ) {
			//					//outLine( "失败："+e.message );
			//				}, {filename:"_doc/camera/",index:1} );
			//			}
			//var r = plus.webview.currentWebview();
			view = '${param.id}';
			if(view == "detail.html") {
				$("#kf-goodsdiv").css('display', 'block');
				gid = '${param.gid}';
				$("#kf-gname").html('${param.gname}');
				$("#kf-gprice").html('${param.gprice}');
				$("#kf-gnum").html('${param.gcollectionsnum}');
				$("#kf-gimg").attr("src", '' + "${pageContext.request.contextPath}/" + '${param.gimages}' + '');
			} else if(view == "zcdetail.html") {
				$("#kf-goodsdiv").css('display', 'block');
				gid = r.gid;
				$("#kf-gname").html('${param.gname}');
				$("#kf-gprice").html('${param.gprice}');
				$("#kf-gnum").html('${param.gynum}');
				$("#kf-gimg").attr("src", '' + '${param.gimages}' + '');
			} else {
				$("#kf-goodsdiv").css('display', 'none');
			}
			var list = null;
			mui.ajax("${pageContext.request.contextPath}/" + 'uamessage.do?p=getAll&userid=' + userid + '&x=' + Math.random(), {
				type: "post",
				timeout: 30000,
				success: function(data) {
					console.log(data)
					if(data == "请先登录") {
						/*
						mui.openWindow({
							url: '/home/login.html',
							id: 'login'
						});*/
						window.location = "${pageContext.request.contextPath}/weixin/home/login.jsp";
						mui.toast("请先登录");
						return;
					}
					
					/*    发送消息(做时间显示)    */
					
					
						
				
					
					
					/*    发送消息(做时间显示)  */
					var map = eval("(" + data + ")");
					for(var key in map) {
						if(key == "list") {
							list = map[key];
						}
					}
					
			
			
					if(list.length > 0) {
						for(var i = 0; i < list.length; i++) {
//							if(i == 0) {
//								document.getElementById("time").innerHTML = list[i].metime;
//							}
							if(list[i].mefangxiang == 0) { //商家
								
								shopid = list[0].admin.adminId;
								shop_image = list[i].admin.image;
							 document.getElementById("shopname").textContent=list[i].admin.adminName;
							
								if(shop_image.length==0){
									shop_image = "${pageContext.request.contextPath}/weixin/images/shop.png";
								}
								var str = '<div class="jieshou" >' +
									'<img src="'+"${pageContext.request.contextPath}/"+"/admin/images/"+list[i].admin.image+'" class="div_touxiang"/>' +
									'<div class="mession"><div class="msgsopi">' +
									'<span index="' + list[i].meid + '">' + list[i].smdetail + '</span></div></div></div>';
								$("#msg-list").append(str);
								zhidi();
								//修改消息状态
								mui.ajax("${pageContext.request.contextPath}/" + 'uamessage.do?p=updstatus&meid=' + list[i].meid, {
									type: "post"
								});
							}
							var s = 0; //判断
							if(list[i].mefangxiang == 1) {
								if(list[0].userinfo.usersHeadimg == "") {
									yongtou = "${pageContext.request.contextPath}/weixin/images/0.jpg";
								} else {
									yongtou = "${pageContext.request.contextPath}/" + list[0].userinfo.usersHeadimg;
								}
								var str = '<div class="chaodadiv"><img src="' + yongtou + '" class="touxiang"/><div class="xiaoxi" >' +
									'<div class="msgs">';
								if(list[i].smdetail.substring(0, list[i].smdetail.lastIndexOf("=")) == "http://shuiguoshop.com/kufu.htm?id") {
									str = str + '<a href="#" id="' + list[i].smdetail + '"><span index="' + list[i].meid + '">' + list[i].smdetail + '</span></a></div>';
								} else if(list[i].smdetail.substring(0, 4) == 'img:'){
									str = str + '<span index="' + list[i].meid + '">' + "<img data-preview-src='' data-preview-group='1' class='viewimg' width='150' height='150' src='"+"${pageContext.request.contextPath}/"+"/messageImages/"+list[i].smdetail.substring(4)+"' />" + '</span></div>';
                                    
								} else if(list[i].smdetail.substring(0, 5) == ':time'){
									var time = list[i].smdetail.substring(5);
									var newDate = new Date();
									var nowDate = newDate.getDate();
									newDate.setTime(time );
									var show = (newDate+"").substring(16,21);
									if(nowDate>newDate.getDate()){
										if(newDate.getHours()*1<12){
											show = newDate.getMonth()+"月"+newDate.getDate()+"日 早上"+show;
										}else if(newDate.getHours()*1<=18){
											show = newDate.getMonth()+"月"+newDate.getDate()+"日 下午"+show;
										}else{
											show = newDate.getMonth()+"月"+newDate.getDate()+"日 晚上"+show;
										}
										str = '<div class="xiaoxi" style="margin-top:30px;"  ><div class="xiaoxi" ><span  style="color:#FFFFFF;margin-left:-30px;font-size:11px;background:#C0C0C0;padding:2px 5px;border-radius:5px;">'+show+'</span></div></div>';

									}else{
										str = '<div class="xiaoxi" style="margin-top:30px;"><div class="xiaoxi" ><span  style="color:#FFFFFF;font-size:11px;background:#C0C0C0;padding:2px 5px;border-radius:5px;">'+show+'</span></div></div>';
									}
									s=1;
								}else {
									str = str + '<span index="' + list[i].meid + '">' + list[i].smdetail + '</span></div>';
								}
								if(s==0){
									str = str + '</div></div></br>';
								}
								$("#msg-list").append(str);
								zhidi();
							}
						}
						
					}
				}
			});
		//});
		}
		window.addEventListener('userinfo', function(e) {
			location.reload();
			shuaxin();
		});

		//点击发送消息
		$("#msg-sound").click(function() {
			
			
					//查看是否有上一条记录
			mui.ajax("${pageContext.request.contextPath}/" + 'uamessage.do?p=setTime&userid=' + userid  +'&x=' + Math.random(), {
						type: "post",
						timeout: 30000,
						success: function(data) {
						
						}
			});
					
			
			var u = $("#msg-text").val(); //内容
			if(u != "") {
				$("#msg-list").append('<div class="chaodadiv"><img src="' + yongtou + '" class="touxiang"/><div class="xiaoxi" ><div class="msgs"><span>' + u + '</span></div></div></div>');
				$("#msg-text").val(""); //发送成功后输入的文本框设为空
				$.post("${pageContext.request.contextPath}/" + "uamessage.do?p=addmessage", { "userid": userid, "neirong": u, "shopid": shopid, x: Math.random() }, function(date) {
					if("true" == date) {}
				});
				zhidi();
			} else {
				mui.toast("请输入内容！");
			}
		});
		//发送商品链接
		$("#lj-sound").click(function() {
			var lj = "http://shuiguoshop.com/kufu.htm?id=" + gid;
			$("#msg-list").append('<div class="chaodadiv"><img src="' + yongtou + '" class="touxiang"/><div class="xiaoxi" > <div class="msgs"><a href="#" id="' + lj + '"><span>' + lj + '</span></a></div></div></div>');
			$.post("${pageContext.request.contextPath}/" + "uamessage.do?p=addmessage", { "userid": userid, "neirong": lj, "shopid": shopid, x: Math.random() }, function(date) {
				if("true" == date) {}
			});
			zhidi();
			$("#kf-goodsdiv").css('display', 'none');
		});
		mui(".mui-content").on("tap", 'a', function(e) {
			//plus.webview.getWebviewById('detail').close();
			var smd = this.getAttribute("id");
			var ggid = smd.substring(smd.lastIndexOf("=") + 1);
			mui.openWindow({
				url: '/goodsdetail/detail.html',
				id: 'detail',
				extras: {
					gid: ggid,
				}
			});
			//mui.fire(plus.webview.currentWebview().opener(), 'gdetail', { gid: ggid });
			//plus.webview.currentWebview().close();
		});
		//同步商家消息
		setInterval(function() {
			var list = null;
			mui.ajax("${pageContext.request.contextPath}/" + 'uamessage.do?p=getadminmsg&shopid=' + shopid + '&userid=' + userid + '&x=' + Math.random(), {
				type: "post",
				timeout: 30000,
				success: function(data) {
					var map = eval("(" + data + ")");
					for(var key in map) {
						if(key == "list") {
							list = map[key];
						}
					}
					if(list != null) {
						for(var i = 0; i < list.length; i++) {
							var str = '<div class="jieshou" ><img src="'+"${pageContext.request.contextPath}/"+"/admin/images/"+list[i].admin.image+'" class="div_touxiang"/><div class="mession"><div class="msgsopi"><span index="' + list[i].meid + '">' + list[i].smdetail + '</span></div></div></div>';
							$("#msg-list").append(str);
							zhidi();
							//修改消息状态
							mui.ajax("${pageContext.request.contextPath}/" + 'uamessage.do?p=updstatus&meid=' + list[i].meid, {
								type: "post"
							});

						}
					}
				}
			});
		}, 1000);

		zhidi();
		function zhidi() {
			var e = document.getElementById("msg-list");
			e.scrollTop = e.scrollHeight;
		}

		/* ------------------------------  漫画                 -----------------------------------*/
		var mh_files = [];
		var index = 0;
        
        //拍照
		function getImage(){
			
		
			
			var cmr = plus.camera.getCamera();
			cmr.captureImage(function(p) {

				plus.io.resolveLocalFileSystemURL(p, function(entry) {
					
					mh_createItem2(entry);
				}, function(e) { //outLine( "读取拍照文件错误："+e.message );
				});
			}, function(e) {
				//outLine( "失败："+e.message );
			}, {
				filename: "_doc/camera/",
				index: 1
			});
		
			
		}
		// 从相册添加文件
		function mh_appendByGallery() {
			plus.gallery.pick(function(p) {
				mh_appendFile(p);
			});
		}

		function mh_appendFile(p) {
			mh_files = [];
			mh_files.push({
				name: "uploadkey" + index,
				path: p
			});
			index++;
			
			sendImage();
		}

		function mh_createItem2(entry) {
			mh_files = [];
			
			var p = entry.toLocalURL();
	
            
			mh_files.push({
				name: "uploadkey" + index,
				path: p
			});
			index++;
			sendImage();
		}
		function sendImage(){
			var wt = plus.nativeUI.showWaiting();
				task = plus.uploader.createUpload("${pageContext.request.contextPath}/"+"uamessage.do?p=addmessageImg", {
					method: "POST"
				},
				function(t, status) { //上传完成
					if(status == 200) {
						mui.toast("上传成功", {
							type: "div"
						});
						var u = "<img data-preview-src='' data-preview-group='1' class='viewimg' width='150' height='150' src='"+"${pageContext.request.contextPath}/"+"/messageImages/"+t.responseText+"' />" ;
						$("#msg-list").append('<div class="chaodadiv"><img src="' + yongtou + '" class="touxiang"/><div class="xiaoxi" ><div class="msgs"><span>' + u + '</span></div></div></div>');
                        
                        
                  
                        
						
						wt.close();
						mui.back();

					} else {
						mui.toast("失败", {
							type: "div"
						});
						wt.close();
					}
				}
			);
			for(var i = 0; i < mh_files.length; i++) {
				var f = mh_files[i];
				task.addFile(f.path, {
					key: f.name
				});
			}
			task.addData("userid",userid);
			task.start();
			/*上传*/
			
		}
		/* ------------------------------     漫画                 -----------------------------------*/


  
   



	</script>
	<script src="${pageContext.request.contextPath}/weixin/js/mui.zoom.js"></script>
	<script src="${pageContext.request.contextPath}/weixin/js/mui.previewimage.js"></script>
	<script>
		mui.previewImage();
	</script>
</html>