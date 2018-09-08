<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 导入外部JQuery -->
<%-- <script src="${pageContext.request.contextPath}/newpc/js/jquery-1.2.6.pack.js" type="text/javascript" language="javascript"></script>
	 --%>
	 	<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/lib/layer/2.1/layer.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/lib/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/lib/static/h-ui/js/H-ui.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/lib/static/h-ui.admin/js/H-ui.admin.js"></script>
<script>
/* 	window.onload = function(){
	  var orderId = "${orderId}";
      var money = "${money}";
	alert("曾儿子就是傻逼！~");
	    $.ajax({
      	type: "POST",
      	url: "${pageContext.request.contextPath}/dailichongzhi.do?p=chongzhiSearch&money="+money+"&orderId="+orderId,
      	success: function(data){
      		alert("曾儿子是傻逼！！！");
      		if (data.equals("success"))
           {
           		alert("支付成功！！！！");p1qw sdfcnm,./khgh	
               window.clearInterval(x);
               document.getElementById("icon60").visibility = "visible";
               window.setTimeout("go()",5000);
           }
      	}
      
      });
	} */
   function checkPay()
   {
      var orderId = "${orderId}";
      var money = "${money}";
      //alert("qubuqu");
       	$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/dailichongzhi.do?p=chongzhiSearch&money="+money+"&orderId="+orderId,
			success:function(data){
			 if(data=="czsuccess")
           {
           		alert("支付成功！！！！");	
               window.clearInterval(x);
               //document.getElementById("icon60").visibility = "visible";
               window.setTimeout("go()",3000);
           }
			}
		});  
   }
   x= window.setInterval("checkPay()",4000);
   function go()
   {
   	 alert("guolail");
   	 location.replace(document.referrer);
     //location = "${pageContext.request.contextPath}/daili/back_index.jsp";
   }
</script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>微信支付</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	</head>

	<body>
		<div class="wx_header">
			<div class="wx_logo">
				<img
					src="${pageContext.request.contextPath}/newpc/images/wxlogo_pay.png" />
			</div>
		</div>

		<div class="weixin">
				<div class="wx_box_fix"
					style="background-image: ../ images/ wxbg_mail_box.png; bottom: -10px; overflow: hidden; padding: 60px 170px 100px; position: relative;">
					<div class="wx_box_area">

								<div class="wx_img_wrapper">

									<img id="payQRImg" class="code"  style="border: 1px solid blue; "
										
										src="${pageContext.request.contextPath }/tempImages/${weixinpay }"/>
								</div>
								<div class="msg_default">
									<i class="icon60" style="visibility: hidden">
									   支付成功
									</i>
									<p id="wx_saomiao">
										请使用微信扫描
									</p>
									二维码以完成支付
								</div>
					<div class="wx_money" style="margin-top: -70px">
						<span>￥</span>${money}
					</div>
					<div class="wx_pay">
						<p>
							<span class="wx_left">支付订单号</span>
							<span class="wx_right">${payId}</span>
						</p>
					</div>
		</div>






		<div id="foot">
			<div id="foot_1">
				<a class="foot_1_word" href="">首页</a><span class="foot_line">|</span>
				<a class="foot_1_word" href="">关于爱购</a><span class="foot_line">|</span>
				<a class="foot_1_word" href="">隐私声明</a><span class="foot_line">|</span>
				<a class="foot_1_word" href="">合作专区</a><span class="foot_line">|</span>
				<a class="foot_1_word" href="">加入爱购</a><span class="foot_line">|</span>
				<a class="foot_1_word" href="">联系我们</a>
			</div>
			<div id="foot_2">
				Copyright © 2011 - 2015, 版权所有 1yagw.com 闽ICP备15012237号-1
			</div>
			<div id="foot_3">
				<a href="" class="foot_3_picture" id="11"
					style="background-position: 0px 0px;"> </a>
				<a href="" class="foot_3_picture" id="22"
					style="background-position: 0px -32px;"> </a>
				<a href="" class="foot_3_picture" id="33"
					style="background-position: 0px -96px;"> </a>
				<a href="" class="foot_3_picture" id="44"
					style="background-position: 0px -64px;"> </a>
				<a href="" class="foot_3_picture" id="55"
					style="background-position: -1px -128px;"> </a>
				<a href="" class="foot_3_picture" id="66"
					style="background-position: 0px -160px;"> </a>
				<a href="" class="foot_3_picture" id="77"
					style="background-position: 0px -192px;"> </a>
			</div>
		</div>
	</body>
<!-- 	<script type="text/javascript">
	window.onload = function(){
			$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/weixinPay.do?p=toPay&money=0.01",
			success:function(data){
			alert("assdsdsas333"+Math.random(4).toString());
			}
		});
	}
	setInterval(function(){
		alert("asas"+Math.random(4).toString());
		/* 	$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/weixinPay.do?p=toPay",
			success: function(data){
			alert("assdsdsas"+Math.random(4).toString());
			}
		}); */
		alert("sdsdsdsdsaaaaaaaaaaaaa");
	}, 5000);
	
	</script> -->
</html>
