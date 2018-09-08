<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>归真太极养生</title>
		<script src="js/mui.min.js"></script>
		<link href="css/mui.min.css" rel="stylesheet" />
		<link href="css/style.css" rel="stylesheet" type="text/css" />
		<script src="js/app.js"></script>
		<script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
		<style>
			.wxtip{background: rgba(0,0,0,0.8); text-align: center; position: fixed; left:0; top: 0; width: 100%; height: 100%; z-index: 998; display: none;}
			.wxtip-icon{width: 52px; height: 67px; background: url(images/weixin-tip.png) no-repeat; display: block; position: absolute; right: 20px; top: 20px;}
			.wxtip-txt{margin-top: 107px; color: #fff; font-size: 16px; line-height: 1.5;}
			.welcome-bg {
				background:url(images/bg.png) no-repeat ;
				background-size:100%  100%;
				position: relative;
				font-family: "微软雅黑";
				text-align: center;
			}
			.welcome-bg img {
				width: 40%;
				display: block;
				position: absolute;
				top: 90px;
				left: 30%;
				border-radius:100%;
			}
			
			.welcome-bg h1 {
				position: absolute;
				width: 60%;
				top: 250px;
				left: 20%;
				color: orangered;
				
			}
			.welcome-bg h5 {
				position: absolute;
				top: 295px;
				width: 60%;
				left: 20%;
			}
			.download{
				position: absolute;
				top: 400px;
				background: white;
				width: 100%;
				height: 300px;
			}
			.download a img{
				float: left;
				width: 130px;
				height: 44px;
			}
			.entry-hd{
				margin: 30px;
				text-align: center;
				font-size: 2em;
			}
			.xz{
				width: 100%;
				height: 50px;
				float: left;
			}
			.xz .xzdiv{
				width:82%;
				height: 100%;
				margin: 0px auto;
			}
			#left{
				float: left;
			}
			#right{
				float: right;
			
			}
			.app{margin-top: 120px;text-align:  center;}
			.app .entry-con{padding-bottom: 5.4%; color: #6B6B6B;}
		</style>
		
	</head>
<script type="text/javascript">
	var android ;
	var ios ;
		$.ajax({
			url:'${pageContext.request.contextPath }/weixin_centre.do?p=getUrl',
			type:'post',
			async: false,
			success:function (date){
			
				var json = jQuery.parseJSON(date); 
				$.each(json,function (index,value){
					var type = value.avtype;
					if(type==0){
						android = '${pageContext.request.contextPath }/appdownload/android/'+value.avurl;
					}else{
						//判断是否后台后数据
						ios = '${pageContext.request.contextPath }/appdownload/ios/'+value.avurl;
					}
				});
			}			
		});
	//	document.getElementById("JdownApp").href = ios;
	//	document.getElementById("JdownApp2").href = android;
	</script>
	<body>
		<div class="wxtip" id="JweixinTip">
			<span class="wxtip-icon"></span>
			<p class="wxtip-txt">点击右上角<br/>选择在浏览器中打开</p>
		</div>
		<div class="welcome-bg" >
			
		</div>
		<div class="download" >
			<p class="entry-hd">立即下载APP</p>
			<div class="xz">
				<div class="xzdiv">
					<a  id="JdownApp" onclick="window.open(ios)" >
						<img id ='left' src="images/ios-btn.png"  alt="苹果版下载">
					</a>
					<a  id="JdownApp2" onclick="window.open(android)" >
						<img id='right' src="images/android-btn.png" download='安卓' alt="安卓版下载">
					</a>
				</div>
				
			</div>
			
			<div class="app">
				<p class="entry-con">归真太极养生<br/>
			</div>

		</div>
	
	<script type="text/javascript">
		$('.welcome-bg').css("height", window.innerHeight);
		//判断是否微信
		function weixinTip(ele){
			var ua = navigator.userAgent;
			var isWeixin = !!/MicroMessenger/i.test(ua);
			if(isWeixin){
				ele.onclick=function(e){
					window.event? window.event.returnValue = false : e.preventDefault();
					document.getElementById('JweixinTip').style.display='block';
				}
				document.getElementById('JweixinTip').onclick=function(){
					this.style.display='none';
				}
			}
		}
		var btn1 = document.getElementById('JdownApp');//下载一
		weixinTip(btn1);
		var btn2 = document.getElementById('JdownApp2'); //下载二
		weixinTip(btn2);
	
	
	</script>
	</body>

</html>