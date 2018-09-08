<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String con = request.getParameter("con");
if("0".equals(con)){
	session.setAttribute("page", 0);
}

if(session.getAttribute("page") == null)
	session.setAttribute("page", 0);	

%>
<!DOCTYPE html>
<html>
<head>
<!--标准mui.css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/wap/css/mui.min.css">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/wap/css/mui.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/wap/css/icons-extra.css" />
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/wap/js/mui.min.js"></script>
<script src="${pageContext.request.contextPath}/wap/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/wap/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/wap/shuaxin.js"></script>
<style>
html,body {
	height: 100%;
}

iframe {
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.mui-active {
	color: #FF7900 !important;
}
</style>
</head>
<script type="text/javascript">
	
</script>
<body>

		<nav class="mui-bar mui-bar-tab" style="height: 10%;">
			<a id="frame_one" class="mui-tab-item <c:if test="${page == 0 }">mui-active </c:if>" href="#tabbar">
				<span class="mui-icon mui-icon-home"></span>
				<span class="mui-tab-label">首页</span>
			</a>
			
			<a id="frame_three" class="mui-tab-item <c:if test="${page == 2 }">mui-active </c:if>" href="#tabbar-with-school">
				<span class="mui-icon  mui-icon-star"></span>
				<span class="mui-tab-label">购物车</span>
			</a>
			<a id="frame_four" class="mui-tab-item <c:if test="${page == 3 }">mui-active </c:if>" href="#tabbar-with-contact">
				<span class="mui-icon mui-icon-extra mui-icon-extra-cart"></span>
				<span class="mui-tab-label">个人中心</span>
			</a>
		</nav>
	<div class="mui-content" style="height: 90%;">
			<iframe id="tabbar" class="mui-control-content   mui-iframe-wrapper <c:if test="${page == 0 }">mui-active </c:if>"     <c:if test="${page == 0 }"> src="${pageContext.request.contextPath}/wap/home/homemain.jsp"  </c:if>    frameborder="no" >
				
			</iframe>
			
			<iframe id="tabbar-with-school" class="mui-control-content mui-iframe-wrapper <c:if test="${page == 2 }">mui-active </c:if>"     <c:if test="${page == 2 }"> src=""  </c:if>            frameborder="no">
				
			</iframe>
			
			
			<iframe id="tabbar-with-contact" class="mui-control-content mui-iframe-wrapper <c:if test="${page == 3 }">mui-active </c:if>"      <c:if test="${page == 3 }"> src=""  </c:if>     frameborder="no">
			
			</iframe>
			
			
		</div>

	</div>
</body>
<script>
	mui.init({
		swipeBack : true
	//启用右滑关闭功能
	});

	window.onload = function (){
		
		document.getElementById("frame_one").addEventListener("tap", function(){
			var twc = document.getElementById("tabbar");
			if(twc.getAttribute("src")==null)
				twc.setAttribute("src","${pageContext.request.contextPath}/wap/home/homemain.jsp");
		});	
			
			
			
		document.getElementById("frame_two").addEventListener("tap", function(){
			var twc = document.getElementById("tabbar-with-chat");
			if(twc.getAttribute("src")==null)
				twc.setAttribute("src","${pageContext.request.contextPath}/wap/shop/lianmeng.jsp");
		});
		
		document.getElementById("frame_three").addEventListener("tap", function(){
			var twm = document.getElementById("tabbar-with-school");
			if(twc.getAttribute("src")==null)
				twc.setAttribute("src","");
		});
		
        document.getElementById("frame_four").addEventListener("tap", function(){
			
			var twc = document.getElementById("tabbar-with-contact");
			if(twc.getAttribute("src")==null){
				twc.setAttribute("src","");
			}
				
		});        
		
		}
		
</script>
</html>