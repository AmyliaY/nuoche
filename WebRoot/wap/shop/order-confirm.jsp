<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />
<meta content="telephone=no" name="format-detection" />
<title>订单详情</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/wap/css/base.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/wap/css/common.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/wap/js/jquery.min.js" ></script>
<script src="${pageContext.request.contextPath}/wap/js/common.js"></script>
</head>

<body>
<header class="header" id="header"  style="background-color: #3598DB;" >
<a href="javascript:history.go(-1)" target=_self class="back">返回</a>
<h1>订单详情</h1>
</header>
<!--header-end-->

<div class="container" id="container"> 

<div class="order-confirm">
<div class="order-num"><span class="fl">订单号：${yuyue.orderWx }</span></div>
<ul class="order-confirm-list clearfix order-cancel-list">
  <li><h2>预约内容</h2><span>${yuyue.service.business.shopname }*${yuyue.service.title }</span></li>
  <li><h2>创建时间</h2><span>${created }</span></li>
  <li><h2>联系电话</h2><span>${yuyue.user.wxtel }</span></li>
  <li><p>实付款：<em>￥${yuyue.pay }</em></p></li>
</ul>
<a class="pay" href="javascript:void(0)"  style="background-color: #3598DB;" onclick="topay('${yuyue.id}')">立即支付</a>
<a class="pay" href="javascript:void(0)"  style="background-color: #E86818;" onclick="cancel('${yuyue.id}')">取消订单</a>
<input type="hidden" id="openid" value="${openid }"/>
<input type="hidden" id="fuwuid" value="${yuyue.service.id }"/>
<input type="hidden" id="shopid" value="${yuyue.service.business.id }"/>
</div>
<!--order-confirm-end-->

</div>
</body>
<script type="text/javascript">

function topay(yuyueid)
{
	var openid = $("#openid").val();
	var fuwuid = $("#fuwuid").val();
	var shopid = $("#shopid").val();
	var url="${pageContext.request.contextPath}/fuwuyuyue.do?p=topay&yuyueid="+yuyueid+"&openid="+openid+"&fuwuid="+fuwuid+"&shopid="+shopid;
    window.top.location = url;
}
function cancel(yuyueid)
{
	var openid = $("#openid").val();
	var fuwuid = $("#fuwuid").val();
	var shopid = $("#shopid").val();
	var url="${pageContext.request.contextPath}/fuwuyuyue.do?p=cancel&yuyueid="+yuyueid+"&openid="+openid;
	if(window.confirm("确定要取消预约吗？"))
	{
		$.ajax({
				type:"post",
				url:url,	
				success:function(data){
					if(data =="ok")
					{
						alert("预约取消成功！正在为您跳转...");
						window.location="${pageContext.request.contextPath}/fuwuyuyue.do?p=fuwudetailbyid&fuwuid="+fuwuid+"&shopid="+shopid+"&openid="+openid;			
					}
	
				},
				error:function(){
					alert("请求提交失败，请稍后重试！");
				}
			});
	
	}
	
	
	
	
}


</script>
</html>

