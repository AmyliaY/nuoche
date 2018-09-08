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
		<meta charset="UTF-8">
		<title>首页</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/mui.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/iconfont.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weixin/css/icons-extra.css" />
		<link rel="stylesheet" type="text/css" href="home.css" />
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/common.js"></script>
		
		<script src="${pageContext.request.contextPath}/weixin/layer/layer.js"></script>
		<style>
			.mui-search .mui-placeholder {
				text-align: left;
				color: white;
			}
			
			.mui-search .mui-placeholder .mui-icon,
			.mui-input-row .mui-input-clear~.mui-icon-clear,
			.mui-input-row .mui-input-password~.mui-icon-eye,
			.mui-input-row .mui-input-speech~.mui-icon-speech,
			.mui-search.mui-active:before {
				color: white;
			}
			
			.goods-sharing {
				width: 20%;
				margin-left: 87%;
				margin-top: -14%;
			}
			
			.goods-sharing img {
				width: 30%;
			}
			
			.layer-sharing {
				width: 90%;
				height: 400px;
				border-radius: 5px 5px 5px 5px;
			}
			
			.goods-image {
				width: 110%;
				height: 200px;
				margin-left: -5%;
				margin-top: -7%;
				border-radius: 5px 5px 0px 0px;
			}
			
			.goods-image img {
				width: 100%;
				height: 200px;
				border-radius: 5px 5px 0px 0px;
			}
			
			.goods-namea {
				width: 100%;
				margin-top: 10%;
				line-height: 25px;
				/*height: 60px;*/
				font-family: 幼圆;
				font-size: 14px;
				color: #484234;
				display: -webkit-box;
				-webkit-box-orient: vertical;
				-webkit-line-clamp: 2;
				overflow: hidden;
			}
			
			.mui-btn-block {
				width: 100%;
				margin-top: 15%;
				border-radius: 30px 30px 30px 30px;
				background: #FF7900;
				border: none;
			}
			
			#tongzhi {
				height: 10px;
				width: 10px;
				background-color: red;
				border-radius: 50%;
				-moz-border-radius: 50%;
				-webkit-border-radius: 50%;
				border: 1px solid white;
				position: absolute;
				top: 23%;
				right: 3%;
				z-index: 2;
				display: none;
			}
			.mui-icon-chat{
				font-size: 22px;
			}
		</style>
	</head>

	<body>
		<!--搜索框-->
		<div class="top-search" style="position: fixed;z-index: 9999;width: 100%;">
			<p>
				<a style="color: white;" onclick="clicked('${pageContext.request.contextPath}/shop.do?p=scan',true,true)"><span class="mui-icon-extra mui-icon-extra-sweep"></span></a>
			</p>
			<div class="button" style="font-size: 9px;margin-top: -16px;margin-left: 14px; color: white;">扫一扫</div>
			<div style="margin-left: -40px; margin-top: 10px;">
				<div style="margin: 0px 100px;margin-top: -20px; height: 0px; width: 60%;border-bottom: 1px solid white;border-left:1px solid white;border-right: 1px solid white;"></div>
				<div class="mui-input-row mui-search" style="margin:0px auto;text-align: left;margin-top: -35px;width: 50%;">
					<!--
                	<input id="search"style="color: white;" type="search" class="mui-input-clear" placeholder="">
                	
                -->
					<input id="search" style="color: white;background: #FF7900;" type="search" class="mui-input-clear" placeholder="" onkeyup="enterSearch(event)">
				</div>
			</div>
			<div class="flex-container" style="margin-top: -40px;float: right;margin-right: 45px;">
				<span id="show-search" style="padding: 15px 15px 0px;color: white;">搜索</span>
			</div>
			<div class="flex-container" style="margin-top: -38px;float: right;margin-right: 15px;">
				<a id="home-kefu" style="color: white;"><span class="mui-icon mui-icon-chat"></span></a>
				<div id="tongzhi"></div>

			</div>
		</div>
		<div class="kb" style="height: 45px;width: 100%;">

		</div>
		<!--轮播-->
		<div id="slider" class="mui-slider">
			<div class="mui-slider-group mui-slider-loop" id="lunbo">
			</div>
			<div class="mui-slider-indicator" id="lunboNum">
			</div>
		</div>
		<!--分类-->
		<div id="type" class="fenlei">

		</div>
		<div style="clear: both;height: 70px">
		</div>
	</body>

	<script>
	
		mui.init({
			keyEventBind: {
				backbutton: false
			}
		});

