<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/mui.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weixin/css/mydianpu.css" />
	<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		<script type="text/javascript"
		src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
	</head>
	<body>
		<header class="mui-bar mui-bar-nav" style="background-color:#FF7900;margin-top: 0px;">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
			<h1 class="mui-title" style="color: white;">付款信息</h1>
		</header>
		<div class="mui-content">
			<div class="hang">
				<span class="zi">当前状态：</span>
	            <span class="zi">${order.status==0?"支付失败":"支付成功"}</span>
			</div>
			
			<div class="hang">
				<span class="zi">付款时间：</span>
	            <span class="zi">
	              <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.time}" />
	            </span>
			</div>
			
			<div class="hang">
				<span class="zi">原价金额：</span>
	            <span class="zi">
                     <fmt:formatNumber value="${order.price }" pattern="#.##" />            
	            </span>
			</div>
			<div class="hang">
				<span class="zi">折扣金额：</span>
	            <span class="zi">
	                <fmt:formatNumber value="${order.price*order.zhekou}" pattern="#.##" />
	            </span>
			</div>
			
			<div class="hang">
				<span class="zi">余额支付：</span>
	            <span class="zi">
	                 <fmt:formatNumber value="${order.yuer}" pattern="#.##" />
	            </span>
			</div>
			
			<div class="hang">
				<span class="zi">应付金额：</span>
	            <span class="zi">
	               <fmt:formatNumber value="${order.yinfu}" pattern="#.##" />
	            </span>
			</div>
			
			<div class="hang">
				<span class="zi">实付金额：</span>
	            <span class="zi">
	            
	                 <c:if test="${order.status==1}" var="f">
	                     <fmt:formatNumber value="${order.shifu}" pattern="#.##" />
	                </c:if>
	                
	                <c:if test="${not f}">
	                    -
	                </c:if>
	            </span>
			</div>
			<div class="hang">
				<span class="zi">转下期款：</span>
	            <span class="zi">
	                <c:if test="${order.status==1}" var="f">
	                     <fmt:formatNumber value="${order.shifu-order.yinfu}" pattern="#.##" />
	                </c:if>
	                
	                <c:if test="${not f}">
	                    -
	                </c:if>
	            </span>
			</div>
			
			
				<div class="mui-content-padded">
					<button onclick="WeixinJSBridge.call('closeWindow')" type="button" id='promptBtn' class="mui-btn mui-btn-primary mui-btn-block">
						关闭
					</button>
					&nbsp;&nbsp;
			    </div>
			
			
		</div>
		
	</body>
</html>
