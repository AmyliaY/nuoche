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
		<link href="${pageContext.request.contextPath}/weixin/css/mui.min.css" rel="stylesheet" />
		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/jquery-1.9.0.min.js"></script>
		

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
		
		.reminder {
			text-align: center;
			line-height: 40px;
			border-bottom: 1px solid #dfd0d0;
		}
		
		.box-a-1 {
			width: 25%;
			height: 30px;
			float: left;
			margin-right: 2%;
			border-radius: 6px;
			text-align: center;
			line-height: 30px;
			font-size: 14px;
		}
		
		#other {
			width: 17%;
			border: 1px solid #FF6700;
			height: 30px;
			float: left;
			margin-right: 2%;
			border-radius: 6px;
			text-align: center;
			line-height: 30px;
			font-size: 14px;
		}
		
		.present {
			text-align: center;
			line-height: 40px;
			font-size: 12px;
		}
		
		.input-number {
			display: none;
		}
		
		#caution {
			line-height: 5px;
			color: #FF6700;
			display: none;
		}
		
		#import {
			text-align: center;
			background-color: #efeff4;
		}
		
		.price {
			text-align: center;
			line-height: 10px;
			font-size: 14px;
		}
		
		.pay {
			height: 40px;
			background: #FF6700;
			border-radius: 6px;
			text-align: center;
			line-height: 40px;
			margin-top: 20px;
			color: #FFFFFF;
		}
		
		.tishi {
			margin: 0;
			line-height: 25px;
		}
	</style>

	<body>
		<header class="mui-bar mui-bar-nav nav-header"style="background-color: #FF7900;">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title" style="color: white;">充值积分</h1>

		</header>
		<div class="mui-content" id="recharge-div" style="padding-left:20px;margin-right: 20px;">
			<p class='reminder'>1元购买1积分</p>
			<div class="box-a">

				<p style="float: left;">积分购买</p>
				<p id="records" style="text-align:right;color: #FF6600;">我的充值记录</p>
				<input type="button" class="box-a-1" style="background-color:#FF6700;border: 1px solid #FF6700;border-radius: 6px; color: #FFFFFF" value="100积分" />
				<input type="button" class="box-a-1" style="background-color:#efeff4;border: 1px solid #FF6700;border-radius: 6px;" value="200积分" />
				<input type="button" class="box-a-1" style="background-color:#efeff4;border: 1px solid #FF6700;border-radius: 6px;" value="500积分" />
				<div class="box-a-2" id="other">其他</div>
			</div>
			<p class='present'>积分充值后5分钟内到账</p>
			<div class="input-number"><input type="number" pattern="\d*" id="import" placeholder="请输入需要充值的数量" value=""></div>
			<p id="caution">请输入10的倍数</p>
			<p class="price">支付金额：<span id="price">100</span>元</p>
			<div class="pay">支付</div>
			

		</div>

		<script type="text/javascript">
			mui.init();
			
			
			var num = 100; //需要充值的积分
			var price = 100.0; //价格
			var userid = '${userinfo.usersId}'; //用户id
			var presentList= null; //优惠信息
			var _data = null;
			//mui.plusReady(function() {
				//var user = plus.webview.currentWebview();
				  
				//得到优惠信息
			
				mui.ajax("${pageContext.request.contextPath}/"+'apprecharge.do?p=getAllPresent', {
					type: 'post',
					async:false,
					timeout: 30000,
					
					success: function(data) {
					    _data = data;
						presentList = eval("(" + data + ")"); //得到优惠信息list
						if(presentList.length > 0) {
							var div = document.createElement("div");
							div.className = "reminder";
							var str = '<p class="tishi" style="margin-top: 10px;margin-bottom: 5px;">温馨提示</p>';
							for(var i = 0; i < presentList.length; i++) {
					
									str = str + '<p class="tishi">充值' + presentList[i].ppMin + '-'+presentList[i].ppMax+'积分送' + presentList[i].ppPresent + '积分</p>'
								
							}
							div.innerHTML = str;
							$("#recharge-div").append(div);
						

						}
					}
				})
			//支付
			$(".pay").click(function() {
				if(num <= 0 || price <= 0) {
				    mui.toast("金额有错!");
					return;
				}
				window.top.location="${pageContext.request.contextPath}/weixin/center/confirm.jsp?number="+num+"&price="+num+"&userid="+userid+"&presentList="+encodeURI(_data);
			})

			$(".box-a-1").bind("click", function() {
				$(".box-a-1").each(function(i, obj) {
					obj.style.background = "#efeff4";
					obj.style.color = "#000";
				});
				$(".input-number").css("display", "none");
				$("#other").css({ "background": "", "color": "#000" });
				$(this).css({ "background": "#ff6700", "color": "#fff" });
				num = $(this).val().split('积分')[0];
				$("#price").html(num);
				price = num;
			})

			$("#other").click(function() {
				$(".box-a-1").each(function(i, obj) {
					obj.style.background = "#efeff4";
					obj.style.color = "#000";
				});
				num = $("#import").val();
				price = num;
				$(this).css({ "background": "#ff6700", "color": "#fff" });
				$(".input-number").css("display", "block");
				$("#price").html($("#import").val());
			})

			//选择其他数目时，输入积分数改变金额
			$("#import").keyup(function() {
				num = $(this).val();
				var s = $(this).val().replace(/^0/, '')
				$(this).val(s.replace(/[^0-9-]+/, ''));
				price = num;
				$("#price").html(price);
			})
			

			//查看充值记录
			$("#records").click(function() {
			
			window.top.location="${pageContext.request.contextPath}/weixin/center/payrecords.jsp?userid="+userid;
				/*mui.openWindow({
					url: "payrecords.html",
					id: "records",

					extras: {
						userid: userid,
					}
				})*/
			})
		</script>
	</body>

</html>