<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String adname = request.getParameter("adname");
if (adname!=null)
{
   adname = new String(adname.getBytes("iso8859-1"),"utf-8");
   pageContext.setAttribute("adname",adname);
} 


String addetail = request.getParameter("addetail");
if (addetail!=null)
{
   addetail = new String(addetail.getBytes("iso8859-1"),"utf-8");
   pageContext.setAttribute("addetail",addetail);
}

String prname = request.getParameter("prname");
if (prname!=null)
{
   prname = new String(prname.getBytes("iso8859-1"),"utf-8");
   pageContext.setAttribute("prname",prname);
}

String ctname = request.getParameter("ctname");
if (ctname!=null)
{
   ctname = new String(ctname.getBytes("iso8859-1"),"utf-8");
   pageContext.setAttribute("ctname",ctname);
}

String arname = request.getParameter("arname");
if (arname!=null)
{
   arname = new String(arname.getBytes("iso8859-1"),"utf-8");
   pageContext.setAttribute("arname",arname);
}
%>
<!DOCTYPE html>
<html>
	<head>
		<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>选择区域</title>
		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		<link href="${pageContext.request.contextPath}/weixin/css/mui.min.css" rel="stylesheet" />
	
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
	</style>
	<body>
		<header class="mui-bar mui-bar-nav" style="background-color:#FF7900;margin-top: 0px;">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
			<h1 class="mui-title" style="color: white;">选择区域</h1>
		</header>		
		<div class="mui-content">
			<!--
            	<div class="mui-input-row mui-search">
					<input type="search" class="mui-input-clear" placeholder="请输入城市名称">
				</div>
			<div class="title" style="height:34px;">
				自动定位：株洲 
			</div>
            -->
			<ul class="mui-table-view" id="cityList">
				
			</ul>
		</div>
	</body>
	<script src="${pageContext.request.contextPath}/weixin/center/js/mui.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/weixin/js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript">
		mui.init();
		window.onload = function (){
			
			var ctid='${param.ctid}';
			mui.ajax("${pageContext.request.contextPath}/"+'appaddress.do?p=getAllArea&id='+ctid,{
				type:'post',
				timeout:30000,
				success:function(data)
				{
					var area=eval("("+data+")");
					var ListUl = document.getElementById("cityList");
					area.forEach(function(area){
						var ListEl = document.createElement("li");
						ListEl.classList.add("mui-table-view-cell");
						ListEl.innerHTML=area.arName;
						ListUl.appendChild(ListEl);
						ListEl.addEventListener("click",function(){
							adid = '${param.adid}';
							adId = '${param.adId}';
							adname = '${adname}';
							adphone = '${param.adphone}';
							addetail = '${addetail}';
							adstatus = '${param.adstatus}';
							prname = '${prname}';
							ctname = '${ctname}';	
							prid='${param.prid}';	//省份ID
							ctid = '${param.ctid}';
							arid = area.arId;
							arname = area.arName;
							window.location ="${pageContext.request.contextPath}/weixin/center/insert-address.jsp?adid="+adid+"&adId="+adId+"&adname="+adname+"&adphone="+adphone+"&arid="+arid+"&arname="+arname+"&prname="+prname+"&addetail="+addetail+"&adstatus="+adstatus+"&prid="+prid+"&ctname="+ctname+"&ctid="+ctid+"&if=1";
						});
					});
				}
			});
			
			
		}
	
	</script>
</html>
