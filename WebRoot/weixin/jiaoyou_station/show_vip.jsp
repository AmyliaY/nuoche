<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>认证信息</title>
		<meta charset="UTF-8">
		<meta name="viewport"
			content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/weixin/css/mui.min.css">
		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		<style>
* {
	font-family: "微软雅黑";
}
</style>
	</head>

	<body>



		<!--下拉刷新容器-->

		<div style="height: auto;">
			<div
				style="width: 100%; height: 100px; padding-top: 20px; text-align: center;">
				<img alt="我的头像" src="${touxiang }"
					style="width: 70px; height: 70px; border-radius: 50%;">
			</div>
			<div
				style="width: 100%; height: auto; padding-top: 5px; text-align: center;">
				<span style="font-size: 18px;">${user.nickname }</span>
				<br>

				<span style="margin-top: 40px; font-size: 15px; color: #8f8f94">

					<c:if test="${vipinfo.ostyle eq 1 }">柴油</c:if> <c:if
						test="${vipinfo.ostyle eq 2 }">汽油</c:if>
					${fn:substring(vipinfo.vipgrade, 1, 2)}级客户</span>
				<br />
				<c:if test="${flag eq 1 }" var="f">
					<span style="font-size: 15px; color: #3baaff; margin-top: 10px;">消费额度：${vipinfo.vlimit
						}元/月</span>
					<br />
					<span style="font-size: 15px; color: #3baaff; margin-top: 10px;">支付返现比例：&nbsp;&nbsp;&nbsp;${vipinfo.vfanxian
						}%/次</span>
					<span style="font-size: 15px; color: #3baaff; margin-top: 10px;"><br />充值返现比例：&nbsp;&nbsp;&nbsp;${vipinfo.vfanxian2
						}%/次</span>
				</c:if>
				<c:if test="${not f }">
					<span style="font-size: 15px; color: #3baaff; margin-top: 10px;">消费额度：xxxx元/月</span>
					<br />
					<span style="font-size: 15px; color: #3baaff; margin-top: 10px;">支付返现比例：xx%/次</span>
					<span style="font-size: 15px; color: #3baaff; margin-top: 10px;"><br />充值返现比例：xx%/次</span>
				</c:if>
				<br>

			</div>
		</div>

		<!--数据列表-->
		<div
			style="width: 100%; height: 100%; margin-top: 25px; font-size: 130%; background-color: white; padding-top: 38%;">
			<c:if test="${flag eq 1 }">
				<span style="margin-left: 30%; color: gray;">本月消费</span>
				<font style="color: #3baaff;"><fmt:formatNumber type="number"
						value="${vipinfo.vxiaofei }" pattern="0.00" maxFractionDigits="2" />
				</font>
				<span style="color: gray;">元</span>
				<br />
				<br />
				<span style="margin-left: 30%; color: gray;">还需消费</span>
				<font style="color: #3baaff;"><fmt:formatNumber type="number"
						value="${vipinfo.vlimit-vipinfo.vxiaofei }" pattern="0.00"
						maxFractionDigits="2" />
				</font>
				<span style="color: gray;">元</span>
				<br />
				<br />
				<span style="margin-left: 30%; color: gray;">结算剩余</span>
				<font style="color: #3baaff;">${30-vipinfo.vdays%30 }</font>
				<span style="color: gray;">天</span>
				<br />
			</c:if>
			<c:if test="${flag eq 0 }">
				<div style="width: 100%; text-align: center;">
					认证已提交
					<br />
					<br />
					请联系站长通过审核
				</div>
			</c:if>
			<c:if test="${flag eq -1 }">
				<div style="width: 100%; text-align: center;">
					上月未达成目标消费
					<br />
					<br />
					已取消优惠
					<br />
					<br />
					如需帮助请联系站长
				</div>
			</c:if>
		</div>


	</body>
	<script type="text/javascript">
	
</script>
</html>