$(function(){init();});
		
//远程得到商品分类
function init()
{
mui.ajax("${pageContext.request.contextPath}/goodstype.do?p=getAllGoodsOneType", 
	{
		type: 'post', //HTTP请求类型
		success: function(data) {
			var map = eval("(" + data + ")");
			var typedivs = document.createDocumentFragment();	//创建文档碎片节点
			
			for(var i = 0; i < map.onelist.length; i++) {
			    // alert("${pageContext.request.contextPath}" + map.onelist[i].goodsonetype.gtLogo);
				var onediv = document.createElement("div");		//创建标签名为 div 的节点
				onediv.className = "yijidetail";		//设置class
				onediv.innerHTML = '<div style="height: 10px; background-color: gainsboro;margin-top: 0px;"></div>'+
									'<div class="yiji">'+
								   '<img data-lazyload="' + "${pageContext.request.contextPath}" + map.onelist[i].goodsonetype.gtLogo + '" />'+
								   '' + map.onelist[i].goodsonetype.gtName + '<span onclick="goodsmore(\''+map.onelist[i].goodsonetype.gtId+'\',\''+map.onelist[i].goodsonetype.gtName+'\')">'+
										'<span style="margin-left:240px;">'+'更多'+'>'+'</span>'+   '</span>'
									'</div>';
									
				var twoul = document.createElement("ul");
				var len = map.twoList.length;
				for(var j = 0; j < map.twoList.length; j++) {
					if(map.onelist[i].goodsonetype.gtId == map.twoList[j].goodsonetype.gtId) {
						var twoli = document.createElement("li");
						twoli.className = "erjidetail";
						twoli.innerHTML = '<div style="margin-top: -7px;" onclick="goods(\''+map.twoList[j].gttId+'\',\''+map.twoList[j].gttName+'\')"><img data-lazyload="' + "${pageContext.request.contextPath}" + map.twoList[j].gttLogo + '" />'+
										   '</div>';
					   	if($(twoul).find("li").length<5)
						{
							twoul.appendChild(twoli);	
						}
						
						if($(twoul).find("li").length<3)
						{
							twoli.style.width="50%";
						}
						
						
					}	
					
				}
				onediv.appendChild(twoul);
				typedivs.appendChild(onediv);  // 把 onediv 添加到文档碎片节点中
			}
			$("#type").append(typedivs); //追加碎片中的子节点
			
			mui(document).imageLazyload({
				placeholder: '../images/timg.gif'
			});	
		},
		error: function(xhr, type, errorThrown) {
			//异常处理；
			if(type == 'timeout') {
				layer.open({
					content: '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器开了小差，请求超时了</div>',
					time: 2
				});
				//$(".hidden_div2").show();
				//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
				return;
			}
			if(type == 'abort') {
				layer.open({
					content: '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>亲，您的网络有点问题哦！</div>',
					time: 2
				});
				//$(".hidden_div2").show();
				//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
				return;
			} else {
				layer.open({
					content: '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器拒绝了连接，稍后再试吧！</div>',
					time: 2
				});
				//$(".hidden_div2").show();
				//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
				return;
			}
		}
	});
	}
		//商品列表
		function goods(gttId,gttName)
		{
			window.top.location = "${pageContext.request.contextPath}/"+"weixin/home/goods.jsp?gttid="+gttId+"&gttname="+ encodeURIComponent(gttName);
		}
		
		function goodsmore(gtId,gtName)
		{
			window.top.location = "${pageContext.request.contextPath}/"+"weixin/home/goodsmore.jsp?gtid="+gtId+"&gtname="+gtName;
		}
		


		





		















		/*
		 *  获取剪贴板内容 ，请在 mui.plusReady中使用 
		 *  @auth lgh 
		 */
		function getFromClip() {
			if(mui.os.android) {
				var Context = plus.android.importClass("android.content.Context");
				var main = plus.android.runtimeMainActivity();
				var clip = main.getSystemService(Context.CLIPBOARD_SERVICE);
				return plus.android.invoke(clip, "getText");
			} else if(mui.os.ios) {
				var UIPasteboard = plus.ios.importClass("UIPasteboard");
				var generalPasteboard = UIPasteboard.generalPasteboard();
				var value = generalPasteboard.valueForPasteboardType("public.utf8-plain-text");
				return value;
			}
		}

		//图片轮播
		var slider = mui("#slider");
		slider.slider({
			interval: 1000
		});
		var userid = '${userinfo.usersId}';
		var lay;
		var index = 0;

		function goGoods(gid, state) {
			layer.closeAll();
			//var Context = plus.android.importClass("android.content.Context");
			//var main = plus.android.runtimeMainActivity();
			//var clip = main.getSystemService(Context.CLIPBOARD_SERVICE);
			window.top.location = "${pageContext.request.contextPath}/weixin/goodsdetail/detail.jsp?gid="+gid+"&state=1";
		//	plus.android.invoke(clip, "setText", "");
			/*mui.openWindow({
				url: '/goodsdetail/detail.jsp',
				id: '/goodsdetail/detail.jsp',
				extras: {
					gid: gid,
					state: 1
				}
			});
			*/
			
		}
		/*
		mui.plusReady(function() {
			setTimeout(function() {
				var s = getFromClip();
				if(s == null) {
					return;
				}

				var n1 = (s.split('复')).length - 1;
				var n2 = (s.split('制')).length - 1;
				var n3 = (s.split('【')).length - 1;
				var n4 = (s.split('】')).length - 1;
				var n5 = (s.split('<')).length - 1;
				var n6 = (s.split('>')).length - 1;
				var sum = n1 + n2 + n3 + n4 + n5 + n6;
				if(sum == 6) {
					var img = s.substring(s.indexOf("】") + 1, s.indexOf("<"));
					var desc = s.substring(s.indexOf("【") + 1, s.indexOf("】"));
					var gid = s.substring(s.indexOf("<") + 1, s.indexOf(","));
					var gst = s.substring(s.indexOf(",") + 1, s.indexOf(">"));
					if(gst.length != 1) {
						return;
					}
					lay = layer.open({
						className: "layer-sharing",
						content: '<div class="goods-image">' +
							'<img id="" width=200 height=200 src="' + img + '">' +
							'</div>' +
							'<p class="goods-namea">' + desc + '</p>' +
							'<button onclick="goGoods(' + gid + ',' + gst + ')" type="button" class="mui-btn mui-btn-block mui-btn-primary">查看</button>'
					});
				}
			}, 900);

		});
			*/
		//获取远程轮播图

			
			
			
			
			
			/*得到商家信息*/
		//同步商家消息
		setInterval(function() {
			var list = null;
			if(!userid){
				return;
			}
			mui.ajax("${pageContext.request.contextPath}/" + 'uamessage.do?p=getadminmsg' + '&userid=' + userid + '&x=' + Math.random(), {
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
						if(list.length > 0) {
							$("#tongzhi").show();
							/*播放音频*/
							//startPlay("${pageContext.request.contextPath}/weixin/music/3.wav");	
							/*播放音频*/
						} else {
							$("#tongzhi").hide();
						}
					}
				}
			});
			
			
			
		}, 3000);
		/*得到商家消息*/
			
			
			
			
			
			
			
			
			
			
			
			
			var fragment1 = document.createDocumentFragment();
			mui.ajax("${pageContext.request.contextPath}/" + "appLunbo.do?p=getAllLunbo", {
					data: {
						id: 1,
						name: "aaa"
					},
					//dataType: 'json', //服务器返回json格式数据
					type: 'post', //HTTP请求类型
					timeout: 30000, //超时时间设置为10秒；	
					success: function(data) {
						//服务器返回响应，根据响应结果，分析是否登录成功；
						var js = eval("( " + data + ")");
						var div_last = document.createElement("div");
						div_last.className = "mui-slider-item";
						var a_last = document.createElement("a");

						var img_last = document.createElement("img");
						img_last.src = "${pageContext.request.contextPath}" + js[js.length - 1].cimages;
						img_last.style.height = '120px';
						div_last.appendChild(a_last);
						a_last.appendChild(img_last);
						fragment1.appendChild(div_last);
						for(var i = 0; i < js.length; i++) {
						   
							var div = document.createElement("div");
							div.className = "mui-slider-item";
							var a = document.createElement("a");
							$(a).attr("onclick", "lb(\'" + js[i].cimgType + '\',\'' + js[i].cimgUrl + '\',\'' + js[i].cimgDescribe.trim() + '\',\'' + js[i].cimgTitle + '\',\'' + js[i].cimages + "\')");
							var img = document.createElement("img");
							img.src = "${pageContext.request.contextPath}" + js[i].cimages;
							img.style.height = "120px";
							div.appendChild(a);
							a.appendChild(img);

							fragment1.appendChild(div);
							var div2 = document.createElement("div");
							if(js.length >= 2) {
								if(i == 0) {
									div2.className = "mui-indicator mui-active";
								} else {
									div2.className = "mui-indicator";
								}

							}
							document.getElementById("lunboNum").appendChild(div2);

						}
						var div_first = document.createElement("div");
						div_first.className = "mui-slider-item mui-slider-item-duplicate";
						var a_first = document.createElement("a");

						var img_first = document.createElement("img");
						img_first.src = "${pageContext.request.contextPath}" + js[0].cimages;
						img_first.style.height = "120px";
						div_first.appendChild(a_first);
						a_first.appendChild(img_first);
						fragment1.appendChild(div_first);

						$("#lunbo").append(fragment1);

						//图片轮播
						var slider = mui("#slider");

						if(js.length == 1) {
							slider.slider({
								interval: 0
							});
						} else {
							slider.slider({
								interval: 3000
							});
						}
						/*if(js.length > 0) {
							var lunboNum = document.getElementById("lunboNum");
							var html =
								'<div class="mui-slider-item mui-slider-item-duplicate">' +
								'<a onclick="lb(1)" href="javascript:void(0)">' +
								'<img style="height:120px;" src="' + "${pageContext.request.contextPath}/" + js[0].cimages + '">' +
								'</a>' +
								'</div>';
							var htmlLunboNum = "";
							for(var i = 0; i < js.length; i++) {
								html = html +
									'<div class="mui-slider-item">' +
									'<a onclick="lb(\''+js[i].cimgType+'\',\''+js[i].cimgUrl+'\',\''+js[i].cimgDescribe+'\',\''+js[i].cimgTitle+'\')" href="javascript:void(0)">' +
									'<img style="height:120px;" src="' + "${pageContext.request.contextPath}/" + js[i].cimages + '">' +
									'</a>' +
									'</div>';
									
								if(i == 0)
									htmlLunboNum = htmlLunboNum + '<div class="mui-indicator mui-active"></div>';
								else
									htmlLunboNum = htmlLunboNum + '<div class="mui-indicator"></div>';

							}

							html = html + '<div class="mui-slider-item mui-slider-item-duplicate">' +
								'<a href="javascript:void(0)">' +
								'<img style="height:120px;" src="' + "${pageContext.request.contextPath}/" + js[js.length - 1].cimages + '">' +
								'</a>' +
								'</div>';
								
							var lunbo = document.getElementById("lunbo");
							lunbo.innerHTML = html;
							lunboNum.innerHTML = htmlLunboNum;

						}*/
					},

					error: function(xhr, type, errorThrown) {
						//异常处理；
						if(type == 'timeout') {
							layer.open({
								content: '<div style="height:100%;width:100%"><div><img src="${pageContext.request.contextPath}/weixin/images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器开了小差，请求超时了</div>',
								time: 2
							});
							//$(".hidden_div2").show();
							//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
							return;
						}
						if(type == 'abort') {
							layer.open({
								content: '<div style="height:100%;width:100%"><div><img src="${pageContext.request.contextPath}/weixin/images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>亲，您的网络有点问题哦！</div>',
								time: 2
							});
							//$(".hidden_div2").show();
							//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
							return;
						} else {
							layer.open({
								content: '<div style="height:100%;width:100%"><div><img src="${pageContext.request.contextPath}/weixin/images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器拒绝了连接，稍后再试吧！</div>',
								time: 2
							});
							//$(".hidden_div2").show();
							//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
							return;
						}
					}

				}

			);


		function scaned(t, r, f) {
			var gid = null;
			var gname = r.substring(r.indexOf('+') + 1);
			var g_url = r.substring(0, r.indexOf('+'));
			mui.post("${pageContext.request.contextPath}/" + 'appgoods.do?p=getGoodsId', {
				gname: gname
			}, function(data) {
				gid = data;
				/*
				mui.openWindow({
					url: g_url,
					id: 'detail',
					extras: {
						gid: gid,
					}
				});*/
				window.top.location = "${pageContext.request.contextPath}/weixin/"+g_url+"?gid="+gid;
			});
		}
		//轮播图内容 or 链接
		function lb(type, url, neiro, title, img) {
			if(type == 1) {
				/*mui.openWindow({
					url: '/goodsdetail/detail.jsp',
					id: '/goodsdetail/detail.jsp',
					extras: {
						gid: url,
						state: 1
					}
				});*/
				window.top.location = "${pageContext.request.contextPath}/weixin/goodsdetail/detail.jsp?gid="+url+"&state=1";
			} else if(type == 2 ){
				plus.runtime.openURL(url)
			}else {
				/*mui.openWindow({
					url: 'lunbo.jsp',
					id: 'lunbo',
					show: {
						aniShow: 'pop-in',
						duration: 100
					},
					extras: {
						neiro: neiro,
						title: title,
						img: img
					}
				});*/
				window.top.location = "${pageContext.request.contextPath}/weixin/home/lunbo.jsp?neiro="+neiro+"&title="+title+"&img="+img;
			}
		}
		//搜索
		$("#show-search").click(function() {
			var keywords = $("#search").val();
			if(keywords == "") {
				mui.toast("搜索内容不能为空");
				return;
			}
			/*
			mui.openWindow({
				url: 'goods.jsp',
				id: 'search-goods',
				extras: {
					keyword: keywords,
				}
			});
			*/
			window.top.location = "${pageContext.request.contextPath}/weixin/home/goods.jsp?keyword="+encodeURI(keywords);
			return;
			mui.post("${pageContext.request.contextPath}/" + "appsearch.do?p=search", {
				keywords: keywords
			}, function(data) {
				var js = eval("(" + data + ")");
				mui.openWindow({
					url: 'goods.jsp',
					id: 'search-goods',
					extras: {
						keyword: keywords,
						goods: js
					}
				})
			});
		});
		//客服 消息
		$("#home-kefu").click(function() {
			$("#tongzhi").hide();
			index = 0;
			if(userid != null) {
				/*mui.openWindow({
					url: '/goodsdetail/kefu.jsp',
				});*/
				window.top.location = "${pageContext.request.contextPath}/weixin/goodsdetail/kefu.jsp";
			} else {
				goLogin();
			}
		});
		//去登录界面
		function goLogin() {
			mui.toast("请先登录！");
			/*mui.openWindow({
				url: '/home/login.jsp',
				id: 'login.jsp'
			});*/
			window.top.location = "${pageContext.request.contextPath}/weixin/home/login.jsp";
		}

		function enterSearch(e) {
			if(13 == e.keyCode) {
				$("#search-input").blur();
				var keyword = $("#search").val()

				/*mui.openWindow({
					url: 'goods.jsp',
					id: 'goods',
					extras: {

						keyword: keyword
					}
				})*/
				window.top.location = "${pageContext.request.contextPath}/weixin/home/goods.jsp?keyword="+keyword;

			}
		}

		window.addEventListener("showMsg", function(e) {

			layer.open({
				content: '<div style="height:100%;width:100%"><div><img src="${pageContext.request.contextPath}/weixin/images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>再按一次退出！</div>',
				time: 1
			});
		})


		function startPlay(url) {
			var L = pp.clientWidth;
			p = plus.audio.createPlayer(url);
			p.play(function() {
				outLine('播放完成！');
				stopPlay();
			}, function(e) {
				outLine('播放音频文件"' + url + '"失败：' + e.message);
			});
		}
		
		// 播放文件相关对象
		var p = null,
			pt = null,
			ps = null,
			pi = null;
		// 开始播放
		function startPlay(url) {
			stopPlay();
			index++;
			if(index >1){
				return;
			}
			p = plus.audio.createPlayer(url);
			p.play(function() {
				// 播放完成
				stopPlay();
			}, function(e) {
				console.log('播放音频文件"' + url + '"失败：' + e.message);
			});

		}
		// 停止播放
		function stopPlay() {
			clearInterval(pi);
			pi = null;
			// 操作播放对象
			if(p) {
				p.stop();
				p = null;
			}
		}
		
		
	</script>
	<script src="${pageContext.request.contextPath}/weixin/js/mui.lazyload.js"></script>
	<script src="${pageContext.request.contextPath}/weixin/js/mui.lazyload.img.js"></script>
	<script src="${pageContext.request.contextPath}/weixin/home/home.js"></script>

</html>