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
		p {
			margin: 0;
		}
		
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
		
		
		.nav-header h1 {
			text-align: left;
		}
		
		.nav-header a {
			color: white;
		}
		
		.check {
			line-height: 40px;
			border-bottom: 1px solid #E6E6E6;
			padding-left: 10px;
		}
		
		.info p {
			background: #FFFFFF;
			height: 40px;
			line-height: 40px;
			border-bottom: 1px solid #E6E6E6;
			padding-left: 10px;
		}
		
		.hint {
			line-height: 40px;
			text-align: center;
			font-size: 12px;
		}
		
		.pay {
			height: 40px;
			background: #FF6700;
			border-radius: 6px;
			text-align: center;
			line-height: 40px;
			color: #FFFFFF;
			margin: 20px 10px 0px 10px;
		}
	</style>

	<body>
		<header class="mui-bar mui-bar-nav nav-header" style="background-color:#FF7900;">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title" style="color: white;">确认订单</h1>
		</header>
		<div class="mui-content">
			<p class="check">订单信息核对：</p>
			<div class="info">
				<p><span></span><span>购买积分：</span><span id="number">0</span></p>
				<p><span></span><span>赠送积分：</span><span id="present">0</span></p>
				<p><span></span><span>应付金额：</span><span id="price">0</span>元</p>
			</div>
			<p class="hint">这里可以放提示</p>
			<div class="pay">确认订单</div>
		</div>

		<script type="text/javascript">
			mui.init();
			
			var num = null; //购买积分数量
			var price = null; //价格
			var present = 0; //赠送积分
			var page = null;
			var data = null;
			//mui.plusReady(function() {
				num = "${param.number}";
				price = "${param.price}";
				userid = '${userinfo.usersId}';
				data   = '${param.presentList}';
				var presentList = presentList = eval("(" + data + ")");;
				for(var i = 0; i < presentList.length; i++) {
					if(num >= presentList[i].ppMin && num <= presentList[i].ppMax) {
						present = presentList[i].ppPresent;
						break;
					}
					if(num >= presentList[presentList.length - 1].ppMax) {
						present = presentList[presentList.length - 1].ppPresent;
						break;
					}
				}
				//把数据加入页面
				
				$("#present").html(present);
				$("#number").html(num);
				$("#price").html(price);

                /*
				page = mui.preload({
					url: "pay.html",
					id: "pay.html", //默认使用当前页面的url作为id
					styles: {}, //窗口参数
					extras: {
						
						number: num, //积分数量
						price: price, //价格
						present: present, //赠送积分
						userid: userid
					} //自定义扩展参数
				}); */

			//});

			$(".pay").click(function() {
				/*mui.plusReady(function(){
					 plus.webview.show(page);
					
				});*/
				//mui.toast("支付通道申请中......");
				window.top.location = "${pageContext.request.contextPath}/wexinChongzhiPay.do?p=toPay&money="+price;
				
			})
		</script>
	</body>

</html>