<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
	<head>

		<title>扫一扫</title>
		<meta name="viewport"
			content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/wap/css/mui.min.css">
	</head>

	<body style="display: none;">
		<header class="mui-bar mui-bar-nav">
		<h1 class="mui-title">
			微信扫一扫
		</h1>
		</header>

		<div class="mui-content">
			<div class="mui-content-padded" style="margin-top: 50px;">
				<button onclick="scan()" type="button" class="mui-btn mui-btn-primary mui-btn-block">
					扫一扫
				</button>
				<button onclick="WeixinJSBridge.call('closeWindow')" type="button" class="mui-btn mui-btn-primary mui-btn-block">
					关&nbsp;闭
				</button>
			</div>
		</div>
	</body>
	<script type="text/javascript"
		src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
	<script type="text/javascript">
	function scaned(r) {
		location.replace(r);
	}

	wx.config( {
		debug : false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		appId : '${appId}', // 必填，公众号的唯一标识
		timestamp : '${timestamp}', // 必填，生成签名的时间戳
		nonceStr : '${nonceStr}', // 必填，生成签名的随机串
		signature : '${signature}',// 必填，签名，见附录1
		jsApiList : [ 'scanQRCode' ]
	// 必填，需要使用的JS接口列表，所有JS接口列表见附录2
			});
	    wx.ready(function() {
		
		//WeixinJSBridge.call('closeWindow')
		  scan();
		  window.setTimeout(function(){
		     document.body.style.display='block';
		  }, 2000);
          
         
		});
		
		function scan()
		{
		   wx.scanQRCode( {
			needResult : 1, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
			scanType : [ "qrCode", "barCode" ], // 可以指定扫二维码还是一维码，默认二者都有
			success : function(res) {
				var result = res.resultStr; // 当needResult 为 1 时，扫码返回的结果
			scaned(result);
		   }
		});
		}
</script>
</html>
