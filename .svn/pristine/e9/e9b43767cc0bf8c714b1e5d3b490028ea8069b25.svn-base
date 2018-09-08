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
	</head>
	<style>
		#title{
			text-align: center;
		}
		
		#img{
			width: 100%;
		}
		#time{
			float: left;
		}
	</style>

	<body>
		<header class="mui-bar mui-bar-nav" style="background: #ff7900;">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
			<h1 class="mui-title" style="color: white;">通知详情</h1>
		</header>
		
		<div class="mui-content-padded" style="margin-top: 48px;">
		 <br> <h4 id="title"></h4><br>
		  <p id="time"></p><br />
		  <img id="img" width="95%" height="200px"/>
		  <br>
		  <p id="details"></p>
		</div>

		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/jquery-1.9.0.min.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/url.js"></script>
		<script type="text/javascript">
			mui.init();
			//添加newId自定义事件监听
			//window.addEventListener('tongzhiId',function(event){
			  //获得事件参数
			///document.getElementById("title").innerHTML="";
  			//document.getElementById("img").src="";
  			//document.getElementById("time").innerHTML="";
  			//document.getElementById("details").innerHTML="";
			  //var id = event.detail.id;
			//});
			//mui.plusReady(function(){
			  //关闭等待框
				//plus.nativeUI.closeWaiting();
				
				
				//var tz =plus.webview.currentWebview();
				 // 获取url中的参数
              function getUrlParam (name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                    if (r!= null) {
        				 return unescape(r[2]);
     			 	 }else{
        			 	 return null;
      				}
 		    	} 
				
				var tzid = '${param.tzid}';
				
				 //根据id向服务器请求新闻详情
			  mui.get("${pageContext.request.contextPath}/"+ "appTongzhi.do?p=getTongzhiDetails&tzid="+tzid,function(data){
			  			var js = eval("( " + data + ")");
			  			document.getElementById("title").innerHTML=js[0].tztitle;
			  			document.getElementById("img").src="${pageContext.request.contextPath}/"+js[0].tzimages;
			  			document.getElementById("time").innerHTML=js[0].tztime;
			  			document.getElementById("details").innerHTML=js[0].tzdetail;
			  });
			//});
		</script>
	</body>

</html>